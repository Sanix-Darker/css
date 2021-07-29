# Copy Securely Secrets

A small bash script to securely copy/Paste content using RSA encryption/decryption.

## OS

- Linux
- MacOs (not tested)
- Windows (not tested)


## Requirements

- `xclip` (available for linux, mac and windows)
- `openssl` (available for linux, mac and windows)


## How to install

```
# Clone the repo
git clone https://github.com/sanix-darker/css.git

# Add execute rights to the script
chmod +x ./css.sh
```

## How it works

- For the generation of keys pair
```
./css.sh gen # or generate
# This will generate a .css/ dir at the home
```

- Add ShortCut keys, so that you're going to execute command with combinations of keypad :
```
# For the secure Copy
${HOME}/css/css.sh enc # for Ctrl+Alt+C

# For the secure Paste
${HOME}/css/css.sh dec # for Ctrl+Alt+V
```

## About

- [darker](https://github.com/sanix-darker)

