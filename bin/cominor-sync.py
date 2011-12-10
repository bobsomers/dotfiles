#!/usr/bin/env python

import sys
import os
import subprocess

REMOTE_PATH = "cominor:Code"

if __name__ == '__main__':
   if len(sys.argv) > 1:
      tokens = sys.argv[1].split("/")
      if tokens[0] == '' and tokens[1] == 'Users' and tokens[2] == 'bsomers' and tokens[3] == 'Code':
         local_file = sys.argv[1]
         remote_file = "/".join(tokens[4:])
         cmd = "rsync %s %s/%s" % (local_file, REMOTE_PATH, remote_file)
         print "Syncing to cominor...",
         sys.stdout.flush()
         subprocess.call(cmd, shell=True)
         print " done!"
