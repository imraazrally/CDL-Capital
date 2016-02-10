#!/usr/bin/python

from database_class import DB
from yahoo_finance_class import YQLQuery

START_YQL = "select * from yahoo.finance.quotes where symbol in ('"
END_YQL = "');"

db = DB("localhost","root","mmGr2016","cdlcapital")
result = db.get_stock_symbols()

yql = YQLQuery()
result_string=""
count = 0
final_count=0

for i in result:
    final_count = final_count + 1
    count = count + 1
    if "^" in i[0]:
        continue
    result_string+=i[0] + ","
    if count == 100:
        result_string = result_string.replace(" ","")
        print yql.execute(START_YQL + str(result_string) + END_YQL)
        print final_count
        count = 0
        result_string=""

                                                            