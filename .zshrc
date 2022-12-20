source ~/.zplug/init.zsh

zplug "softmoth/zsh-vim-mode"
zplug "sindresorhus/pure"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

# Pure prompt
fpath+=($ZPLUG_REPOS/sindresorhus/pure)

zstyle :prompt:pure:prompt:success color "#5f8700"
zstyle :prompt:pure:prompt:error color "#af0000"

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d75f87,bold"
ZSH_AUTOSUGGEST_STRATEGY="completion"

bindkey "^j" forward-word

KEYTIMEOUT=5

export HISTFILE=~/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

bindkey -v

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


function synctime() {
    sudo date -s "$(curl -Is --max-redirs 0 google.com 2>&1 | grep Date: | cut -d' ' -f2-7)"
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

zplug load --verbose
