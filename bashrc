# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# set following ENV in .bash_profile file
#============================================================
#export JAVA_HOME=$HOME/development/jdk1.8.0_112
#export GRADLE_HOME=$HOME/development/gradle-2.14.1
#export MAVEN_HOME=$HOME/development/apache-maven-3.5.3

#export HIVE_HOME=$HOME/frameworks/apache-hive-1.2.1-bin
#export HADOOP_HOME=$HOME/frameworks/hadoop-2.6.1
#export HADOOP_USER_CLASSPATH_FIRST=true
#export SPARK_HOME=$HOME/frameworks/spark-1.6.0-bin-hadoop2.6

#export JAVA_OPTS="-Xmx4G"
#export GRADLE_OPTS="-Xmx4G"

#export PATH=$PATH:$HOME/.local/bin:$HOME/bin:$MAVEN_HOME/bin:$GRADLE_HOME/bin

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#export PATH="$PATH:$HOME/.rvm/bin"

# to avoid error: FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed -
# JavaScript heap out of memory
#export NODE_OPTIONS="--max-old-space-size=8192"

#export TERM=screen-256color

#============================================================

git config --global merge.conflictstyle diff3
git config --global merge.tool 'my-git-merge'
git config --global mergetool.my-git-merge.cmd 'my-git-merge.sh "$BASE" "$LOCAL" "$REMOTE" "$MERGED"'
git config --global mergetool.trustExitCode false 
git config --global mergetool.keepBackup false
#git config --global diff.external my-git-diff.sh
git config --global core.excludesfile $HOME/.gitignore

## Colorize the ls output ##
alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -la'

## Show hidden files ##
alias l.='ls -d .* --color=auto'

alias gnome-terminal='gnome-terminal --full-screen'
alias xfce4-terminal='gnome-terminal --maximize'
alias tmux='TERM=screen-256color tmux -2'

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ilya/.sdkman"
[[ -s "/home/ilya/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ilya/.sdkman/bin/sdkman-init.sh"

export TERM=screen-256color       # for a tmux -2 session (also for screen)
dircolorsDir=~/workspaces/configs/dircolors-solarized
eval `dircolors $dircolorsDir/dircolors.256dark`
#eval `dircolors $dircolorsDir/dircolors.ansi-light`

# TMUX config
if [ -z "$TMUX" ]; then
    #base_session="${USER}_session"
    base_session="work"
    # Create a new session if it doesn't exist
    tmux has-session -t $base_session || tmux new-session -d -s $base_session -n forty \; \
    send-keys -t ${session}:forty 'sudo openfortivpn -c ~/development/openforti.config' C-m \; \
    new-window -n docker -c ~/workspaces/hcs_local_deploy \; \
    send-keys 'sudo docker-compose up --build' C-m \; \
    new-window -n hcs -c ~/workspaces/hcs \; \
    send-keys 'vimxs' C-m \;

    #client_cnt=$(tmux list-clients | wc -l)
    # Are there any clients connected already?
    #if [ $client_cnt -ge 1 ]; then
        #client_id=0
        #session_name=$base_session"-"$client_id
        #while [ $(tmux has-session -t $session_name 2>& /dev/null; echo $?) -ne 1 ]; do
            #client_id=$((client_id+1))
            #session_name=$base_session"-"$client_id
        #done
        #tmux new-session -d -t $base_session -s $session_name
        #tmux -2 attach-session -t $session_name \; set-option destroy-unattached
    #else
        #tmux -2 attach-session -t $base_session
    #fi

    tmux -2 attach-session -t $base_session
fi
