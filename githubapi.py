import requests
import pymysql.cursors
from requests import auth
from requests.auth import HTTPBasicAuth


# TODO put your username password
connection = pymysql.connect(host="localhost",
                user="",
                password="",
                db="github",
                charset="utf8mb4",
                cursorclass=pymysql.cursors.DictCursor)
def executeSelect(query):
    with connection.cursor() as cursor:
        cursor.execute(query)
        connection.commit()
        result = cursor.fetchall()
        return result


def executeInsert(query):
    with connection.cursor() as cursor:
        cursor.execute(query)
        connection.commit()
        return cursor.lastrowid



def followers():
    res = executeSelect('select id,login from users')
    for i in res:
        username = i['login']
        id = i['id']
        
        res = requests.get(f'https://api.github.com/users/{username}', auth= HTTPBasicAuth('qaysabouhousien', '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'))
        json = res.json()
        if 'followers' in json:
            followers = json['followers']
            print(followers)
            executeInsert(f'UPDATE users SET followers = {followers} WHERE id = {id}')


def repos():
    res = executeSelect("""SELECT id, login FROM  users u
    WHERE u.followers > 1000
    ORDER BY `followers` DESC;""")
    for i in res:
        username = i['login']
        userId = i['id']
        res = requests.get(f'https://api.github.com/users/{username}/repos?per_page=100', auth= HTTPBasicAuth('qaysabouhousien', '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'))
        json = res.json()
        for repo in json:
            forked_from = 0
            if 'forked_from' in repo:
                forked_from = repo['forked_from']
            desc = repo['description']
            if desc:
                desc = desc.replace('\'','')
            insert = f"""INSERT IGNORE INTO `projects`
            (`id`, `url`, `owner_id`, `name`, `description`, 
            `language`, `created_at`, `forked_from`, `deleted`,
             `updated_at`) 
             VALUES ({repo['id']},'{repo['url']}' , {userId},
                '{repo['name']}','{desc}','{repo['language']}' ,
                '{repo['created_at']}', {forked_from}, 0, '{repo['updated_at']}');"""
            print(insert)
            executeInsert(insert)
def forks():
    # /repos/{owner}/{repo}/forks
    res = executeSelect("""SELECT u.login,p.id,p.name FROM  users u
    INNER JOIN projects p ON u.id = p.owner_id
    WHERE u.followers > 1000 
    ORDER BY `followers` DESC;""")
    for i in res:
        username = i['login']
        repo_name = i['name']
        repo_id = i['id']
        # TODO Continue From Here...


