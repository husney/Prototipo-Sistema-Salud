import pyodbc
from db import connString

class Cursor():
    
    def __init__(self):
        self.__db = pyodbc.connect(connString)
        self.__cursor = None
        
    def __enter__(self):
        try:
            #self.__db.connect.cursor()
            self.__cursor = self.__db.cursor()
            return self.__cursor
        except Exception as ex:
            return None
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        try:
            if exc_type:
                self.__db.rollback()
            else:
                self.__cursor.nextset()
                self.__cursor.commit()
            self.__cursor.close()
            self.__db.close()
        except Exception as ex:
            pass