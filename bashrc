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

export YVM_DIR=/home/ilya/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/bash/__tabtab.bash ] && . ~/.config/tabtab/bash/__tabtab.bash || true

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

# Start tmux automatically
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
# Otherwise start tmux
[[ -z "$TMUX" ]] && exec ~/dotfiles/tmux-session.sh
