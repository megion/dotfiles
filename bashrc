# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

export JAVA_HOME=$HOME/development/jdk1.8.0_112

export GRADLE_HOME=$HOME/development/gradle-2.14.1

#export HIVE_HOME=$HOME/frameworks/apache-hive-1.2.1-bin

#export HADOOP_HOME=$HOME/frameworks/hadoop-2.6.1

#export HADOOP_USER_CLASSPATH_FIRST=true

#export SPARK_HOME=$HOME/frameworks/spark-1.6.0-bin-hadoop2.6

#PATH=$PATH:$HOME/.local/bin:$HOME/bin:$GRADLE_HOME/bin:$HIVE_HOME/bin:$JAVA_HOME/bin
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$GRADLE_HOME/bin:$JAVA_HOME/bin

export PATH

# run init solarized color
# git clone https://github.com/mavnn/mintty-colors-solarized.git 
$HOME/mintty-colors-solarized/sol.dark

#export SVN_EDITOR='\
	#vim -c "4,\$y" \
	#-c "below new" \
	#-c "put" \
	#-c "set syntax=diff buftype=nofile nowrap nobackup previewwindow bufhidden=delete" \
	#-c "silent execute \"%!cut -c-5 --complement | xargs svn diff --no-diff-deleted -x --ignore-eol-style\" | redraw" \
	#-c "wincmd k" +0'

