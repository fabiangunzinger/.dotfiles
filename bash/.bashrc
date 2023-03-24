# fabian gunzinger's .bashrc

#################################################
# dev
#################################################

alias dth='cd ~/dev/projects/warwickthesis'
alias dje='cd ~/dev/projects/justeat'

# hugo

function hnp() { hugo new --kind post content/post/$1; }
alias hs='hugo server -D'
alias nbc='jupyter nbconvert --to html'

# blog
alias dwo='dpr; cd wowchemy'
alias dwop='dwo; cd content/post'
alias dwoc='dwo; cd config/_default'
alias awo='dwop; ca wow'
alias jwo='awo; jula'

# git and github
alias ghrc='gh repo create'         # interactively create a new repo
alias ghp='git help'                # ..git verb for which help is needed
alias gs='git status --short'       # cols are staging area and working-tree
alias gsv='git status'              # verbose status
alias gl='git log --oneline -3'     # oneline log
alias glv='git log -3'              # verbose log
alias gd='git diff'                 # .. ref a and b, defaults to wd and idx
alias gds='git diff --staged'       # diff between index and last commit
alias gsw='git show'                # show some object
alias gt='git tag'                  # ..tagname for last commit, dft lists tags

alias ga='git add'                  # .. file to stage (move to index)
alias gaa='git add --all'           # add all modified files to index
alias gap='git add --patch'         # stage individual hunks
alias gc='git commit --verbose'     # show diff in editor
alias gcm='git commit --message'    # commit with inline message
alias gca='gc --all'                # commit all tracked files
alias gcam='gca --message'          # above with inline message
alias gcad='gc --amend'             # add changes to last commit or edit msg
alias gcadn='gcad --no-edit'        # add changes to last commit (keep msg)

alias grm='git rm'                  # ..fn to remove, then stage for commit
alias grmc='git rm --cached'        # ..fn to remove from index but not wd
alias gre='git restore'             # ..fn to revert back to state of last commit
alias gres='git restore --staged'   # ..fn to remove from index
# alias grts='git reset --soft'

alias gsh='git stash'               # save current state of working tree
alias gshl='gsh list'               # list stored stashes
alias gsha='gsh apply'              # ..stash ref (sr) to apply, default is last
alias gshd='gsh drop'               # ..sr to drop, default is last
alias gshp='gs pop'                 # apply and delete (last)
alias gshb='gs branch'              # ..sr to create branch from, dft is last
alias gcn='git clean'               # ..fn to be removed from wd
alias gcnn='gc --dry-run'           # dry run of above

alias gph='git push'                # move remote pointer to match local one 
alias gphu='gph --set-upstream origin' # ..branch name of remote
alias gphd='gph origin --delete'   # ..refs to delete (e.g. branchname)
alias gf='git fetch'                # download new files from remote (no merge)
alias gpl='git pull'                # download and merge new files from remote

alias gb='git branch -vv'           # list branches
alias gbm='gb --merged'             # list bs already merged into current b
alias gbnm='gb --no-merged'         # list bs not yet merged into current b
alias gbme='git branch --move'      # rename by appending <oldname> <newname>
alias gsb='git switch'               # switch to branch (or get from remote)
alias gsc='git switch --create'     # create new branch and switch to it
alias gsp='git switch -'            # switch to previously checked out branch
alias gsm='git switch main'         # switch to main branch
alias gm='git merge'                # merge branch
alias gbd='git branch -d'           # delete branch
alias gbdf='git branch -D'          # force delete branch with uncommited edits

function gacp() { gaa; gcm "$1"; gph; } # add, commit, and push all files


#################################################
# aliases
#################################################

# temp
alias ddh='cd ~/dev/projects/dahel'

# restore entropy paper which gets automatically updated when
# switching branches
alias grp='gr text/paper/entropy.pdf'

# bash
alias sb='source ~/.bashrc'
alias la='ls -a'
alias ll='ls -oh'
alias lsa='ls -aho'
alias lg='lla | grep $1'
alias cpwd='pwd | pbcopy'

alias ..='cd ..'
alias ...='cd ../..'

