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
        echo "Set bitpool.\nThe new bitpool values are: \n min bitpool valie is $min\n current bitpool value is $curr\n max bitpool value is $max";
        defaults write bluetoothaudiod "Apple Initial Bitpool" -int $curr;
        defaults write bluetoothaudiod "Apple Initial Min" -int $min;
        defaults write bluetoothaudiod "Apple Bitpool Min" -int $min;
        defaults write bluetoothaudiod "Apple Bitpool Max" -int $max;
        defaults write bluetoothaudiod "Negotiated Bitpool" -int $curr;
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
    echo "Reat bitpool";
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
