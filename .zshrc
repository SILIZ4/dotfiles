# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ -f ~/opt/zsh-insulter/src/zsh.command-not-found ]; then
    . ~/opt/zsh-insulter/src/zsh.command-not-found
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
export PATH="$PATH:$HOME/.local/bin/:$HOME/opt/bin"
export LS_COLORS=$LS_COLORS:'di=1;35:*.tex=0;31:*.py=0;33';

# Path to your oh-my-zsh installation.
export ZSH="/home/simon/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Custom aliases
alias l="ls"
alias la="ls -la"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias brc="vim ~/.bashrc"
alias vrc="vim ~/.vimrc"
alias zrc="vim ~/.zshrc"
alias ubrc="source ~/.bashrc"
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
alias exercism="~/opt/exercism/exercism"

# Deactivate screenkey
alias skil="pkill -f screenkey"

ccssh () {
    ssh siliz4@$1.computecanada.ca
}

ccfs () {
    sshfs siliz4@$1.computecanada.ca:/home/siliz4/ /mnt/computecanada -o follow_symlinks
}

samefile () {
    cmp --silent "$1" "$2" || echo "files are different"
}

texbib () {
    xelatex "$1.tex" >> /dev/null
    bibtex "$1.aux" >> /dev/null
    xelatex "$1.tex" >> /dev/null
    xelatex "$1.tex" >> /dev/null
}

# Make directory and enter it
mcdir () {
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

# Change directory and list content
cl () {
    cd "$1" && ls
}

# Activate python environnement
pyenv () {
    source ~/Documents/PyEnvs/$1/bin/activate
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable vim mode
bindkey -v

# 10ms for key sequences, used to reduce delay going into vim normal mode
KEYTIMEOUT=1
