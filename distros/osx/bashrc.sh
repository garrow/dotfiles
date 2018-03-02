#!/bin/bash
# shellcheck disable=SC1090
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  source "$(brew --prefix)/etc/bash_completion"
fi
