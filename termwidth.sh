_termwidth() {
  local osname=$(uname -a | cut -d' ' -f1)

  case "${osname}" in
    "Linux" )
      stty -a | head -n 1 | cut -d';' -f3 | cut -d' ' -f3 ;;
    "Darwin" )
      stty -a | head -n 1 | cut -d';' -f3 | cut -d' ' -f2 ;;
    * )
      echo 80 ;;
  esac

}

_termwidth
