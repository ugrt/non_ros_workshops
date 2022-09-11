#!/bin/bash

sudo ssh-keygen -A
sudo service ssh start
jupyter-lab --ip 0.0.0.0 --no-browser --NotebookApp.token='' --NotebookApp.password=''
# /usr/sbin/sshd -D

wait -n

exit $?