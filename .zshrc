# Temporary workaround --- urxvt startup at middle of screen
if [[ `ps ho command $(ps ho ppid $$)` == 'urxvt' ]]; then
  clear
fi


source $HOME/.antigen/antigen.zsh

antigen bundle "zsh-users/zsh-autosuggestions"
antigen bundle "zsh-users/zsh-syntax-highlighting"
antigen bundle "zsh-users/zsh-history-substring-search"
antigen bundle "sindresorhus/pure"@main

# Pure prompt
zstyle :prompt:pure:prompt:success color "#5f8700"
zstyle :prompt:pure:prompt:error color "#af0000"

# zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#d75f87,bold"
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# zsh-autocomplete
zstyle ':autocomplete:*' insert-unambiguous yes # Insert common substring if it exists
zstyle ':autocomplete:*' widget-style menu-complete # Cycle suggestions with tab

# zsh-history-substring-search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

antigen apply


bindkey -v # vim mode
bindkey -s "^f" 'tmux-sessionizer^M'

KEYTIMEOUT=1

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

export LS_COLORS=$LS_COLORS:'di=1;35:*.tex=0;33:*.py=0;33:*.cpp=0;33:*.h=0;33:*.hpp=0;33:*.rs=0;33;'
path+=("$HOME/.local" "$HOME/.local/scripts/" "$HOME/.local/bin/")
export PATH

vim_swap_dir="$HOME/.cache/vim/swap"
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
alias lswap="ls $vim_swap_dir"
alias rmswap="rm $vim_swap_dir"
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"

# Programs
alias vim="vim --servername vimd"
alias jn="jupyter-notebook"
alias rm-latex="rm *.out(N) *.bbl(N) *.aux(N) *.log(N) *.blg(N) *.sta(N) *.toc(N) *.nav(N) *.snm(N) *.run.xml(N) *.bcf(N) *.lof(N) *.lot(N) *.dvi(N) *.fls(N) *.fdb_latexmk(N) *.xdv(N) *.synctex.gz(N)"

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
    cmp --silent "$1" "$2" && echo "identical files" || echo "different files"
}

# Activate python environnement
function pyenv () {
    source ~/Documents/PyEnvs/$1/bin/activate
}

# The following lines were added by compinstall

zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=* r:|=*'
zstyle :compinstall filename '/home/simon/.zshrc'
zstyle ':completion:*' menu select

setopt ALWAYS_TO_END
setopt AUTO_PARAM_SLASH

autoload -Uz compinit
compinit
# End of lines added by compinstall
