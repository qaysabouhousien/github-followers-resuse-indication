import pymysql.cursors

class DBConnection:
    def __init__(self) -> None:
        self.connection = pymysql.connect(host="localhost",
                user="root",
                password="qais1995",
                db="github",
                charset="utf8mb4",
                cursorclass=pymysql.cursors.DictCursor)

    def executeSelect(self,query):
        with self.connection.cursor() as cursor:
            cursor.execute(query)
            self.connection.commit()
            result = cursor.fetchall()
            return result

    def executeInsert(self,query):
        with self.connection.cursor() as cursor:
            cursor.execute(query)
            self.connection.commit()
            return cursor.lastrowid

