[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# install z
. /usr/local/etc/profile.d/z.sh

# npm global install
export PATH="/usr/local/Cellar/node/10.12.0/lib/node_modules:$PATH"

# fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# android home
export ANDROID_HOME=/Users/trflagg/Library/Android/sdk

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
