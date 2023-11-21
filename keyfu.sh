#!/bin/bash
# Copyright (c) 2023, Bank-Builder
# Contributors:
#   - Bank-Builder : https://github.com/Bank-Builder
# License MIT: https://opensource.org/licenses/MIT

_version="0.2"
_operand=""


function displayHelp(){
    echo "Usage keyfu [COMMAND] [OPTIONS]";
    echo "ver $_version";
    echo "   Keyfu is a script to move your ssh keys to an encrypted USB stick, and to have ";
    echo "   your environment variables & bash secrets install from a removable USB.";
    echo "   The purpose is to increase the security of your PC esp in case of theft";
    echo "";
    echo "  [COMMAND]:";
    echo "    --help                  display this help";
    echo "    --version               display the version of km";
    echo "    init [/path/to/usb]";
    echo "                            WARNING: initialise will MOVE your .ssh/id_* keys to the USB ";
    echo "                            and add links in your .ssh/ to these keys on the USB.";
    echo "    --secrets"
    echo "                            This will add a .bashrc.secrets to your USB drive and move all the";
    echo "                            export statements from your ~/.bashrc to this file on your USB drive.";
    echo "";
    echo "    revert [/path/to/usb]   This will revert your changes to your ~/.ssh/ folder but will";
    echo "                            leave your keys & secrets on your encrypted USB drive.";
    echo "";
    echo "  EXAMPLE(s):";
    echo "    keyfu init /media/$USER/data             # initialises the USB with the .ssh/id_* key files";
    echo "    keyfu init /media/$USER/data --secrets   # also creates /media/$USER/data/.bashrc.secrets";
    echo "    keyfu revert /media/$USER/data           # puts everything back almost exactly as it was";         
    echo "    keyfu --version";
    echo "";
}

function displayVersion(){
    echo "keyfu version $_version";
    echo "-------";
    echo "Source: https://github.com/bank-builder/keyfu - Copyright (C) 2023, Bank-Builder";
    echo "License MIT: https://opensource.org/licenses/MIT";
    echo "-------";
}

function initialise(){
 ############################################################################ 
 # WARNING:  This function will                                             # 
 # 1. copy the .ssh/id_* files to the USB                                   # 
 # 2. rm the .ssh/id_* files                                                # 
 # 3. add symbolic links from ~/.ssh/id_* to the USB                        # 
 # 4. if the --secrets flags is set it will remove all                      # 
 #    export statements AT END of ~/.bashrc and add to USB                  # 
 # 5. source these secrets from /path/to/usb/.bashrd.secrets                # 
 ############################################################################
    exit 0
}


# Argparse Main
while [[ "$#" > 0 ]]; do
    case $1 in
        init)
            _path_to_usb=$2
            initialise
            shift;;
        --secrets) 
            _operand="_secrets";
            exit 0;;  
        --help) 
            displayHelp; exit 0;;
        --version) 
            displayVersion; exit 0;;
        
        *) echo "Unknown parameter passed: $1"; echo "Try keyfu --help for help"; exit 1;;
    esac 
done

echo "Try keyfu --help for help"; exit 1;

## End ##