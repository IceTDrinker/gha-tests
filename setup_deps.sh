#!/usr/bin/env bash

SET_GMAKE_AS_MAKE_ON_MACOS=

while [ -n "$1" ]
do
   case "$1" in
        "--set-gmake-as-make-on-macos" )
            SET_GMAKE_AS_MAKE_ON_MACOS=1
            ;;

        *)
            echo "Unknown param : $1"
            exit 1
            ;;
   esac
   shift
done

set -e
brew install curl git graphviz jq make pandoc shellcheck
echo "Make version"
make --version
echo "GMake version"
gmake --version

if [[ "${SET_GMAKE_AS_MAKE_ON_MACOS}" == "1" ]]; then
    export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
    echo "Aliased GMake version"
    make --version
fi

python3 -m pip install -U pip
python3 -m pip install poetry

which pip
which poetry
