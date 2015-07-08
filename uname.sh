#!/bin/bash
for i in `ls /home`
do
	id -u $i
done
