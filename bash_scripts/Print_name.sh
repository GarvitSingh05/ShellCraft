#!/usr/bin/bash

# Define a function to print text in rainbow colors, bold, and large font. It is a template function you can use anywhere where you want to display text in rainbow color.
rainbow_bold_large() {

    local text="$1"
    local length=${#text}

    for (( i=0; i<$length; i++ )); do

        case $(( i % 6 )) in

            0) echo -ne "\033[1m\033[38;5;196m\033[48;5;232m\033[5m${text:$i:1}\033[0m";;  # bold red
            1) echo -ne "\033[1m\033[38;5;226m\033[48;5;232m\033[5m${text:$i:1}\033[0m";;  # bold yellow
            2) echo -ne "\033[1m\033[38;5;46m\033[48;5;232m\033[5m${text:$i:1}\033[0m";;  # bold green
            3) echo -ne "\033[1m\033[38;5;51m\033[48;5;232m\033[5m${text:$i:1}\033[0m";;  # bold cyan
            4) echo -ne "\033[1m\033[38;5;21m\033[48;5;232m\033[5m${text:$i:1}\033[0m";;  # bold blue
            5) echo -ne "\033[1m\033[38;5;141m\033[48;5;232m\033[5m${text:$i:1}\033[0m";;  # bold magenta

        esac

    done

    echo -e "\033[0m"  # reset text style to normal
}

# Call the function with your name as the argument

    echo -e "\n"
    rainbow_bold_large 'Write Text Here' # Modify Text Here
    echo -e "\n"
