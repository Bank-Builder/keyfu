# keyfu

> **`keyfu`** ver 0.2 is a rough & ready utility to move your keys from your `~/.ssh` folder to an encrypted usb along with your custom environment secrets and variables.  This ensures your PC is protected from key & secret data loss in the case of theft.

## Using keyfu

### Preparation
In order to make use of `keyfu` you will need a 4mb or larger encrypted usb drive.  I used the **disks** application in Ubuntu to label, format (as ext4) and password encrypt (using LUKS ) my usb drive.

For the puposes of this documentation we will refer to the mounted /path/to/usb of this usb drive as `/mount/$USER/data`.

Now proceed to clone this repo and execute `keyfu --help` for the following usage information:

### Usage
```
Usage keyfu [COMMAND] [OPTIONS]
ver 0.2
   Keyfu is a script to move your ssh keys to an encrypted USB stick, and to have 
   your environment variables & bash secrets install from a removable USB.
   The purpose is to increase the security of your PC esp in case of theft

  [COMMAND]:
    --help                  display this help
    --version               display the version of km
    init [/path/to/usb]
                            WARNING: initialise will MOVE your .ssh/id_* keys to the USB 
                            and add links in your .ssh/ to these keys on the USB.
    --secrets
                            This will add a .bashrc.secrets to your USB drive and move all the
                            export statements from your ~/.bashrc to this file on your USB drive.

    revert [/path/to/usb]   This will revert your changes to your ~/.ssh/ folder but will
                            leave your keys & secrets on your encrypted USB drive.

  EXAMPLE(s):
    keyfu init /media/andrew/data             # initialises the USB with the .ssh/id_* key files
    keyfu init /media/andrew/data --secrets   # also creates /media/andrew/data/.bashrc.secrets
    keyfu revert /media/andrew/data           # puts everything back almost exactly as it was
    keyfu --version
```

The implication of this is that you may carry you keys and secrets around with you but remember that you will not be able to access ssh services such as `github` .etc, without first inserting your usb drive.

**It is strongly recommended that you make a backup of your `~/.ssh` folder and your `~/.bashrc` file BEFORE executing this script!!!**

> **WARNING** : `keyfu` permanently modifies your system and so make sure you have examined the script, are fully aware of what it will do and have made the necessary backups before you run any command.<br> **USE AT OWN RISK**!


---
Copyright &copy; 2023, Bank-Builder<br>
Licensed under [MIT](./LICENSE)