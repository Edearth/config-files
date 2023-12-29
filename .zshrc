# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# oh-my-zsh init
export ZSH="/home/edearth/.oh-my-zsh"
ZSH_THEME="agnoster"
source $ZSH/oh-my-zsh.sh

# @edearth: PATH and Environment Variables
ANDROID_SDK_ROOT=/opt/android-sdk
PATH=$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

EDITOR='vim'
VISUAL='vim'

PYTHON_USER_SITE="$HOME/.local"
PATH="$PYTHON_USER_SITE/bin:$PATH"

# Scripts
PATH=$HOME/Scripts:$PATH

####
# Clean home directory (start)
####

# zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history
mkdir -p "$XDG_CACHE_HOME/zsh"
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# javascript
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc

mkdir -p "$XDG_DATA_HOME"/wineprefixes
export WINEPREFIX="$XDG_DATA_HOME"/wineprefixes/default 

export SSB_HOME="$XDG_DATA_HOME"/zoom
export CRAWL_DIR="$XDG_DATA_HOME"/crawl/
export VSCODE_PORTABLE="$XDG_DATA_HOME"/vscode
export PARALLEL_HOME="$XDG_CONFIG_HOME"/parallel
export PYLINTHOME="$XDG_CACHE_HOME"/pylint

####
# Clean home directory (end)
####

####
# Aliases
####

alias open="xdg-open"

friends_file="~/Documents/obsidian/nepo/friends.md"
alias friends="friends --filename=\"$friends_file\""

# TODO: test after config update! It might fail since .Xresources was removed
# @edearth: if on virtual console, use .Xresources color scheme
if [ "$TERM" = "linux" ]; then
    _SEDCMD='s/.*\*color\([0-9]\{1,\}\).*#\([0-9a-fA-F]\{6\}\).*/\1 \2/p'
    for i in $(sed -n "$_SEDCMD" $HOME/.Xresources | awk '$1 < 16 {printf "\\e]P%X%s", $1, $2}'); do
        echo -en "$i"
    done
    clear
fi

echo "Date: `date '+%a %W %b %Y | %H:%M'`"

