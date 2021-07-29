#!/bin/bash
# By d4rk3r

# This script can :
#    - generate keys pair (rsa 2048)
#    - rsa encrypt the content of your clipboard/selected element
#    - rsa decrypt the content of your encrypted clipboard storage

# requirements :
# - apt install xclip
# - apt install openssl
# - apt install xdotool

PUBLIC_KEY_PATH="${HOME}/.css/darker.pub"
PRIVATE_KEY_PATH="${HOME}/.css/darker.pri"

# the path where the encrypted data will be saved
SECRET_STORE_PATH="${HOME}/.css/css_secret_store.dat"


_generate_keys(){
    mkdir ${HOME}/.css/

    openssl genrsa -out $PRIVATE_KEY_PATH 2048;
    openssl rsa -in $PRIVATE_KEY_PATH -out $PUBLIC_KEY_PATH -outform PEM -pubout
}

_copy_encrypt(){
    # We get the output of xclip and encrypt it
    echo "$(xclip -o)" | openssl rsautl -encrypt -inkey $PUBLIC_KEY_PATH -pubin -out $SECRET_STORE_PATH
    # We save a custom message to the clipboard
    echo "-css encrypted value-" | xclip -selection clipboard
}

_decrypt_paste(){
    # We decrypt using our private key
    string=`openssl rsautl -decrypt -inkey $PRIVATE_KEY_PATH -in $SECRET_STORE_PATH`;

    # We print to the clipboard de decrypted value
    sleep 0.5;
    xdotool getactivewindow type "$string"

    echo "" | xclip -selection clipboard
}

_help_commands(){
    echo "./css.sh gen # To generate keys pair"
    echo "./css.sh enc # To encrypt the clipboard selection/saved"
    echo "./css.sh dec # To decrypt the clipboard and put"
}

# The main function
main(){
    if [ "$1" == "generate" ] || [ "$1" == "gen" ]; then
        _generate_keys
    elif [ "$1" == "encrypt" ] || [ "$1" == "enc" ]; then
        _copy_encrypt
    elif [ "$1" == "decrypt" ] || [ "$1" == "dec" ]; then
        _decrypt_paste
    else
        echo "[x] Error: Bad parameter provided..."
        _help_commands
    fi
}

main $1

