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
PATH="${PATH:+${PATH}:}$HOME/.gem/ruby/2.7.0/bin:$HOME/.local/bin/:$HOME/opt/"


# Path to your oh-my-zsh installation.
export ZSH="/home/simon/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

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
alias grahamfs="sshfs siliz4@graham.computecanada.ca:/home/siliz4/ /mnt/computecanada -o follow_symlinks"
alias grahamssh="ssh siliz4@graham.computecanada.ca"
alias belugafs="sshfs siliz4@beluga.computecanada.ca:/home/siliz4/ /mnt/computecanada -o follow_symlinks"
alias belugassh="ssh siliz4@beluga.computecanada.ca"

# Programs
alias jn="jupyter-notebook"
alias rm-latex="rm *.out(N) *.bbl(N) *.aux(N) *.log(N) *.blg(N) *.sta(N) *.toc(N) *.nav(N) *.snm(N) *.run.xml(N) *.bcf(N)"
alias exercism="~/opt/exercism/exercism"

# Deactivate screenkey
alias skil="pkill -f screenkey"

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
