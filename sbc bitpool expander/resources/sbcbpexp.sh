#!/bin/sh

#  sbcbpexp.sh
#  sbc bitpool expander
#
#  Created by Alexander A. Kropotin on 30.03.2021.
#  

#!/bin/bash

function set_bitpool {
        local min=$1;
        local max=$2;
        local curr=$3;
        echo "The new bitpool values are $min - $curr - $max";
        defaults write bluetoothaudiod "Apple Initial Bitpool" -int $curr;
        defaults write bluetoothaudiod "Apple Initial Min" -int $min;
        defaults write bluetoothaudiod "Apple Bitpool Min" -int $min;
        defaults write bluetoothaudiod "Apple Bitpool Max" -int $max;
        defaults write bluetoothaudiod "Negotiated Bitpool" -int $curr;
        defaults write bluetoothaudiod "Negotiated Bitpool Min" -int $min;
        defaults write bluetoothaudiod "Negotiated Bitpool Max" -int $max;
        defaults read bluetoothaudiod;
}

function reset_bitpool {
    echo "Reset bitpool";
    defaults delete bluetoothaudiod;
    defaults read bluetoothaudiod;
}

function main {
    while getopts ":s:|:d:" opt; do
      case $opt in
        s)
          echo "The create mode";
          set_bitpool ${@:2};
          exit
          ;;
        d)
          echo "The reset mode";
          reset_bitpool;
          exit
          ;;
      esac
    done
}

main $*
