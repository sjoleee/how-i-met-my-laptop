#!/bin/bash

# 색상
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# 드라이런 설정
DRY_RUN=false
for arg in "$@"; do
  case $arg in
    --dry-run)
      DRY_RUN=true
      shift
      ;;
  esac
done

# 로그 함수
log_info() {
  echo -e "${GREEN}✅${NC} $1"
}

log_error() {
  echo -e "${RED}❌${NC} $1"
}

# 명령어 실행 함수
run_cmd() {
  cmd=$1
  
  if [ "$DRY_RUN" = true ]; then
    # 확장 프로그램 설치 명령인 경우 확장 존재 여부 확인
    if [[ "$cmd" == *"code --install-extension"* ]]; then
      ext=$(echo "$cmd" | sed -n 's/.*code --install-extension \([^ ]*\).*/\1/p')
      if [ -n "$ext" ]; then
        curl -s "https://marketplace.visualstudio.com/items?itemName=$ext" > /dev/null 2>&1
      fi
    fi
    return 0
  else
    eval "$cmd"
    return $?
  fi
}

if [ "$DRY_RUN" = true ]; then
  log_info "VSCode 확장 프로그램 검증 중..."
else
  log_info "VSCode 확장 프로그램 설치 중..."
fi

# 확장 리스트 (알파벳순)
run_cmd "code --install-extension aaron-bond.better-comments"
run_cmd "code --install-extension amazonwebservices.aws-toolkit-vscode"
run_cmd "code --install-extension astro-build.astro-vscode"
run_cmd "code --install-extension be5invis.vscode-custom-css"
run_cmd "code --install-extension belfz.search-crates-io"
run_cmd "code --install-extension bierner.markdown-mermaid"
run_cmd "code --install-extension bradlc.vscode-tailwindcss"
run_cmd "code --install-extension christian-kohler.npm-intellisense"
run_cmd "code --install-extension christian-kohler.path-intellisense"
run_cmd "code --install-extension dandric.vscode-jq"
run_cmd "code --install-extension dbaeumer.vscode-eslint"
run_cmd "code --install-extension donjayamanne.githistory"
run_cmd "code --install-extension dracula-theme.theme-dracula"
run_cmd "code --install-extension dsznajder.es7-react-js-snippets"
run_cmd "code --install-extension eamodio.gitlens"
run_cmd "code --install-extension ecmel.vscode-html-css"
run_cmd "code --install-extension editorconfig.editorconfig"
run_cmd "code --install-extension esbenp.prettier-vscode"
run_cmd "code --install-extension formulahendry.auto-rename-tag"
run_cmd "code --install-extension github.copilot"
run_cmd "code --install-extension github.copilot-chat"
run_cmd "code --install-extension github.github-vscode-theme"
run_cmd "code --install-extension github.vscode-github-actions"
run_cmd "code --install-extension github.vscode-pull-request-github"
run_cmd "code --install-extension GraphQL.vscode-graphql"
run_cmd "code --install-extension GraphQL.vscode-graphql-syntax"
run_cmd "code --install-extension jeff-hykin.better-cpp-syntax"
run_cmd "code --install-extension jscearcy.rust-doc-viewer"
run_cmd "code --install-extension mariusalchimavicius.json-to-ts"
run_cmd "code --install-extension mhutchie.git-graph"
run_cmd "code --install-extension mikestead.dotenv"
run_cmd "code --install-extension mkxml.vscode-filesize"
run_cmd "code --install-extension ms-azuretools.vscode-docker"
run_cmd "code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools"
run_cmd "code --install-extension ms-vscode-remote.remote-containers"
run_cmd "code --install-extension ms-vscode-remote.remote-ssh"
run_cmd "code --install-extension ms-vscode-remote.remote-ssh-edit"
run_cmd "code --install-extension ms-vscode-remote.remote-wsl"
run_cmd "code --install-extension ms-vscode-remote.vscode-remote-extensionpack"
run_cmd "code --install-extension ms-vscode.cmake-tools"
run_cmd "code --install-extension ms-vscode.cpptools"
run_cmd "code --install-extension ms-vscode.cpptools-extension-pack"
run_cmd "code --install-extension ms-vscode.cpptools-themes"
run_cmd "code --install-extension ms-vscode.remote-explorer"
run_cmd "code --install-extension ms-vscode.remote-server"
run_cmd "code --install-extension ms-vscode.vscode-typescript-next"
run_cmd "code --install-extension naumovs.color-highlight"
run_cmd "code --install-extension octref.vetur"
run_cmd "code --install-extension oderwat.indent-rainbow"
run_cmd "code --install-extension PKief.material-icon-theme"
run_cmd "code --install-extension pmneo.tsimporter"
run_cmd "code --install-extension Prisma.prisma"
run_cmd "code --install-extension redhat.vscode-yaml"
run_cmd "code --install-extension ritwickdey.LiveServer"
run_cmd "code --install-extension rust-lang.rust-analyzer"
run_cmd "code --install-extension rvest.vs-code-prettier-eslint"
run_cmd "code --install-extension serayuzgur.crates"
run_cmd "code --install-extension streetsidesoftware.code-spell-checker"
run_cmd "code --install-extension styled-components.vscode-styled-components"
run_cmd "code --install-extension svelte.svelte-vscode"
run_cmd "code --install-extension tamasfe.even-better-toml"
run_cmd "code --install-extension usernamehw.errorlens"
run_cmd "code --install-extension vadimcn.vscode-lldb"
run_cmd "code --install-extension Vue.volar"
run_cmd "code --install-extension wayou.vscode-todo-highlight"
run_cmd "code --install-extension yandeu.five-server"
run_cmd "code --install-extension yzhang.markdown-all-in-one"
run_cmd "code --install-extension ZixuanChen.vitest-explorer"

# 설정 파일 복사
if [ "$DRY_RUN" = false ]; then
  log_info "설정 파일 복사 중..."
  run_cmd "mkdir -p ~/Library/Application\\ Support/Code/User"
  run_cmd "cp ./vscode/settings.json ~/Library/Application\\ Support/Code/User/settings.json"
fi

# 완료
if [ "$DRY_RUN" = true ]; then
  log_info "VSCode 확장 프로그램 검증 완료"
else
  log_info "VSCode 설정 완료"
fi