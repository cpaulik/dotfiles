# Work-specific config

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

export JAVA_HOME=/Library/Java/JavaVirtualMachines/amazon-corretto-21.jdk/Contents/Home
export PIP_EXTRA_INDEX_URL='https://pypi.prod.planet-labs.com/simple/'
export CLOUDSDK_PYTHON=/Users/christoph/.pyenv/versions/3.12.1/bin/python

export CLAUDE_CODE_USE_VERTEX=1
export CLOUD_ML_REGION=us-east5
export ANTHROPIC_VERTEX_PROJECT_ID=engine-468307

curl-planet() { curl -k -H "Authorization: Bearer $(planet --auth-profile planet-user auth print-access-token)" "$@"; }

aem() {
  local session_name="${1:-aem}"
  local dir="/Users/christoph/workspace/analysis-engine-meta"
  tmux new-session -d -s "$session_name" -n "aem" -c "$dir" "claude" \; \
    split-window -h -t "$session_name" -c "$dir" "nvim" \; \
    select-pane -t "$session_name" -L
  if [ -n "$TMUX" ]; then
    tmux switch-client -t "$session_name"
  else
    tmux attach-session -t "$session_name"
  fi
}
