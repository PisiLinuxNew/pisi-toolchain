#!/bin/bash

menu_option_one() {
  echo "Creating Toolchain"
  cd lfs-toolchain-builder
  docker build -t tlyngej/lfs-toolchain-builder:8.3 .
  mkdir /tmp/lfs
  docker run --rm -v /tmp/lfs/lfs:/mnt/lfs tlyngej/lfs-toolchain-builder:8.3
  cd ..
}

menu_option_two() {
  echo "Installing Base System and PISI"
  cd lfs-base-system
  docker run --rm --privileged --userns=host -v /tmp/lfs/lfs:/mnt/lfs tlyngej/lfs-base-system:8.3
  cd ..
}

menu_option_three() {
  echo "Building pisi-core packages"
  sh ./pisi-core/run.sh
}

menu_option_four() {
  echo "Building Docker Image"
}

menu_option_five() {
  echo "Committing Docker Image"
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
  echo "    	1  -  Create Toolchain"
  echo "    	2  -  Install base system and PISI"
  echo "    	3  -  Build pisi-core packages"
  echo "    	4  -  Build Docker Image"
  echo "    	5  -  Commit Docker Image"
  echo "    	0  -  Exit"
  echo ""
  echo "NOTE: This application for the Pisi GNU/Linux developers. "
  echo "      Be CAREFULL!!!"
  echo ""
  echo -n "  Enter selection: "
  read selection
  echo ""
  case $selection in
    1 ) clear ; menu_option_one ; press_enter ;;
    2 ) clear ; menu_option_two ; press_enter ;;
    3 ) clear ; menu_option_three ; press_enter ;;
    4 ) clear ; menu_option_three ; press_enter ;;
    5 ) clear ; menu_option_three ; press_enter ;;
    0 ) clear ; exit ;;
    * ) clear ; incorrect_selection ; press_enter ;;
  esac
done
