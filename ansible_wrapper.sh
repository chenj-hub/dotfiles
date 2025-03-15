#!/bin/bash

set -eu -o pipefail

if [[ $OSTYPE == darwin ]]; then
  command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v uv &> /dev/null; then
  if [[ $OSTYPE == darwin* ]]; then
    brew install uv
  else
    curl -LsSf https://astral.sh/uv/install.sh | sh
    # shellcheck source=/dev/null
    source "$HOME/.local/bin/env"
  fi
else
  echo "uv is already installed"
fi

PYTHON_VERSION=3.12
DOT_ANSIBLE_VENV="$HOME/.dot_ansible_venv"

if  command -v python$PYTHON_VERSION &> /dev/null; then
  echo "Python $PYTHON_VERSION is already installed"
else
  if [[ $OSTYPE == darwin* ]]; then
    brew install "python@$PYTHON_VERSION"
  else
    uv python install "$PYTHON_VERSION"
  fi
fi

if [[ ! -d $DOT_ANSIBLE_VENV ]]; then
  if [[ $OSTYPE == darwin* ]]; then
    uv venv --python "$(brew --prefix)/bin/python$PYTHON_VERSION" "$DOT_ANSIBLE_VENV"
  else
    uv venv --python "$PYTHON_VERSION" "$DOT_ANSIBLE_VENV"
  fi
fi

# shellcheck source=/dev/null
source "$DOT_ANSIBLE_VENV/bin/activate"
uv pip install -r requirements.txt

"$@"
