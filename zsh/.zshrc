# .zshrc, fabian gunzinger

source ~/.zshrc.omz
source ~/.zshrc.general
source ~/.zshrc.workmac
source ~/.zshrc.fabmac

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fabian.gunzinger/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/fabian.gunzinger/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/fabian.gunzinger/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/fabian.gunzinger/google-cloud-sdk/completion.zsh.inc'; fi

# FZF confg
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

