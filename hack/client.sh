#!/bin/bash

send_clipboard(){
    curl "http://127.0.0.1:9988?content=$(xclip -o)"
}


send_clipboard

