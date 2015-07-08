#!/bin/bash
#myscript.sh
case $1 in
    start)
       echo "start my script!!"
       sleep 1
       ;;

    restart)
       echo "restart my script!!"
       sleep 1
       ;;

    stop)
       echo "stop my script!!"
       sleep 1
       ;;

    *) 
       echo "please input start|restart|stop"
       sleep 1
       ;;  
esac
