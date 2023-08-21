# !/bin/bash
brew install visual-studio-code --cask

sudo xattr -dr com.apple.quarantine /Applications/Visual\ Studio\ Code.app


# install vscode extensions
code --install-extension seansassenrath.vscode-theme-superonedark
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
code --install-extension eamodio.gitlens
code --install-extension naumovs.color-highlight
code --install-extension ijs.emotionsnippets
code --install-extension ecmel.vscode-html-css
code --install-extension yzhang.markdown-all-in-one
code --install-extension unifiedjs.vscode-mdx
code --install-extension cipchk.cssrem
code --install-extension arcanis.vscode-zipfs

cp ./vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json