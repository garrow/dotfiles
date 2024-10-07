#!/bin/bash

# Optimize image files within a given directory
# 1. Converts PNGs to JPGs and optimizing GIFs, 
# 2. Updates any references in markdown (.md) files 
# 3. Commits each change to git 
#
# USAGE: 
#   crunch-images.sh <directory> <mode>
# directory: the directory to perform operations on
# mode: either "--run" or "--dry-run".  Defaults to --run
#
# Example: crunch-images.sh ./images --dry-run
# 
# REQUIREMENTS
#   git, imagemagick, sed




set -e

C_GREY="$(tput setaf 8)"
C_WHITE="$(tput setaf 7)"
C_RESET="$(tput sgr 0)"

# Constants for mode flags
RUN_FLAG="--run"
DRY_RUN_FLAG="--dry-run"

convert_png_to_jpg() {
  local directory=$1
  local mode=$2
  local total=$(find "$directory" -name "*.png" | wc -l | tr -d ' ')
  local count=0
  while IFS= read -r -d '' PNG
  do
    ((count=count+1))
    # shellcheck disable=SC2102
    echo -e "${C_GREY}$(date +[%Y-%m-%d\ %H:%M:%S])${C_WHITE} 🔄 Converting PNG $count/$total: $PNG ${C_RESET}"
    if [ "$mode" == "$RUN_FLAG" ]; then
      local JPG="${PNG%.*}.jpg"
      local png_basename=$(basename "${PNG}")
      local jpg_basename=$(basename "${JPG}")
    

        mogrify -format jpg "$PNG"
        if [ -f "$JPG" ]; then
            git rm "$PNG"
            while IFS= read -r -d '' MD
            do
            sed -i '' -e "s/${png_basename}/$jpg_basename}/g" "$MD"
            git add "$MD"
            done < <(find "$directory" -name "*.md" -print0)
            git add "$JPG"
            git commit -m "Converted ${png_basename} to jpg"
        fi
    else
      echo "${C_GREY}SKIPPING - dry-run${C_RESET}"
    fi
  done < <(find "$directory" -name "*.png" -print0)
}

optimize_gif() {
  local directory=$1
  local mode=$2
  local total=$(find "$directory" -name "*.gif" | wc -l | tr -d ' ')
  local count=0
  while IFS= read -r -d '' GIF
  do
    ((count=count+1))
    # shellcheck disable=SC2102
    echo -e "${C_GREY}$(date +[%Y-%m-%d\ %H:%M:%S])${C_WHITE} 🚀 Optimizing GIF $count/$total: $GIF ${C_RESET}"

    if [ "$mode" != "$DRY_RUN_FLAG" ]; then
      mogrify -layers 'optimize' -fuzz 7% "$GIF"
      git add "$GIF"
      git commit -m "Optimized $(basename "$GIF")"
    else
      echo "${C_GREY}SKIPPING - dry-run${C_RESET}"
    fi
  done < <(find "$directory" -name "*.gif" -print0)
}

main() {
    local directory=$1
    local mode=${2:-$RUN_FLAG}

    # Check if directory and mode are provided
    if [ -z "$directory" ] || [[ "$mode" != "$RUN_FLAG" && "$mode" != "$DRY_RUN_FLAG" ]]; then
        echo "USAGE: $0 <directory> <mode>"
        echo "directory: the directory to perform operations on"
        echo "mode: either '--run' or '--dry-run'"
        exit 1
    fi

    convert_png_to_jpg $directory "$mode"
    optimize_gif $directory "$mode"
}

main "$@"