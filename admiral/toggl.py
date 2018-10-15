#!/usr/bin/python

import urllib, urllib2, base64, datetime, json, math, time

API_TOKEN='ea63b6849d06970b15dfb9bd1ad0a87a'
workHours = 8;

current_date = datetime.datetime.today()
start_date = datetime.datetime(current_date.year, current_date.month, current_date.day).isoformat() + '+02:00'
end_date = datetime.datetime(current_date.year, current_date.month, current_date.day, 23, 59, 59).isoformat() + '+02:00'

url = 'https://www.toggl.com/api/v8/time_entries?start_date=' + urllib.quote_plus(start_date) + '&end_date=' + urllib.quote_plus(end_date)
request = urllib2.Request(url)
request.add_header('Authorization', b'Basic ' + base64.b64encode(API_TOKEN + b':' + 'api_token'))
response = urllib2.urlopen(request)
jsonResponseString = response.read()
jsonResponse = json.loads(jsonResponseString)

totalSeconds = 0
for timeEntry in jsonResponse:
    if (timeEntry['duration'] < 0):
        # task in progress
        currentTime = int(time.time())
        totalSeconds += currentTime + timeEntry['duration']
    else:
        totalSeconds += timeEntry['duration']


totalSeconds = 28981

workSeconds = 60 * 60 * workHours
remainingSeconds = workSeconds - totalSeconds
print "remainingSeconds: " + str(remainingSeconds)

remainingHours = remainingSeconds / 60 / 60.0
print "remainingHours: "  + str(remainingHours)

remainingSeconds = remainingSeconds - (remainingHours * 60 * 60)
print "remainingSeconds: " + str(remainingSeconds)

remainingMinutes = remainingSeconds / 60.0;
print "remainingMinutes: " + str(remainingMinutes)

print str(int(remainingHours)) + 'h' + str(int(remainingMinutes)) + 'm'



#workHours = 8
#remaining = workHours - totalSeconds / 60 / 60.0
#hoursRemaining = int(remaining)
#minutesRemaining = int((workHours - totalSeconds / 60 / 60.0 - hoursRemaining) * 60)

#negative = ''
#if (remaining < 0):
#    negative = '-'

#print negative + str(abs(hoursRemaining)) + 'h' + str(abs(minutesRemaining)) + 'm'
