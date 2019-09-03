_termwidth() {
  local osname=$(uname -o)

  case "${osname}" in
    "GNU/Linux" )
      stty -a | head -n 1 | cut -d';' -f3 | cut -d' ' -f3 ;;
    * )
      echo 80 ;;
  esac

}

_termwidth
