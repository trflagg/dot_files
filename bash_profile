if [ -f $HOME/.bashrc ]; then
  source $HOME/.bashrc
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/var/google-cloud-sdk/path.bash.inc' ]; then . '/usr/local/var/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/usr/local/var/google-cloud-sdk/completion.bash.inc' ]; then . '/usr/local/var/google-cloud-sdk/completion.bash.inc'; fi
