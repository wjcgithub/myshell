#!/bin/bash
goa="/home/software/google_appengine/goagent-3.0/local/goagent-gtk.py"
if [ -f $goa ]; then
  echo $goa
  nohup python $goa &>/dev/null &
else
  if [ ! -e "/home/shell/shell.log" ]; then
    touch /home/shell/shell.log
  fi
  echo $(date +%F)."----->gtl not font" >> /home/shell/shell.log
fi
