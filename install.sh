#!/bin/bash

# 색상 설정
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# 드라이런 모드 설정
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

# 명령어 실행 함수 - 드라이런 모드에서는 앱 존재 여부만 검증
run_cmd() {
  cmd=$1
  
  if [ "$DRY_RUN" = true ]; then
    # 아무 작업도 수행하지 않음
    return 0
  else
    eval "$cmd"
    return $?
  fi
}

# 에러 처리
handle_error() {
  log_error "$1"
  exit 1
}

if [ "$DRY_RUN" = true ]; then
  log_info "드라이런 모드 시작"
else
  log_info "설치 시작"
fi

# Homebrew 설치
if [ "$DRY_RUN" = false ]; then
  log_info "Homebrew 설치 중..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || handle_error "Homebrew 설치 실패"

  # Homebrew PATH 설정
  if ! grep -q "brew shellenv" /Users/$USER/.zprofile; then
    echo '# Homebrew 설정' >> /Users/$USER/.zprofile
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/$USER/.zprofile
  fi
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# 패키지 및 앱 설치
if [ "$DRY_RUN" = true ]; then
  log_info "패키지 및 앱 설치 검증 중..."

  # 기본 패키지 검증
  brew info mas > /dev/null 2>&1
  brew info yarn > /dev/null 2>&1
  brew info nvm > /dev/null 2>&1

  # 앱스토어 앱 검증
  mas info 869223134 > /dev/null 2>&1 # 카카오톡
  mas info 803453959 > /dev/null 2>&1 # 슬랙
  mas info 1429033973 > /dev/null 2>&1 # RunCat
  mas info 937984704 > /dev/null 2>&1 # Amphetamine
  mas info 540348655 > /dev/null 2>&1 # Monosnap

  # GUI 앱 검증
  brew info --cask postman > /dev/null 2>&1
  brew info --cask sourcetree > /dev/null 2>&1
  brew info --cask google-chrome > /dev/null 2>&1
  brew info --cask iterm2 > /dev/null 2>&1
  brew info --cask discord > /dev/null 2>&1
  brew info --cask amazon-q > /dev/null 2>&1
  brew info --cask arc > /dev/null 2>&1
  brew info --cask cursor > /dev/null 2>&1
  brew info --cask proxyman > /dev/null 2>&1
else
  log_info "패키지 및 앱 설치 중..."
  
  # 기본 패키지 설치
  run_cmd "brew install mas"
  run_cmd "brew install yarn --ignore-dependencies"
  run_cmd "brew install nvm"

  # 앱스토어 앱 설치
  run_cmd "mas install 869223134" # 카카오톡
  run_cmd "mas install 803453959" # 슬랙
  run_cmd "mas install 1429033973" # RunCat
  run_cmd "mas install 937984704" # Amphetamine
  run_cmd "mas install 540348655" # Monosnap

  # GUI 앱 설치
  run_cmd "brew install --cask postman"
  run_cmd "brew install --cask sourcetree"
  run_cmd "brew install --cask google-chrome"
  run_cmd "brew install --cask iterm2"
  run_cmd "brew install --cask discord"
  run_cmd "brew install --cask amazon-q"
  run_cmd "brew install --cask arc"
  run_cmd "brew install --cask cursor"
  run_cmd "brew install --cask proxyman"
fi

# NVM 디렉토리 생성
run_cmd "mkdir -p ~/.nvm"

# Node.js 설치 (NVM 사용)
if [ "$DRY_RUN" = false ]; then
  # NVM 초기화 (일회성)
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  
  # Node 20 버전이 있으면 사용, 없으면 설치
  if [ "$(nvm ls 20 2>/dev/null | grep -c "v20")" -eq 0 ]; then
    log_info "Node.js 20 버전 설치 중..."
    nvm install 20
  else
    log_info "Node.js 20 버전이 이미 설치되어 있습니다"
  fi
  
  # Node 20을 기본 버전으로 설정
  nvm alias default 20
fi

# 보안 설정
if [ "$DRY_RUN" = false ]; then
  log_info "보안 설정 중..."
  read -p "앱 보안 경고 무시할까요? (y/n): " ignore
  if [[ $ignore == "y" ]]; then
    apps=("Postman" "Sourcetree" "Google Chrome" "iTerm" "Discord" "Amazon Q" "Arc" "Cursor" "Proxyman")
    paths=("/Applications/Postman.app" "/Applications/Sourcetree.app" "/Applications/Google Chrome.app" "/Applications/iTerm.app" "/Applications/Discord.app" "/Applications/Amazon Q.app" "/Applications/Arc.app" "/Applications/Cursor.app" "/Applications/Proxyman.app")
    
    for i in "${!apps[@]}"; do
      name="${apps[$i]}"
      path="${paths[$i]}"
      if [ -d "$path" ]; then
        sudo xattr -dr com.apple.quarantine "$path"
      fi
    done
  fi
fi

# 폰트 설치
if [ "$DRY_RUN" = false ]; then
  log_info "폰트 설치 중..."
  run_cmd "cp -a ./fonts/. ~/Library/Fonts"
fi

# VSCode 설정
log_info "VSCode 설정 중..."
run_cmd "chmod 755 ./vscode/install.sh"
if [ "$DRY_RUN" = true ]; then
  ./vscode/install.sh --dry-run
else
  ./vscode/install.sh
fi

# Cursor 설정
log_info "Cursor 설정 중..."
run_cmd "chmod 755 ./cursor/install.sh"
if [ "$DRY_RUN" = true ]; then
  ./cursor/install.sh --dry-run
else
  ./cursor/install.sh
fi

# ZSH 설정
log_info "ZSH 설정 중..."
run_cmd "chmod 755 ./zsh/install.sh"
if [ "$DRY_RUN" = true ]; then
  ./zsh/install.sh --dry-run
else
  ./zsh/install.sh
fi

# 완료 메시지
if [ "$DRY_RUN" = true ]; then
  log_info "드라이런 모드 완료"
else
  log_info "설치 완료"
  log_info "터미널 다시 시작하거나 'zsh' 명령어로 새 셸 사용해보세요"
fi
