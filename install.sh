# !/bin/bash

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /Users/$USER/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# install via brew
brew install mas
brew install node@18
brew install yarn --ignore-dependencies
# zsh is default in MacOS Catalina
# brew "zsh"

mas install 869223134
mas install 803453959
mas install 1429033973
mas install 937984704
mas install 540348655

brew install postman
brew install sourcetree
brew install google-chrome
brew install iterm2
brew install discord
brew install fig
brew install nvm
mkdir ~/.nvm

sudo xattr -dr com.apple.quarantine /Applications/Postman.app
open /Applications/Postman.app
sudo xattr -dr com.apple.quarantine /Applications/Sourcetree.app
open /Applications/Sourcetree.app
sudo xattr -dr com.apple.quarantine /Applications/Google\ Chrome.app
open /Applications/Google\ Chrome.app
sudo xattr -dr com.apple.quarantine /Applications/iTerm.app
open /Applications/iTerm.app
sudo xattr -dr com.apple.quarantine /Applications/Discord.app
open /Applications/Discord.app
sudo xattr -dr com.apple.quarantine /Applications/Fig.app
open /Applications/Fig.app

cp -a ./fonts/. ~/Library/Fonts

# configure VSCode
chmod 755 ./vscode/install.sh
./vscode/install.sh

# configure zsh
chmod 755 ./zsh/install.sh
./zsh/install.sh
