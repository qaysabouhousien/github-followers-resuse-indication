from statsmodels.tsa.ar_model import AutoReg
from statsmodels.tsa.arima.model import ARIMA
from random import random
from db_connector import DBConnection
# contrived dataset
# data = [x + random() for x in range(1, 100)]
# # AR example
# # fit model
# model = AutoReg(data, lags=1,old_names=False)
# model_fit = model.fit()
# # make prediction
# yhat = model_fit.predict(len(data), len(data))
# print(yhat)


# # MA example
# # fit model
# model = ARIMA(data, order=(0, 0, 1))
# model_fit = model.fit()
# # make prediction
# yhat = model_fit.predict(len(data), len(data))
# print(yhat)
db_con = DBConnection()

def repository_first_fork_date(repository_id):
    q= f"""
        SELECT MIN(DATE(created_at)) min_date FROM projects WHERE forked_from = {repository_id} 
    """
    res=  db_con.executeSelect(q)
    return res[0]['min_date']

"""
last_10000_days is a view, the following is it's create code :
ALTER ALGORITHM = UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `last_1000_days` AS select (curdate() - interval (((`a`.`a` + (10 * `b`.`a`)) + (100 * `c`.`a`)) + (1000 * `d`.`a`)) day) AS `days` from ((((select 0 AS `a` union all select 1 AS `1` union all select 2 AS `2` union all select 3 AS `3` union all select 4 AS `4` union all select 5 AS `5` union all select 6 AS `6` union all select 7 AS `7` union all select 8 AS `8` union all select 9 AS `9`) `a` join (select 0 AS `a` union all select 1 AS `1` union all select 2 AS `2` union all select 3 AS `3` union all select 4 AS `4` union all select 5 AS `5` union all select 6 AS `6` union all select 7 AS `7` union all select 8 AS `8` union all select 9 AS `9`) `b`) join (select 0 AS `a` union all select 1 AS `1` union all select 2 AS `2` union all select 3 AS `3` union all select 4 AS `4` union all select 5 AS `5` union all select 6 AS `6` union all select 7 AS `7` union all select 8 AS `8` union all select 9 AS `9`) `c`) join (select 0 AS `a` union all select 1 AS `1` union all select 2 AS `2` union all select 3 AS `3` union all select 4 AS `4` union all select 5 AS `5` union all select 6 AS `6` union all select 7 AS `7` union all select 8 AS `8` union all select 9 AS `9`) `d`) ;
"""
def repository_time_series(repository_id):
    start_date = repository_first_fork_date(repository_id)
    q = f"""
        SELECT YEAR(d.days) year ,MONTH(d.days) month ,COUNT(DISTINCT p.id) count 
        FROM last_10000_days d
        LEFT JOIN projects p ON DATE(p.created_at) = d.days AND p.forked_from = {repository_id}
        WHERE d.days >='{start_date}'
        GROUP BY YEAR(d.days),MONTH(d.days)
        ORDER BY YEAR(d.days),MONTH(d.days)
    """
    print(q)
    res = db_con.executeSelect(q)
    count = [i['count'] for i in res]
    return count

def repo_time_series(repo_id):
    start_date = repository_first_fork_date(repo_id)
    q = f"""
    SELECT YEAR(p.created_at) year, MONTH(p.created_at) month ,COUNT(*) count
    FROM projects p
    WHERE forked_from = {repo_id}
    GROUP BY YEAR(p.created_at), MONTH(p.created_at)
    ORDER BY YEAR(p.created_at), MONTH(p.created_at)
    """
    all_months_q = f"""
        SELECT YEAR(days) year, MONTH(days) month
        FROM last_10000_days d
        WHERE days BETWEEN  '{start_date}' AND '2021-04-30'
        GROUP BY YEAR(days), MONTH(days)
        ORDER BY YEAR(days), MONTH(days)   
    """
    res = db_con.executeSelect(q)
    all_months = db_con.executeSelect(all_months_q)
    for i in range(len(all_months)):
        p = res[i]
        m = all_months[i]
        # print(p)
        # print(m)
        if p['year'] != m['year'] and p['month'] != m['month']:
            print(p)
            print(m)
            break
    return [i['count'] for i in res]


def arima_prediction(time_series):
    model = ARIMA(time_series, order=(2, 0, 1))
    model_fit = model.fit()
    # make prediction
    yhat = model_fit.predict(len(time_series), len(time_series))
    print(yhat)

counts = repo_time_series(1451060)
arima_prediction(counts)