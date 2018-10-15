#!/usr/bin/python

import urllib, urllib2, base64, datetime, json, math, time

url = 'http://api.coindesk.com/v1/bpi/currentprice.json'
headers = { 'User-Agent' : 'Mozilla/5.0' }
request = urllib2.Request(url, None, headers)
response = urllib2.urlopen(request)
jsonResponseString = response.read()
jsonResponse = json.loads(jsonResponseString)

price = float(jsonResponse['bpi']['USD']['rate'].replace(',',''))
price = round(price, 2)

print str(price) + ' USD'

