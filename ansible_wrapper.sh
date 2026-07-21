#!/bin/bash

set -eu -o pipefail

if [[ $OSTYPE =~ darwin ]]; then
    command -v brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! command -v ansible >/dev/null 2>&1; then
    case "$OSTYPE" in
        darwin*)
            brew install ansible
            ;;
        linux-gnu*)
            sudo apt update
            sudo apt install -y ansible
            ;;
        *)
            echo "Unrecognized OSTYPE: $OSTYPE"
            exit 1
            ;;
    esac
else
    echo "ansible is already installed"
fi

"$@"
