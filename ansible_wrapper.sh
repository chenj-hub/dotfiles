##!/bin/bash

set -eu -o pipefail

if [[ $OSTYPE == darwin ]]; then
  command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v uv &> /dev/null; then
  if [[ $OSTYPE == darwin* ]]; then
    brew install uv
  else
    curl -LsSf https://astral.sh/uv/install.sh | sh
  fi
  source $HOME/.local/bin/env
else
  echo "uv is already installed"
fi

PYTHON_VERSION=3.12.3
DOT_ANSIBLE_VENV=$HOME/.dot_ansible_venv

if  python3 -V | grep -q $PYTHON_VERSION; then
  echo "Python $PYTHON_VERSION is already installed"
else
  if [[ $OSTYPE == darwin* ]]; then
    brew install python@$PYTHON_VERSION
  else
    uv python install $PYTHON_VERSION
  fi
fi

if [[ ! -d $DOT_ANSIBLE_VENV ]]; then
  uv venv $DOT_ANSIBLE_VENV --python $PYTHON_VERSION
fi

source $DOT_ANSIBLE_VENV/bin/activate
uv pip install -r requirements.txt

"$@"
