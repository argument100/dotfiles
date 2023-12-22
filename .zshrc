export PS1="%~ $ "

typeset -U path PATH

path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
  "$HOME/.rbenv/bin:$PATH"
)


export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Neovim
# export NVIM_APPNAME=nvim
alias vi='nvim'

