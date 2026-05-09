autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST

prompt_git() {
  local venv=""
  if [ -n "$VIRTUAL_ENV" ]; then
    venv="%F{yellow}($(basename $VIRTUAL_ENV))%f "
  fi

  if [ -n "$vcs_info_msg_0_" ]; then
    PROMPT="${venv}%B%F{blue}%n%B%F{blue}@%B%F{blue}%m %F{magenta}%~ %F{yellow}*%F{yellow}${vcs_info_msg_0_}%F{yellow}%#%b%b%f "
  else
    PROMPT="${venv}%B%F{blue}%n%B%F{blue}@%B%F{blue}%m %F{magenta}%~ %F{yellow}%#%b%f "
  fi
}

precmd_functions+=prompt_git

export PATH=/opt/homebrew/bin:$PATH

export LSCOLORS=FxFxCxDxDxegedabagafad

alias ls='ls -G'

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

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
alias py="python3"

function weather() {
   city="$1"

   if [ -z "$city" ]; then
      city="Kosice"
   fi

   curl "http://wttr.in/${city}"
}

export VIRTUAL_ENV_DISABLE_PROMPT=1
export GPG_TTY=$(tty)
export PATH="$HOME/.local/bin:$PATH"

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"
