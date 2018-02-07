# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# set following ENV in .bash_profile file
#export JAVA_HOME=$HOME/development/jdk1.8.0_112
#export GRADLE_HOME=$HOME/development/gradle-2.14.1
#export HIVE_HOME=$HOME/frameworks/apache-hive-1.2.1-bin
#export HADOOP_HOME=$HOME/frameworks/hadoop-2.6.1
#export HADOOP_USER_CLASSPATH_FIRST=true
#export SPARK_HOME=$HOME/frameworks/spark-1.6.0-bin-hadoop2.6

#PATH=$PATH:$HOME/.local/bin:$HOME/bin:$GRADLE_HOME/bin:$JAVA_HOME/bin
#export PATH

# run init solarized color
# git clone https://github.com/mavnn/mintty-colors-solarized.git 
#$HOME/mintty-colors-solarized/sol.dark

git config --global merge.conflictstyle diff3
git config --global merge.tool 'my-git-merge'
git config --global mergetool.my-git-merge.cmd 'my-git-merge.sh "$BASE" "$LOCAL" "$REMOTE" "$MERGED"'
git config --global mergetool.trustExitCode false 
git config --global mergetool.keepBackup false
git config --global diff.external my-git-diff.sh

# tmux settings see https://github.com/tmux-plugins/tpm
#git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

