import psycopg as ps
import helpers.QueryHelper as qh

connection_string = "dbname=d6bkm1kfebraf host=ec2-52-211-158-144.eu-west-1.compute.amazonaws.com port=5432 user=fgimujhscshfaa password=28e03bf7607aa9e7e2a8f349a61766a7f229e1aeb7d214f42cdf67e9cfdcbe79 sslmode=require"

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
