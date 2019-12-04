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

#============================================================

git config --global merge.conflictstyle diff3
git config --global merge.tool 'my-git-merge'
git config --global mergetool.my-git-merge.cmd 'my-git-merge.sh "$BASE" "$LOCAL" "$REMOTE" "$MERGED"'
git config --global mergetool.trustExitCode false 
git config --global mergetool.keepBackup false
#git config --global diff.external my-git-diff.sh

## Colorize the ls output ##
alias ls='ls --color=auto'

## Use a long listing format ##
alias ll='ls -la'

## Show hidden files ##
alias l.='ls -d .* --color=auto'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
