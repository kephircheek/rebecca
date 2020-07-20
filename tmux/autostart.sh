# Automatically start tmux on login in a remote server via ssh
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
  tmux a  || tmux new-session -s main
fi
