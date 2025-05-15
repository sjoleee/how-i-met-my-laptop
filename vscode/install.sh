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


#####################################################
# 1. 테마 및 시각화
#####################################################

// Super One Dark Theme
// VS Code 어두운 테마
run_cmd "code --install-extension seansassenrath.vscode-theme-superonedark"

// Material Icon Theme
// 파일 및 폴더 아이콘 테마
run_cmd "code --install-extension pkief.material-icon-theme"

// Color Highlight
// 색상 코드 시각화
run_cmd "code --install-extension naumovs.color-highlight"

// Zoom Bar
// 에디터 확대/축소 도구
run_cmd "code --install-extension wraith13.zoombar-vscode"


#####################################################
# 2. AI 및 코드 지원 도구
#####################################################

// GitHub Copilot
// AI 기반 코드 자동 완성 도구
run_cmd "code --install-extension github.copilot"

// GitHub Copilot Chat
// AI와 채팅을 통한 코딩 도움말
run_cmd "code --install-extension github.copilot-chat"

// IntelliCode
// AI 기반 코드 완성 및 제안
run_cmd "code --install-extension visualstudioexptteam.vscodeintellicode"

// IntelliCode API Usage Examples
// API 사용 예제 제안
run_cmd "code --install-extension visualstudioexptteam.intellicode-api-usage-examples"

// AWS CodeWhisperer for Command Line Companion
// AWS 코드 자동완성 및 제안 도구
run_cmd "code --install-extension amazonwebservices.codewhisperer-for-command-line-companion"


#####################################################
# 3. 웹 개발
#####################################################

// HTML CSS Support
// HTML 문서에서 CSS 클래스 자동완성
run_cmd "code --install-extension ecmel.vscode-html-css"

// Live Server
// HTML/CSS/JS 파일 실시간 미리보기
run_cmd "code --install-extension ritwickdey.liveserver"

// SVG
// SVG 파일 편집 및 미리보기
run_cmd "code --install-extension jock.svg"

// TypeScript Error Translator
// TypeScript 오류 메시지를 이해하기 쉽게 번역
run_cmd "code --install-extension mattpocock.ts-error-translator"

// Template String Converter
// 문자열을 템플릿 문자열로 자동 변환해주는 도구
run_cmd "code --install-extension meganrogge.template-string-converter"

// MDX
// Markdown과 JSX 결합 언어 지원
run_cmd "code --install-extension unifiedjs.vscode-mdx"


#####################################################
# 4. CSS 관련 도구
#####################################################

// Tailwind CSS IntelliSense
// Tailwind CSS 클래스 자동완성 및 문법 강조
run_cmd "code --install-extension bradlc.vscode-tailwindcss"

// cssrem
// px를 rem 단위로 변환해주는 도구
run_cmd "code --install-extension cipchk.cssrem"

// PostCSS Language Support
// PostCSS 문법 지원 및 강조
run_cmd "code --install-extension csstools.postcss"

// styled-components
// styled-components CSS-in-JS 지원
run_cmd "code --install-extension styled-components.vscode-styled-components"

// Emotion Snippets
// Emotion CSS-in-JS 라이브러리 코드 조각
run_cmd "code --install-extension ijs.emotionsnippets"


#####################################################
# 5. 코드 품질 및 포맷팅
#####################################################

// ESLint
// JavaScript 코드 품질 검사 도구
run_cmd "code --install-extension dbaeumer.vscode-eslint"

// Prettier - Code formatter
// 코드 자동 포맷팅 도구
run_cmd "code --install-extension esbenp.prettier-vscode"

// EditorConfig
// 다양한 편집기 간의 일관된 코딩 스타일 유지
run_cmd "code --install-extension editorconfig.editorconfig"


#####################################################
# 6. Python 개발
#####################################################

// Python
// Python 프로그래밍 언어 지원
run_cmd "code --install-extension ms-python.python"

// Pylance
// Python 언어 서버 기능 향상
run_cmd "code --install-extension ms-python.vscode-pylance"

// Python Debugger
// Python 디버깅 도구
run_cmd "code --install-extension ms-python.debugpy"


#####################################################
# 7. Java 개발
#####################################################

// Language Support for Java
// Java 프로그래밍 언어 지원
run_cmd "code --install-extension redhat.java"

// Extension Pack for Java
// Java 개발을 위한 확장 모음
run_cmd "code --install-extension vscjava.vscode-java-pack"

// Debugger for Java
// Java 디버깅 도구
run_cmd "code --install-extension vscjava.vscode-java-debug"

// Project Manager for Java
// Java 프로젝트 관리 도구
run_cmd "code --install-extension vscjava.vscode-java-dependency"

// Test Runner for Java
// Java 테스트 실행 도구
run_cmd "code --install-extension vscjava.vscode-java-test"

// Maven for Java
// Maven 빌드 도구 지원
run_cmd "code --install-extension vscjava.vscode-maven"

// Gradle for Java
// Gradle 빌드 도구 지원
run_cmd "code --install-extension vscjava.vscode-gradle"


#####################################################
# 8. Flutter/Dart 개발
#####################################################

// Dart
// Dart 프로그래밍 언어 지원
run_cmd "code --install-extension dart-code.dart-code"

// Flutter
// Flutter 프레임워크 지원
run_cmd "code --install-extension dart-code.flutter"


#####################################################
# 9. Git 및 협업 도구
#####################################################

// GitLens
// Git 저장소 시각화 및 협업 기능 강화
run_cmd "code --install-extension eamodio.gitlens"

// Git Graph
// Git 이력을 그래프로 시각화
run_cmd "code --install-extension mhutchie.git-graph"

// GitHub Repositories
// GitHub 저장소 직접 접근 및 편집
run_cmd "code --install-extension github.remotehub"

// Azure Repos
// Azure DevOps 저장소 연동
run_cmd "code --install-extension ms-vscode.azure-repos"

// Remote Repositories
// 원격 저장소에 직접 접근하여 작업
run_cmd "code --install-extension ms-vscode.remote-repositories"

// Atlassian for VS Code
// Jira 및 Bitbucket과 통합하여 작업 관리
run_cmd "code --install-extension atlassian.atlascode"


#####################################################
# 10. 데이터 및 국제화 도구
#####################################################

// i18n Ally
// 다국어 지원 및 번역 관리 도구
run_cmd "code --install-extension lokalise.i18n-ally"

// YAML
// YAML 파일 편집 지원
run_cmd "code --install-extension redhat.vscode-yaml"

// vscode-jq
// JSON 처리를 위한 jq 도구 지원
run_cmd "code --install-extension dandric.vscode-jq"


#####################################################
# 11. 개발 생산성 도구
#####################################################

// TODO Highlight
// TODO 주석 강조 표시
run_cmd "code --install-extension wayou.vscode-todo-highlight"

// Run on Save
// 파일 저장 시 자동으로 스크립트 실행
run_cmd "code --install-extension emeraldwalk.runonsave"

// Code Runner
// 다양한 프로그래밍 언어 코드 실행 지원
run_cmd "code --install-extension formulahendry.code-runner"


#####################################################
# 12. 기타 유틸리티
#####################################################

// ZipFS
// ZIP 파일을 파일 시스템으로 마운트하여 탐색 가능
run_cmd "code --install-extension arcanis.vscode-zipfs"

// Omlet
// 코드 의존성 파악 도구
run_cmd "code --install-extension omlet.omlet-vscode-extension"

// File Tree Generator
// 파일 구조를 트리 형태로 시각화
run_cmd "code --install-extension shinotatwu-ds.file-tree-generator"


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
