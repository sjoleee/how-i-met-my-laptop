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
    return 0
  else
    eval "$cmd"
    return $?
  fi
}

# 드라이런 모드에서는 아무것도 하지 않음
if [ "$DRY_RUN" = true ]; then
  exit 0
fi

# 실제 설치 모드에서만 실행
log_info "ZSH 설정 중..."

# Oh My Zsh 설치
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  log_info "Oh My Zsh 설치 중..."
  run_cmd "git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh"
fi

# .zshrc 파일 복사
log_info ".zshrc 파일 복사 중..."
run_cmd "cp ./zsh/.zshrc $HOME/.zshrc"

# 테마 확인
if [ -f "$HOME/.oh-my-zsh/themes/agnoster.zsh-theme" ]; then
  log_info "agnoster 테마 설치 완료"
fi

# 완료
log_info "ZSH 설정 완료"
log_info "터미널을 다시 시작하거나 'chsh -s $(which zsh)'를 실행해 zsh로 바꾸세요."
