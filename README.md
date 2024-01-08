# To-The-Nature

## 프로젝트 소개
To-The-Nature 프로젝트는 캠핑장에 관련된 웹 애플리케이션입니다. 사용자가 쉽게 캠핑장을 찾고 예약할 수 있는 기능을 제공합니다.

## 팀 소개
<img width="959" alt="팀 소개" src="https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/98e4186c-6841-4618-9eb0-9319352ecc8c">



| <img src="https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/d03cfffe-1db3-4a25-a287-615b9a872f36" width="40"> | ![이준일](https://github.com/GaleRhee.png?size=40) | ![이진경](https://github.com/w0wjk13.png?size=40) | ![설석현](https://github.com/tjftjrgus777.png?size=40) |
|:----------------------------------------------------------------------------------------------------------------------:|:------------------------------------------------:|:------------------------------------------------:|:----------------------------------------------------:|
| [김상우](https://github.com/xiexiehanoi)                                                                                | [이준일](https://github.com/GaleRhee)             | [이진경](https://github.com/w0wjk13)               | [설석현](https://github.com/tjftjrgus777)             |



### 역할 분담
- **이진경**: 로그인, 회원가입, 아이디/비밀번호 찾기, 관리자 페이지 등
- **이준일**: 메인페이지 (three.js), navbar, 캠핑장 리스트 페이지, CSS
- **설석현**: 예약, 결제 페이지, 페이지네이션, SMTP 기능, 오류 수정
- **김상우**: 상세페이지, 찜하기 기능, 리뷰/별점, 네이버 지도 API, DB설계

## 사용 Stack

## 사용 Stack

### 백엔드
| ![Spring](https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white) | ![JSP](https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=java&logoColor=white) | ![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white) | ![MyBatis](https://img.shields.io/badge/MyBatis-FF0000?style=for-the-badge&logo=mybatis&logoColor=white) |
| ----------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| Spring                                                                                                | JSP                                                                                          | MySQL                                                                                              | MyBatis                                                                                             |

### 프론트엔드
| ![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=html5&logoColor=white) | ![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=css3&logoColor=white) | ![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black) | ![Bootstrap](https://img.shields.io/badge/Bootstrap-7952B3?style=for-the-badge&logo=bootstrap&logoColor=white) | ![jQuery](https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jquery&logoColor=white) |
| ----------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------ |
| HTML5                                                                                                 | CSS3                                                                                                | JavaScript                                                                                              | Bootstrap                                                                                               | jQuery                                                                                                  |

### 기타 사용 도구
| ![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white) | ![Apache Tomcat](https://img.shields.io/badge/Apache%20Tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=black) | ![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white) |
| ---------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------- |
| Jenkins                                                                                                          | Apache Tomcat                                                                                            | GitHub                                                                                               |

### 기능 개요

- **찜하기 기능**: 
  - 비로그인 시 로그인 요청
  - 로그인 사용자는 찜 가능, Ajax로 찜 횟수 업데이트

- **캠핑 시설 사진 더보기**: 
  - 기본 5장의 사진 표시
  - 'More' 버튼으로 추가 사진 로딩

- **리뷰 기능**: 
  - 비로그인 시 로그인 유도
  - 로그인 사용자에게 별점 부여 및 리뷰 작성 가능
  - 평균 별점 및 리뷰 수 표시

- **지도 기능**: 
  - 네이버 지도 API 활용
  - 캠핑장 위치, 명칭, 상세 주소 표시

- **예약 버튼**: 
  - 비로그인 시 로그인 유도
  - 로그인 사용자는 입실/퇴실일, 인원 선택 및 총 금액 계산 가능

## 예약 페이지
![예약페이지](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/cf7a92f6-3937-4d80-a61e-2939f2a73631)
![image](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/327d5d47-e435-4e61-8f3d-8e9e0311ddaf)

### 기능 개요

### 예약 기능
- 부트스트랩 모달 형식 사용하여 사용자 친화적 인터페이스 제공
- 입실일과 퇴실일 선택: 사용자가 캘린더를 통해 날짜를 쉽게 선택할 수 있도록 구현
- 인원 수 설정: 성인 및 어린이의 명수를 사용자가 직접 설정 가능

### 요약 정보 표시
- 총 금액, 총 인원 수, 총 숙박 일수를 예약 페이지의 마지막 부분에 명확하게 표시
- 사용자가 한 눈에 예약 상세 정보를 확인할 수 있도록 설계

## 결제 페이지
![image](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/5237bfb5-b19d-4e9f-a3c0-c6dce73a202e)

### 기능 개요
- 예약 페이지에서 입력된 예약 내용을 가져와 표시
- 결제 시 주의 사항 안내

### 결제 시스템
- `Portone` 결제 시스템 통합
- 신용카드 결제 기능 구현
- 실시간 카드 결제 처리 및 `Portone`을 통한 결제 확인
