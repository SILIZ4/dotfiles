source ~/.zplug/init.zsh

# Must be set early to avoid interference with autosuggestions
zplug "softmoth/zsh-vim-mode"
bindkey -v

zplug "sindresorhus/pure"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "Aloxaf/fzf-tab"

# Pure prompt
fpath+=($ZPLUG_REPOS/sindresorhus/pure)

zstyle :prompt:pure:prompt:success color "#5f8700"
zstyle :prompt:pure:prompt:error color "#af0000"

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d75f87,bold"
ZSH_AUTOSUGGEST_STRATEGY=(completion history)

bindkey "^ " forward-word
bindkey "^j" history-beginning-search-forward
bindkey "^k" history-beginning-search-backward

# zsh-history-substring-search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


KEYTIMEOUT=5


export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=50000

setopt inc_append_history
setopt hist_expire_dups_first    # Expire a duplicate event first when trimming history.
setopt hist_find_no_dups         # Do not display a previously found event.
setopt hist_ignore_all_dups      # Delete an old recorded event if a new event is a duplicate.
setopt hist_ignore_dups          # Do not record an event that was just recorded again.
setopt hist_ignore_space         # Do not record an event starting with a space.
setopt hist_save_no_dups         # Do not write a duplicate event to the history file.
setopt share_history             # Share history between all sessions.


export LS_COLORS=$LS_COLORS:'di=1;35:*.tex=0;31:*.py=0;33';

# Custom aliases
alias ls="ls --color=tty"
alias l="ls"
alias la="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias brc="vim ~/.bashrc"
alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
alias uzrc="source ~/.zshrc"
alias lswap="ls ~/.cache/vim/swap"
alias rmswap="rm ~/.cache/vim/swap/*"
alias dswp="rm ~/.cache/vim/swap/*"
alias :q="exit"
alias q="exit"
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias vim="vim --servername vimd"

# Programs
alias jn="jupyter-notebook"
alias rm-latex="rm *.out(N) *.bbl(N) *.aux(N) *.log(N) *.blg(N) *.sta(N) *.toc(N) *.nav(N) *.snm(N) *.run.xml(N) *.bcf(N) *.lof(N) *.lot(N) *.dvi(N) *.fls(N) *.fdb_latexmk(N) *.xdv(N) *.synctex.gz(N)"


function edit() {
    SESSION=$1
    tmux new-session -d -s $SESSION
    tmux split-window -v -l 0 -t $SESSION
    tmux attach-session -t $SESSION
}

function clocksync() {
    sudo date -s "$(curl -Is --max-redirs 0 google.com 2>&1 | grep Date: | cut -d' ' -f2-7)"
    sudo hwclock --systohc
}

function ccssh () {
    ssh siliz4@$1.computecanada.ca
}

function ccfs () {
    sshfs siliz4@$1.computecanada.ca:/home/siliz4/ /mnt/computecanada -o follow_symlinks
}

function samefile () {
    cmp --silent "$1" "$2" || echo "files are different"
}

function mcdir () {
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# Change directory and list content
function cl () {
    cd "$1" && ls
}

# Activate python environnement
function pyenv () {
    source ~/Documents/PyEnvs/$1/bin/activate
}

zplug load # --verbose
