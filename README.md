# how-i-met-my-laptop

새로운 맥북을 구입한 기념으로 **개발 환경 설정을 자동으로 수행**하는 shell script를 작성하였습니다.<br>
다음과 같은 툴들을 설치합니다.

| Tool name     | 비고                                 |
| ------------- | ------------------------------------ |
| node          | @18                                  |
| nvm           |                                      |
| vscode        | 확장프로그램까지 포함                |
| KakaoTalk     |                                      |
| Slack         |                                      |
| Discord       |                                      |
| RunCat        | CPU 사용량 등을 표시해주는 생산성 앱 |
| Amphetamine   | 맥북 화면이 꺼지지 않게 해주는 앱    |
| Monosnap      | 스크린 캡쳐 앱                       |
| postman       |                                      |
| sourcetree    |                                      |
| google-chrome |                                      |
| iterm2        |                                      |
| Fig           | git 명령어를 자동완성 해주는 앱      |

## 🚨 주의!

`.zshrc`에 저의 닉네임이 작성되어 있어요.<br>
아래 코드에서 제 닉네임을 지우고, 사용하시는 분의 닉네임으로 변경해주세요!

https://github.com/sjoleee/how-i-met-my-laptop/blob/440061be50dc47e2c6d24e220230013ed6b04e2e/zsh/.zshrc#L108-L110

## setting

1️⃣ 터미널에서 아래 명령어를 입력하면 git을 설치합니다.

```
git --version
```

2️⃣ git clone 명령어를 실행하여 개발 환경 스크립트를 복사합니다.

```
git clone https://github.com/sjoleee/how-i-met-my-laptop.git
```

3️⃣ 개발 환경을 자동으로 설정합니다.

```
./how-i-met-my-laptop/install.sh
```

🛠 이때, 권한 문제로 install.sh가 실행되지 않는다면?

1️⃣ 폴더로 진입합니다.

```
cd how-i-met-my-laptop
```

2️⃣ 실행 권한을 수정합니다.

```
chmod +x install.sh
```

3️⃣ 실행합니다.

```
./install.sh
```
