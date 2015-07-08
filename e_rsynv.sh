#!/bin/bash
sync_dryrun(){
  rsync -av --delete /tmp/test_rsync/ root@10.1.1.184 --dry-run
}

sync_server(){
  rsync -av --delete /tmp/test_rsync/ root@10.1.1.184
}

sync_dryrun

echo -n "Want to sync(Y/n):"

read pd

if [ "${pd:-y}" = "y" ]; then
    sync_server
  else
    echo Nothing done, bye.
fi
