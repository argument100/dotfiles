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

# Golang
export PATH=$PATH:/Users/ozo/.local/share/mise/installs/go/1.21.6/go/bin
export PATH=$PATH:$GOPATH/bin

# Neovim
# export NVIM_APPNAME=nvim
alias vi='nvim'

eval "$(mise activate zsh)"
