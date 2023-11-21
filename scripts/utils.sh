# Ask for user confirmation
# @param $1: Message to display
# @param $2: Default value (y/n)
# @return 0 if yes, 1 if no
confirm() {
  local message="$1"
  local default="${2:-y}"
  local answer

  options=("y" "n")
  prompt=""

  for option in "${options[@]}"
  do
      if [[ $option == $default ]]
      then
          # Capitalize the default option
          prompt+="/${option^}"
      else
          # Keep other options in lower case
          prompt+="/$option"
      fi
  done

  # Remove the first '/' character
  options_prompt=${prompt:1}

  read -p "$message [$options_prompt] " answer
  answer="${answer:-$default}"

  if [[ "$answer" =~ ^[Yy]$ ]]; then
    return 0
  fi

  return 1
}
