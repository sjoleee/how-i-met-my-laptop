# !/bin/bash
brew install visual-studio-code --cask

sudo xattr -dr com.apple.quarantine /Applications/Visual\ Studio\ Code.app


# install vscode extensions
code --install-extension akamud.vscode-theme-onedark
code --install-extension formulahendry.code-runner
code --install-extension vivaxy.vscode-conventional-commits
code --install-extension dbaeumer.vscode-eslint
code --install-extension Shinotatwu-DS.file-tree-generator
code --install-extension mhutchie.git-graph
code --install-extension ritwickdey.LiveServer
code --install-extension PKief.material-icon-theme
code --install-extension esbenp.prettier-vscode
code --install-extension jock.svg
code --install-extension csstools.postcss
code --install-extension bradlc.vscode-tailwindcss
code --install-extension wayou.vscode-todo-highlight
code --install-extension mattpocock.ts-error-translator
code --install-extension styled-components.vscode-styled-components


cp ./vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json