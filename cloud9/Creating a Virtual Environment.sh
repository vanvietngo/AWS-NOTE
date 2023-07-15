# The command below will create hello virtual environment in a user's home directory.
python3 -m venv ~/.hello
# To use this virtual environment it needs to be activated.
source  ~/.hello/bin/activate


# check bash or zsh
echo $SHELL
echo $0

## Hello repo                                                                   
alias hello="cd ~/hello && source ~/.hello/bin/activate"     
# To make the new alias available in your current terminal session, run the following command:
source .bashrc
➜ hello
(.hello) ➜  hello git:(master)
(.hello) ➜  hello git:(master) which python
/Users/noahgift/.hello/bin/python

# exit venv
deactivate
