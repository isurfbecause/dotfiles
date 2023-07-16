# Easier navigation
alias ls="ls -F --color"
alias ll="ls -lahtF --color"
alias lss="ls -F --color | sort"
alias lst="ls -tF --color | head"

#Change Directories
alias ..="cd .."
alias p="cd ~/projects"
alias dl="cd ~/Downloads"

# clear
alias c='clear'

# .bashrc
alias srcbash='source ~/.bashrc'

# Git
alias gsv='vim $(git status --porcelain | awk "{print $2}")'
alias gld='git diff HEAD^ HEAD'
alias gcb='get_current_branch'
alias glc='git log -p -1'
alias gll='git log -1'
alias gslf='git show --pretty="" --name-only  $(git rev-parse HEAD)'
alias gom='git checkout main'
alias gd='git diff --color | less -R'
alias gsl='git diff --color HEAD^ HEAD | less -R'
#last branch
alias glb='git checkout @{-1}'
#order by branches most used
alias gbl="git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format='%(refname:short)'"
alias gb="git branch"
alias gs='git status'
alias grh='git reset --hard'
#remove branches that have already been merged into main
alias gcleanbranches='git branch --merged main | grep -v "\* master" | xargs -n 1 git branch -d; git remote prune origin;'
alias gco='git checkout $(git branch | fzf)'
alias ga='git ls-files -m -o --exclude-standard | fzf -m --print0 | xargs -0 -o -t git add'

# IP
function get_ip() {
  IP=$(curl -s ifconfig.me)
  echo $IP
  echo $IP | pbcopy
}

alias ip=get_ip

# Terraform
alias tf='terraform'
alias tfp='tf plan'
alias tfa='tf apply'
alias tfr='tf refresh'
alias tfv='tf validate'
alias tfaa='echo -e "Terraform apply with auto-approve!!!\n\n"; sleep 1; tf apply -auto-approve'

# nvim
export VISUAL=nvim
export VIMCONFIG=~/.config/nvim/init.lua
export VIMDATA=~/.local/share/nvim
alias v=nvim
alias vim=v
alias vi=v

# tmux
alias srctmux='tmux source-file ~/.tmux.conf'

# Attach to tmux session or create a new one
alias tma='tmux attach || tmux new-session'
alias tmn='tmux new-session'

# Copy Date to clipboard
alias now='printf `date +%m/%d/%Y` | pbcopy; echo "Date copied to clipboard"'
