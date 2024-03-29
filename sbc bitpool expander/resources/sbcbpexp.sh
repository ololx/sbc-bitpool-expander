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
        echo "Set bitpool.\nThe new bitpool values are: \n min bitpool valie is $min\n max bitpool value is $max";
        defaults write bluetoothaudiod "Apple Bitpool Min" -int $min;
        defaults write bluetoothaudiod "Apple Bitpool Max" -int $max;
        defaults write bluetoothaudiod "Apple Initial Bitpool" -int $min;
        defaults write bluetoothaudiod "Apple Initial Bitpool Min" -int $min;
        defaults write bluetoothaudiod "Negotiated Bitpool" -int $min;
        defaults write bluetoothaudiod "Negotiated Bitpool Min" -int $min;
        defaults write bluetoothaudiod "Negotiated Bitpool Max" -int $max;
        
        read_bitpool;
}

function reset_bitpool {
    echo "Reset bitpool";
    defaults delete bluetoothaudiod;
    
    read_bitpool;
}

function read_bitpool {
    echo "Reading bitpool";
    defaults read bluetoothaudiod;
}

function main {
    while getopts ":s:|:d|:r" opt; do
      case $opt in
        s)
          echo "The set mode";
          set_bitpool ${@:2};
          exit
          ;;
        d)
          echo "The reset mode";
          reset_bitpool;
          exit
          ;;
        r)
          echo "The read mode";
          read_bitpool;
          exit
          ;;  
      esac
    done
}

main $*