alias rmd='rm -rfi '

# running processes
alias rp='ps aux | grep '               # ..pattern; list processes
alias rpl='ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10' # list largest
alias rpk='kill'                        # ..process id to kill

# search file in current folder (non-recursive, and recursive)
alias f='find . -maxdepth 1 | grep '
alias ff='find . | grep '

# look up word from dictionary
function lu() { open dict://"$1"; }

# system shutdown (also shuts down aws instance) and reboots
alias ss='atesp; sudo shutdown -h now'
alias sr='sudo shutdown -r now'

# start of day
alias jk='open /System/Applications/Calendar.app; open /System/Applications/Notes.app'

# disk space and directory structure
alias dum='du -h | sort -n -r | more'
alias dud='du -h -d 2'
alias t='tree -I __*'
alias td='tree -dI __*'

# terraform
alias tf='terraform'
alias tfi='tf init'
alias tfa='tf apply'
alias tfo='tf output'
alias tfoi='tf output instance_id'
alias tfs='tf show'
alias tfd='tf destroy'

# tmux
alias tmls='tmux ls'
function tmsn() { tmux new -s $1; }
function tmsa() { tmux attach-session -t $1; }
function tmsk() { tmux kill-session -t $1; }

# misc. commands
alias jula='jupyter lab'
alias clh='open -a safari https://localhost:9999'
alias sdo='StataSE -e do'
alias vi='nvim'
alias vgp='vimgolf put '

# go to directory
alias daw='cd ~/.aws'
alias dde='cd ~/dev'
alias dpr='dde; cd projects'
alias drm='dde; cd remote'
alias dli='cd ~/dev/projects/limo'
alias dcl='cd ~/dev/projects/clean-cleaning'
alias dap='cd ~/dev/projects/applications'
alias dapc='cd ~/dev/projects/applications/interview-prep/code'
alias dfa='cd ~/dev/projects/fabiangunzinger.github.io'
alias den='cd ~/dev/projects/entropy/'
alias dent='den; cd text'
alias deni='den; cd infra'
alias dle='cd ~/dev/projects/learning/'
alias dml='cd ~/dev/projects/mlbt/'
alias dmlp='cd ~/dev/projects/mlbt/text/paper'
alias dmd='cd ~/dev/projects/mdb/'
alias dbl='dpr; cd blog'
alias dblp='dbl; cd _posts'
alias dbln='dbl; cd _notebooks'
alias dfo='cd ~/dev/projects/food-tracker'
alias dte='cd ~/dev/projects/tracktheeconomy'
alias dtea='cd ~/dev/projects/te/admin'
alias dter='cd ~/dev/projects/te/research'
alias ddf='cd ~/dev/projects/dotfiles'
alias dsu='cd ~/setup/SublimeProjects'
alias dad='cd ~/Library/Application\ Support/Stata/ado/personal'
alias dla='cd /Users/fgu/Library/texmf/tex/latex/styfiles/'
alias dju='cd /Users/fgu/Library/Jupyter/snippets'
alias dic='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias dfab='dic; cd fab'
alias dre='dfab; cd library/resources'
alias dpa='dfab; cd library/papers'

# open directory
alias ore='dre; open .'
alias opa='dpa; open .'

# files
alias fb='vi ~/.bashrc'
alias fbb='vi ~/.bashrc'
alias ftm='vi ~/.tmux.conf'
alias fvr='vi ~/.config/nvim/init.vim'
alias fvi='cd ~/dev/projects/blog/_posts/; pe vim.md'
alias fgi='cd ~/dev/projects/blog/_posts/; pe git.md'
alias fre='dblp; vi 2021-09-11-regex.md'
alias frc='open ~/'
alias fcv='vi /Users/fgu/dev/projects/applications/cv/cvfgu.tex'
alias fcvd='vi /Users/fgu/dev/projects/applications/cv/cvdev.tex'

# activate project
alias abl='dbl; ca blog'
alias afo='dfo; ca foods'
alias amd='dmd; ca mdb'
alias ate='dte; ca te'
alias aen='den; ca entropy; gl'
alias ven='aen; vi'
alias dev='cd ~/dev/projects/mdb_eval'
alias aev='dev; ca mdb_eval'
alias vev='aev; vi'
alias jev='aev; jula'

# start jupyter lab for project
alias jbl='abl; jula'
alias jen='aen; jula'
alias jfo='afo; jula'
alias jmd='amd; jula'
alias jte='ate; jula'

# blog shortcuts
alias nb='open https://fabiangunzinger.github.io/blog/'
pn() { vi $(date +'%Y-%m-%d-')"$1"; }
pe() { vi $(find . -name *$1*); }



# jupyter kernels
alias jkl='jupyter kernelspec list'
function jkr { jupyter kernelspec remove $1; } 
function jki { python -m ipykernel install --name $1; }

# conda
alias ci='conda install '
alias cl='conda list'
alias clg='conda list | grep '

alias ce='conda env export > environment.yml'
alias ceh='conda env export --from-history > environment.yml'

function cc() { conda create --name $1; }
function ccb() { conda create --name $1 python=3.9 pandas scipy scikit-learn matplotlib seaborn jupyterlab statsmodels linearmodels jupyterlab_code_formatter black isort s3fs pyarrow; }
function cr() { conda remove --name $1 --all; }
function ccf() { conda env create --file $1; }
function ca() { conda activate "$1"; }
cda='conda deactivate'


# pandoc
function pdmp() { pandoc "$1" -o "${1/md/pdf}"; } 

#################################################
# aws
#################################################

mac_ip=$(curl -s ifconfig.me)
mac_remote=/Users/fgu/dev/remote
vm_remote=/home/fgu/dev/remote
localhost_forward=9999:localhost:9999 

te_keypair=/Users/fgu/.aws/3di.pem
instance_id=i-0d38c6fcdfb909b7b
tail='--region eu-west-2 --profile 3di'

alias get_dns="aws ec2 describe-instances \
    --instance-ids $instance_id \
    --query 'Reservations[*].Instances[*].PublicDnsName' \
    --profile '3di' \
    --region 'eu-west-2' \
    --output 'text'"

# start and stop instance
alias atesp='aws ec2 stop-instances --instance-ids $instance_id $tail'
alias atest='aws ec2 start-instances --instance-ids $instance_id $tail'

# connect to ec2 instances
alias atec='ssh -i $te_keypair fgu@$(get_dns)'
alias atect='ssh -i $te_keypair te@$(get_dns)'
alias atecu='ssh -i $te_keypair -L $localhost_forward ubuntu@$(get_dns)'

# fetch latest fable data
source=s3://fd-eu-rowlevel-v2
destination=s3://3di-data-fable/raw/
alias getfable="aws s3 sync $source $destination --profile '3di'"

# copy files from a to b
function acp() { aws s3 cp $1 $2; }
function acpt() { aws s3 cp $1 $2 --profile '3di'; }


#################################################
# exports
#################################################
export FABIB=~/dev/projects/dotfiles/latex/fabib.bib
export PATH="/usr/local/opt/grep/libexec/gnubin:$PATH"      # use gnu grep
export PATH="/Users/fgu/.local/bin:$PATH"                   # add poetry topath
export EDITOR=nvim
export VISUAL="$EDITOR"


#################################################
# prompt
#################################################

get_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
    
# heavily based on https://youtu.be/LXgXV7YmSiU. colors: 256color_chart.svg
blue=$(tput setaf 033)
green=$(tput setaf 034)
white=$(tput setaf 15)
orange=$(tput setaf 208)
branch_col=$(tput setaf 161)
bold=$(tput bold)
reset=$(tput sgr0)

PS1="\[${bold}\]\n";
PS1+="\[${blue}\]\u";           # username
PS1+="\[${white}\]@";
PS1+="\[${orange}\]\h";         # host
PS1+="\[${white}\] in ";
PS1+="\[${green}\]\W";          # basename of working directory
PS1+="\[${branch_col}\]\$(get_git_branch)";
PS1+="\[${reset}\] $ ";
export PS1;

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
