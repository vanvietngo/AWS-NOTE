# pip install virtualenv

python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
# Install pylint: pip install pylint
# Install the code formatting tool black: pip install black
# Install the testing library pytest: pip install pytest
# Install the interactive interpreter ipython: pip install ipython
# Test it out by typing ipython and running some code

make install
make lint


brew install circleci
brew install --ignore-dependencies circleci

#  set alias
alias local="command" -> .bashrc / .Zshrc
source .bashrc
local


# command
# Remove dangling images
docker image prune
# Remove all images
docker rmi $(docker images -a -q)
# Remove all exited containers
docker rm $(docker ps -a -f status=exited -q)
# Stop and remove all containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

