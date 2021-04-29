import requests
import pymysql.cursors
from requests import auth
from requests.auth import HTTPBasicAuth
import time


# TODO put your username password
connection = pymysql.connect(host="localhost",
                user="root",
                password="qais1995",
                db="github",
                charset="utf8mb4",
                cursorclass=pymysql.cursors.DictCursor)
oauth_token = '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'
github_token_user = 'qaysabouhousien' 
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
        
        res = requests.get(f'https://api.github.com/users/{username}', auth= HTTPBasicAuth(github_token_user, oauth_token))
        json = res.json()
        if 'followers' in json:
            followers = json['followers']
            print(followers)
            executeInsert(f'UPDATE users SET followers = {followers} WHERE id = {id}')


def repos():
    res = executeSelect("""SELECT id, login FROM  users u
    ORDER BY `followers` DESC""")
    for i in res:
        username = i['login']
        userId = i['id']
        url = f'https://api.github.com/users/{username}/repos?per_page=100'
        print(url)
        res = requests.get(url, auth= HTTPBasicAuth(github_token_user, oauth_token))
        if res.status_code != 200:
            continue
        json = res.json()
        for repo in json:
            forked_from = 0
            if 'forked_from' in repo:
                forked_from = repo['forked_from']
            desc = repo['description']
            if desc:
                desc = desc.replace('\'','')
                desc = bytes(desc, 'utf-8').decode('utf-8', 'ignore')
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
    res = executeSelect("""SELECT u.login,u.id AS user_id,p.id AS repo_id,p.name,(SELECT COUNT(*) FROM projects forks WHERE forks.forked_from = p.id)
    FROM users u
    INNER JOIN projects p ON u.id = p.owner_id

    WHERE p.forked_from = 0 AND p.id NOT IN (SELECT forked_from FROM projects forks WHERE forks.forked_from = p.id)
    ORDER BY `followers` DESC LIMIT 1000000 OFFSET 52000;""")
    for i in res:
        username = i['login']
        repo_name = i['name']
        repoId= i['repo_id']
        page = 1
        while True:
            url = f'https://api.github.com/repos/{username}/{repo_name}/forks?per_page=100&page={page}'
            print(url)
            res = requests.get(url, auth= HTTPBasicAuth(github_token_user, oauth_token))
            if res.status_code == 403:
                ratelimited = res.headers['X-RateLimit-Remaining']
                if ratelimited == "0":
                    
                    print('sleeping')
                    time.sleep(60)
                    continue
            if res.status_code != 200:
                break
            forks = res.json()
           
            for repo in forks:
                forked_from = repoId
                desc = repo['description']
                if desc:
                    desc = desc.replace('\'','')
                    desc= desc[:255]
                created_at = repo['created_at']
                if created_at:
                    created_at = created_at[:10]
                updated_at = repo['created_at']
                if updated_at:
                    updated_at = updated_at[:10]
                
                insert = f"""REPLACE INTO `projects`
                (`id`, `url`, `owner_id`, `name`, `description`, 
                `language`, `created_at`, `forked_from`, `deleted`,
                `updated_at`) 
                VALUES ({repo['id']},'{repo['url']}' , {repo['owner']['id']},
                    '{repo['name']}','{desc}','{repo['language']}' ,
                    '{created_at}', {forked_from}, 0, '{updated_at}');"""
                print(insert)
                executeInsert(insert)
            if len(forks) < 100:
                break
            page+=1

forks()

# def test():
#     page = 1
#     while True:
#         url = f'https://api.github.com/repos/JakeWharton/ActionBarSherlock/forks?per_page=100&page={page}'
#         print(url)
#         res = requests.get(url, auth= HTTPBasicAuth(github_token_user, oauth_token))
#         if res.status_code != 200:
#             break
#         forks = res.json()
        
#         for repo in forks:
#             forked_from = 1451060
#             desc = repo['description']
#             if desc:
#                 desc = desc.replace('\'','')
#                 desc= desc[:255]
#             created_at = repo['created_at']
#             if created_at:
#                 created_at = created_at[:10]
#             updated_at = repo['created_at']
#             if updated_at:
#                 updated_at = updated_at[:10]
            
#             insert = f"""REPLACE INTO `projects`
#             (`id`, `url`, `owner_id`, `name`, `description`, 
#             `language`, `created_at`, `forked_from`, `deleted`,
#             `updated_at`) 
#             VALUES ({repo['id']},'{repo['url']}' , {repo['owner']['id']},
#                 '{repo['name']}','{desc}','{repo['language']}' ,
#                 '{created_at}', {forked_from}, 0, '{updated_at}');"""
#             print(insert)
#             executeInsert(insert)
#         if len(forks) < 100:
#             break
#         page+=1
# test()