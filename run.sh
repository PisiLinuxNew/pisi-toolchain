#!/bin/bash

### Colors ##
### Colors ##
ESC=$(printf '\033') RESET="${ESC}[0m" BLACK="${ESC}[30m" RED="${ESC}[31m"
GREEN="${ESC}[32m" YELLOW="${ESC}[33m" BLUE="${ESC}[34m" MAGENTA="${ESC}[35m"
CYAN="${ESC}[36m" WHITE="${ESC}[37m" DEFAULT="${ESC}[39m"

### Color Functions ##

greenprint() { printf "${GREEN}%s${RESET}\n" "$1"; }
magentaprint() { printf "${MAGENTA}%s${RESET}\n" "$1"; }
redprint() { printf "${RED}%s${RESET}\n" "$1"; }

### Menu ##
menu_option_one() {
  echo " $(magentaprint 'Creating Toolchain')"
  sh ./lfs-toolchain-builder/run.sh
}

menu_option_two() {
  echo "$(magentaprint 'Installing Base System and PISI')"
  sh ./lfs-base-sytem/run.sh
}

menu_option_three() {
  echo "$(magentaprint 'Building pisi-core packages')"
  sh ./pisi-core/run.sh
}

menu_option_four() {
  echo "$(magentaprint 'Building Docker Image')"
  sh ./pisi-chroot-build/create_image.sh
}

press_enter() {
  echo ""
  echo -n "	Press Enter to continue "
  read
  clear
}

incorrect_selection() {
  echo "Incorrect selection! Try again."
}

until [ "$selection" = "0" ]; do
  clear
  echo " "
  echo "       $(greenprint 'PISI GNU/LINUX DEVELOPER TOOL')"
  echo " "
  echo "    	$(magentaprint '1  -  Create Toolchain')"
  echo "    	$(magentaprint '2  -  Install base system and PISI')"
  echo "    	$(magentaprint '3  -  Build pisi-core packages')"
  echo "    	$(magentaprint '4  -  Build and Commit Docker Image')"
  echo "    	$(magentaprint '0  -  Exit')"
  echo " "
  echo "$(redprint '******************************************************************')"
  echo " "
  echo "                      WARNING!"
  echo "This application for the only Pisi GNU/Linux developers."
  echo "             It may damage your system."
  echo " "
  echo "$(redprint '******************************************************************')"
  echo " "
  echo -n "  Enter selection: "
  read selection
  echo ""
  case $selection in
    1 ) clear ; menu_option_one ; press_enter ;;
    2 ) clear ; menu_option_two ; press_enter ;;
    3 ) clear ; menu_option_three ; press_enter ;;
    4 ) clear ; menu_option_four ; press_enter ;;
    0 ) clear ; exit ;;
    * ) clear ; incorrect_selection ; press_enter ;;
  esac
done
