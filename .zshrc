autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST

prompt_git() {
  if [ -n "$vcs_info_msg_0_" ]; then
    PROMPT="%B%F{blue}%n%B%F{blue}@%B%F{blue}%m %F{magenta}%~ %F{yellow}*%F{yellow}${vcs_info_msg_0_}%F{yellow}%#%b%b%f "
  else
    export PS1="%B%F{blue}%n%B%F{blue}@%B%F{blue}%m %F{magenta}%~ %F{yellow}%#%b%f "
  fi
}

precmd_functions+=prompt_git

export PATH=/opt/homebrew/bin:$PATH
export PATH=/usr/local:$PATH

export LSCOLORS=FxFxCxDxDxegedabagafad

alias ls='ls -G'

# export PS1="%B%F{blue}%n%B%F{blue}@%B%F{blue}%m %F{magenta}%~ %F{yellow}%#%b%f "

source /opt/homebrew/Cellar/zsh-syntax-highlighting/0.7.1/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[precommand]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[arg0]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[default]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[command]=fg=yellow,bold
ZSH_HIGHLIGHT_STYLES[parameter]=fg=yellow,bold

alias update="brew update && brew upgrade"
alias 😎="neofetch"
alias 💻="htop"
alias ☀️="weather"

function weather() {
   city="$1"

   if [ -z "$city" ]; then
      city="Kosice"
   fi

   eval "curl http://wttr.in/${city}"
}
