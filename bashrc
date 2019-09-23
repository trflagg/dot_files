[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# install z
. /usr/local/etc/profile.d/z.sh

# npm global install
export PATH="/usr/local/lib/node_modules:$PATH"

# pip3
export PATH="/Users/trflagg/Library/Python/3.7/bin:$PATH"

# fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# use global mongo config installed by homebrew
alias mongod="mongod --config /usr/local/etc/mongod.conf"

# user-level gems
export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH"
export GEM_HOME="$HOME/.gem/ruby/2.3.0"

export EDITOR="/usr/local/bin/nvim"

# tmuxinator completion
source ~/.bin/tmuxinator.bash

# android home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# set completion and prompt
source ~/.git-completion.bash
. ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=2
function color_my_prompt {
  local __user_and_host="\[\033[01;32m\]\u@\h"
  local __cur_location="\[\033[01;34m\]\W"
  local __git_branch_color="\[\033[31m\]"
  #local __git_branch="\`ruby -e \"print (%x{git branch 2> /dev/null}.grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`"
  local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
  local __prompt_tail="\[\033[35m\]$"
  local __last_color="\[\033[00m\]"
  export PS1="$__user_and_host $__cur_location $__git_branch_color$__git_branch$__prompt_tail$__last_color "
}
color_my_prompt

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# check what's listening on a port
pidportfunction() {
  lsof -n -i4TCP:$1 | grep LISTEN
}

alias pidport=pidportfunction

# swap neovim for vim
export VISUAL=nvim
alias vim=nvim
alias vi=nvim
