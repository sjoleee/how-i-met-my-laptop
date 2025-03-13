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
    if [[ "$cmd" == *"cursor -i"* ]]; then
      ext=$(echo "$cmd" | sed -n 's/.*cursor -i \([^ ]*\).*/\1/p')
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
  log_info "Cursor 확장 프로그램 검증 중..."
else
  log_info "Cursor 확장 프로그램 설치 중..."
fi

# 확장 리스트 (알파벳순)
run_cmd "cursor -i aaron-bond.better-comments"
run_cmd "cursor -i amazonwebservices.aws-toolkit-vscode"
run_cmd "cursor -i astro-build.astro-vscode"
run_cmd "cursor -i be5invis.vscode-custom-css"
run_cmd "cursor -i belfz.search-crates-io"
run_cmd "cursor -i bierner.markdown-mermaid"
run_cmd "cursor -i bradlc.vscode-tailwindcss"
run_cmd "cursor -i christian-kohler.npm-intellisense"
run_cmd "cursor -i christian-kohler.path-intellisense"
run_cmd "cursor -i dandric.vscode-jq"
run_cmd "cursor -i dbaeumer.vscode-eslint"
run_cmd "cursor -i donjayamanne.githistory"
run_cmd "cursor -i dracula-theme.theme-dracula"
run_cmd "cursor -i dsznajder.es7-react-js-snippets"
run_cmd "cursor -i eamodio.gitlens"
run_cmd "cursor -i ecmel.vscode-html-css"
run_cmd "cursor -i editorconfig.editorconfig"
run_cmd "cursor -i esbenp.prettier-vscode"
run_cmd "cursor -i formulahendry.auto-rename-tag"
run_cmd "cursor -i github.copilot"
run_cmd "cursor -i github.copilot-chat"
run_cmd "cursor -i github.github-vscode-theme"
run_cmd "cursor -i github.vscode-github-actions"
run_cmd "cursor -i github.vscode-pull-request-github"
run_cmd "cursor -i GraphQL.vscode-graphql"
run_cmd "cursor -i GraphQL.vscode-graphql-syntax"
run_cmd "cursor -i jeff-hykin.better-cpp-syntax"
run_cmd "cursor -i jscearcy.rust-doc-viewer"
run_cmd "cursor -i mariusalchimavicius.json-to-ts"
run_cmd "cursor -i mhutchie.git-graph"
run_cmd "cursor -i mikestead.dotenv"
run_cmd "cursor -i mkxml.vscode-filesize"
run_cmd "cursor -i ms-azuretools.vscode-docker"
run_cmd "cursor -i ms-kubernetes-tools.vscode-kubernetes-tools"
run_cmd "cursor -i ms-vscode-remote.remote-containers"
run_cmd "cursor -i ms-vscode-remote.remote-ssh"
run_cmd "cursor -i ms-vscode-remote.remote-ssh-edit"
run_cmd "cursor -i ms-vscode-remote.remote-wsl"
run_cmd "cursor -i ms-vscode-remote.vscode-remote-extensionpack"
run_cmd "cursor -i ms-vscode.cmake-tools"
run_cmd "cursor -i ms-vscode.cpptools"
run_cmd "cursor -i ms-vscode.cpptools-extension-pack"
run_cmd "cursor -i ms-vscode.cpptools-themes"
run_cmd "cursor -i ms-vscode.remote-explorer"
run_cmd "cursor -i ms-vscode.remote-server"
run_cmd "cursor -i ms-vscode.vscode-typescript-next"
run_cmd "cursor -i naumovs.color-highlight"
run_cmd "cursor -i octref.vetur"
run_cmd "cursor -i oderwat.indent-rainbow"
run_cmd "cursor -i PKief.material-icon-theme"
run_cmd "cursor -i pmneo.tsimporter"
run_cmd "cursor -i Prisma.prisma"
run_cmd "cursor -i redhat.vscode-yaml"
run_cmd "cursor -i ritwickdey.LiveServer"
run_cmd "cursor -i rust-lang.rust-analyzer"
run_cmd "cursor -i rvest.vs-code-prettier-eslint"
run_cmd "cursor -i serayuzgur.crates"
run_cmd "cursor -i streetsidesoftware.code-spell-checker"
run_cmd "cursor -i styled-components.vscode-styled-components"
run_cmd "cursor -i svelte.svelte-vscode"
run_cmd "cursor -i tamasfe.even-better-toml"
run_cmd "cursor -i usernamehw.errorlens"
run_cmd "cursor -i vadimcn.vscode-lldb"
run_cmd "cursor -i Vue.volar"
run_cmd "cursor -i wayou.vscode-todo-highlight"
run_cmd "cursor -i yandeu.five-server"
run_cmd "cursor -i yzhang.markdown-all-in-one"
run_cmd "cursor -i ZixuanChen.vitest-explorer"

# 설정 파일 복사
if [ "$DRY_RUN" = false ]; then
  log_info "설정 파일 복사 중..."
  run_cmd "cp ./cursor/settings.json ~/Library/Application\\ Support/Cursor/User/settings.json"
fi

# 완료
if [ "$DRY_RUN" = true ]; then
  log_info "Cursor 확장 프로그램 검증 완료"
else
  log_info "Cursor 설정 완료"
fi 