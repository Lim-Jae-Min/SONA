## 🎻소나(소리의 나눔)  [SONA]

![image](https://github.com/user-attachments/assets/d5a1070d-20ef-458f-8d3f-eff3a3347c89)

<br><br>

## ⁉️ 주제 선정 이유
현재, 학원에 소속되지 않은 강사들은 레슨생을 모집하기 쉽지 않은 상태라는 것을 파악하였다. 악기 레슨을 한다는 것을 입소문으로만 홍보를 하거나 네이버, 블로그, 카카오톡으로 홍보하는 것이 대부분이다.
SONA 를 통해 자신의 역량을 홍보하고, 학원에 소속된 강사만큼 체계적인 시스템으로 출결 관리를 하여 원활한 강의 활동을 할 수 있도록 하면 좋겠다는 목적을 갖고 프로젝트를 시작하였다.

<br><br>

## 👨🏻‍💻 개발 환경
- **Back-end**: Java
- **Front-end**: HTML, CSS, JavaScript, jQuery
- **View**: JSP
- **Framework**: Spring, MyBatis
- **DB**: MariaDB
- **WAS**: Tomcat (웹서버가 따로 없어서 Tomcat을 웹서버로 사용함)
- **Infra**: Amazon Web Services
- **버전 관리**: GitHub, SourceTree


<br><br>

## 🙆 전체 구현 기능
* 🎵 수강 신청
* 🤖 맞춤 강의 추천
* 📝 마이 페이지
* 🧑🏻‍💼 관리자
* 📢 공지사항
* ❓ Q&A
* 🔍 검색
* 📂 카테고리
* 📄 페이징

<br><br>

## 내가 맡은 기능 
**[로그인]**
* 로그인 성공 시 세션에 필요한 정보들을 저장
* 수강생 / 강사 / 관리자 에 맞는 페이지로 이동

<br>

**[회원 가입]**
* 아이디 중복 체크를 하지 않으면 회원가입 불가
* 비밀번호 일치 여부 (불일치 시 입력창 배경(빨간색) <-> 초록색)
* 회원 가입 시도 시 유효성 검사
* 수강생으로 선택 후 회원 가입 시 강의 스타일을 고를 수 있는 페이지로 이동
   
| ![image](https://github.com/user-attachments/assets/28f385a6-2300-46dc-ab0d-1f288af08577)|![image](https://github.com/user-attachments/assets/3ba5e962-0968-4cde-b86a-1f2ddec050ad)|
|:--:|:--:|
| 로그인 | 회원가입 |

<br>

| ![image](https://github.com/user-attachments/assets/3f11de0f-2412-4983-a473-d1a3364b11f8)|
|:--:|
| 강의 스타일 선택 |

<br><br>

**[마이페이지]**
* 메인 페이지 상단바에서 마이페이지로 이동


| ![2024-08-01012945-ezgif com-optimize (1)](https://github.com/user-attachments/assets/6ad0ef2c-f83f-4dbd-b453-faa9ea466fd3)|
|:--:|
| 마이페이지 |

<br><br>

* 마이페이지 기능
  
| ![image](https://github.com/user-attachments/assets/ebad92c4-7f37-4c3c-82b0-cb53e4d4c096) | ![image](https://github.com/user-attachments/assets/5a2e04ca-cabb-4747-9c13-80cc8bfd6c69) |
|:--:|:--:|
| 강사 정보 수정 | 강의 관리 |
| ![image](https://github.com/user-attachments/assets/7bedd7e3-8bb9-4a6a-8ec9-bd4b4faaeb60) | ![image](https://github.com/user-attachments/assets/97f586a5-ec58-42c0-875d-e1bfa8f56136) |
| 수강생 관리 | 강의 QnA 관리 |
| ![image](https://github.com/user-attachments/assets/b697c5a0-e5f6-4734-a527-cd4f98265205) | ![image](https://github.com/user-attachments/assets/a76a9fd4-25c4-49b2-8bd9-d7038d2aa53e) |
| 포인트 내역 | 내가 받은 리뷰 |

| ![image](https://github.com/user-attachments/assets/11402a3a-abf7-4c00-86d8-64a3c80e7c02) |
|:--:|
| 내가 작성한 리뷰 |





