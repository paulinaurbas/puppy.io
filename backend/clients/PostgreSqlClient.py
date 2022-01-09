import psycopg as ps
import helpers.QueryHelper as qh

connection_string = "dbname=puppyio user=postgres password=Admin host=localhost"

class PostgreSqlClient:

    def __init__(self):
        self.connection = ps.connect(connection_string)

    def query(self, query):
        cursor = self.connection.cursor()
        cursor.execute(query=query)
        result = cursor.fetchall()
        cursor.close()

        return result

    def query_with_parameters(self, query: str, parameters: dict):
        return self.query(qh.resolve_query(query, parameters))

    def execute(self, query: str):
        cursor = self.connection.cursor()
        cursor.execute(query=query)
        self.connection.commit()
        cursor.close()

    def execute_with_parameters(self, query: str, parameters: dict):
        return self.execute(qh.resolve_query(query, parameters))
