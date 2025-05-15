# how-i-met-my-laptop

새로운 맥북을 구입한 기념으로 **개발 환경 설정을 자동으로 수행**하는 shell script를 작성했습니다.  
다음과 같은 툴들을 설치합니다.

| Tool name     | 비고                                 |
| ------------- | ------------------------------------ |
| Node.js       | 버전 20                              |
| nvm           | Node.js 버전 관리 도구               |
| vscode        | 확장프로그램까지 포함                |
| cursor        | AI 기반 코드 편집기                  |
| Arc           | 웹 브라우저                          |
| Proxyman      | HTTP 디버깅 프록시 도구              |
| KakaoTalk     | 메신저                               |
| Slack         | 팀 커뮤니케이션 도구                 |
| Discord       | 커뮤니티 플랫폼                      |
| RunCat        | CPU 사용량 등을 표시해주는 생산성 앱 |
| Amphetamine   | 맥북 화면이 꺼지지 않게 해주는 앱    |
| Monosnap      | 스크린 캡쳐 앱                       |
| postman       | API 테스트 도구                      |
| sourcetree    | Git GUI 클라이언트                   |
| google-chrome | 웹 브라우저                          |
| iterm2        | 터미널 에뮬레이터                    |
| AmazonQ       | 터미널 명령어 자동완성 도구          |

## ZSH 설정

Oh My Zsh와 함께 agnoster 테마가 설치됩니다. 이 테마는 Git 정보와 함께 현재 작업 중인 디렉토리 정보를 시각적으로 표시해 줍니다.

설치 과정에서 터미널에 표시될 닉네임을 직접 입력하라는 메시지가 표시됩니다. 이 입력한 닉네임은 자동으로 `.zshrc` 파일에 설정됩니다. 아무 입력 없이 Enter 키를 누르면 현재 사용자 이름이 기본값으로 사용됩니다.

## Node.js 설정

Node.js는 NVM을 통해 설치되며, 버전 20이 기본 버전으로 자동 설정됩니다.
NVM을 통해 설치된 Node.js는 `nvm alias default 20` 명령으로 전역 기본값으로 설정되어,
터미널을 열 때마다 추가 명령 없이 Node.js 20 버전이 자동으로 활성화됩니다.

다른 Node.js 버전으로 변경하고 싶다면 아래 명령어를 사용하세요:

```
nvm install [원하는버전]
nvm alias default [원하는버전]
```

## 드라이런 모드

설치 전에 시스템 환경을 변경하지 않고 스크립트가 어떻게 작동하는지 확인하려면 드라이런 모드를 사용할 수 있습니다:

```
./install.sh --dry-run
```

드라이런 모드에서는 실제 설치나 변경 없이 스크립트가 수행할 작업을 미리 확인할 수 있습니다.

## 설치 방법

터미널에서 아래 명령어를 순서대로 실행하세요:

```bash
# 1. Git이 설치되어 있지 않다면 설치됩니다
git --version

# 2. 리포지토리 복제
git clone https://github.com/sjoleee/how-i-met-my-laptop.git

# 3. 디렉토리로 이동
cd how-i-met-my-laptop

# 4. 실행 권한 부여
chmod +x install.sh

# 5. 설치 스크립트 실행
./install.sh
```

드라이런 모드로 먼저 테스트해보려면:

```bash
./install.sh --dry-run
```
