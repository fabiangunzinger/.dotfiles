# .zshrc, fabian gunzinger

source ~/.zshrc.omz
source ~/.zshrc.general
if [[ $(whoami) == "fgu" ]]; then
    source ~/.zshrc.fabmac
else
    source ~/.zshrc.workmac
fi

