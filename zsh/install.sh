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

# 이 아래부터는 실제 설치 모드에서만 실행됨
log_info "ZSH 설정 중..."

# Oh My Zsh 설치
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  log_info "Oh My Zsh 설치 중..."
  run_cmd "git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh"
fi

# 메인 스크립트에서 입력받은 닉네임 사용
if [ -z "$NICKNAME" ]; then
  # 만약 메인 스크립트에서 닉네임이 전달되지 않았다면 직접 물어봄
  log_info "닉네임을 설정합니다..."
  read -p "원하는 닉네임을 입력해주세요: " nickname
  nickname=${nickname:-$(whoami)} # 입력이 없으면 현재 사용자 이름 사용
else
  # 메인 스크립트에서 전달된 닉네임 사용
  nickname=$NICKNAME
fi

# .zshrc 파일 복사 및 닉네임 설정
log_info ".zshrc 파일 복사 및 닉네임 설정 중..."
run_cmd "cp ./zsh/.zshrc $HOME/.zshrc"

# 닉네임 교체
log_info "닉네임을 '${nickname}'으로 설정합니다..."
run_cmd "sed -i \"\" \"s/YOUR_NICKNAME/${nickname}/g\" $HOME/.zshrc"

# 테마 확인
if [ -f "$HOME/.oh-my-zsh/themes/agnoster.zsh-theme" ]; then
  log_info "agnoster 테마 설치 완료"
fi

# 완료
log_info "ZSH 설정 완료"
log_info "터미널을 다시 시작하거나 'chsh -s $(which zsh)'를 실행해 zsh로 바꾸세요."
