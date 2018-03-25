# Editors
set -x EDITOR 'vim'
set -x VISUAL 'vim'
set -x PAGER 'less'

# GPG SSH agent
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/gnupg/S.gpg-agent.ssh"

# Path setup
if test -d /snap/bin
	set -x PATH $PATH /snap/bin
end
set -x PATH $PATH $HOME/bin

# Enable VI key bindings
fish_vi_key_bindings
