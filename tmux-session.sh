#!/bin/bash
############################
# create tmux session
############################
session="work"
tmux new-session -A -s ${session} -n forty \; \
    send-keys -t ${session}:forty 'sudo openfortivpn -c ~/development/openforti.config' C-m \; \
    new-window -n docker -c ~/workspaces/hcs_local_deploy \; \
    send-keys 'sudo docker-compose up --build' C-m \; \
    new-window -n hcs -c ~/workspaces/hcs \; \
    send-keys 'vimxs' C-m \;
