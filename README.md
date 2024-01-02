# To-The-Nature

## 프로젝트 소개
To-The-Nature 프로젝트는 캠핑장에 관련된 웹 애플리케이션입니다. 사용자가 쉽게 캠핑장을 찾고 예약할 수 있는 기능을 제공합니다.

## 팀 소개
<img width="959" alt="팀 소개" src="https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/98e4186c-6841-4618-9eb0-9319352ecc8c">



| ![김상우](https://github.com/xiexiehanoi.png?size=20) | ![이준일](https://github.com/GaleRhee.png?size=20) | ![이진경](https://github.com/w0wjk13.png?size=20) | ![설석현](https://github.com/tjftjrgus777.png?size=20) |
|:---------------------------------------------------:|:------------------------------------------------:|:------------------------------------------------:|:---------------------------------------------------:|
| [김상우](https://github.com/xiexiehanoi)             | [이준일](https://github.com/GaleRhee)             | [이진경](https://github.com/w0wjk13)               | [설석현](https://github.com/tjftjrgus777)             |

### 역할 분담
- **이진경**: 로그인, 회원가입, 아이디/비밀번호 찾기, 관리자 페이지 등
- **이준일**: 메인페이지 (three.js), navbar, 캠핑장 리스트 페이지, CSS
- **설석현**: 예약, 결제 페이지, 페이지네이션, SMTP 기능, 오류 수정
- **김상우**: 상세페이지, 찜하기 기능, 리뷰/별점, 네이버 지도 API, DB설계

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


## DB설계
<details>
<summary>DB</summary>
<div markdown="1">

  ![image](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/dd2fe434-f6fd-4450-9d1f-6957aecc0224)

</div>

</details>




## 유저 플로우
<details>
<summary>DB</summary>
<div markdown="1">
  
  <img width="958" alt="userflow" src="https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/d96dbbb9-98de-4e99-80c6-37ea0f89c80b">

</div>
</details>

## 페이지 설명

## 회원가입/ 로그인/ 비밀번호 찾기
![회원가입](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/49265968-d4e2-4ffd-9a73-c14d1ca7de7c)
![비밀번호 찾기](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/d7730568-b159-40cd-a344-335cb84d52c2)
![아이디찾기](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/c42a8649-74bd-4b0d-9a55-f30f649272cf)

### 로그인
<details>
<summary>아이디 저장</summary>
<br>
아이디 저장 체크 시, 재로그인을 했을 때 아이디란에 아이디가 입력되고 아이디 저장 체크박스에 체크 표시 
</details>

### 회원가입
<details>
<summary>아이디 중복확인</summary>
<br>
중복확인 버튼 클릭하면 이미 가입된 아이디 또는 사용 가능한 아이디라는 알림창 표시 
</details>

## 메인페이지
![메인페이](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/84cbd240-235e-4fb6-9ac1-0c70e559adc1)

## 리스트페이지
![캠핑찾기](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/81e8917b-6cad-415f-be3d-9c45b08c0203)


## 상세페이지 기능 
![찜하기](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/ea6a2c92-4246-4ef2-aa04-5e303e1ace2d)
![리뷰달기](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/b4efd44e-2484-4355-b0b9-8613ae2fd746)


### 찜하기 기능
<details>
<summary>사용자 참여형 찜하기 기능</summary>
<br>
- 비로그인 상태에서는 찜하기 기능 이용 시 로그인 요청 알림창 표시<br>
- 로그인한 사용자는 찜하기 기능을 이용해 캠핑장을 찜할 수 있으며, 찜한 횟수가 Ajax형식을 통해 업데이트. 하트를 다시 클릭하면 찜이 해제되며, 찜한 횟수 감소
</details>

### 캠핑 시설 사진 더보기
<details>
<summary>캠핑장의 시설 사진 탐색</summary>
<br>
캠핑장의 다양한 시설 사진은 그리드 형식으로 제공. 기본적으로 5장의 사진이 표시되며, 'More' 버튼을 통해 추가 사진 로딩
</details>

### 리뷰 기능
<details>
<summary>사용자 리뷰 및 별점 기능</summary>
<br>
- 비로그인 상태에서 리뷰 작성 시 로그인 유도 알림창이 표시됩니다.<br>
- 로그인한 사용자만 리뷰를 작성 가능하며, 5점 만점의 별점 부여 기능<br>
- 전체 리뷰 수와 리뷰 별점의 평균을 계산하여 캠핑장의 평균 평점을 표시.
</details>

### 지도 기능
<details>
<summary>네이버 지도 API를 활용한 위치 표시</summary>
<br>
- 네이버 지도 API를 사용
- `camping_detail`에 저장된 좌표를 활용하여 캠핑장의 위치와 명칭, 상세 주소를 제공.
</details>

### 예약 버튼


<details>
<summary>예약 프로세스의 사용자 경험 최적화</summary>
<br>
- 비로그인 상태에서 예약 버튼 클릭 시 로그인 유도 알림창이 표시<br>
- 로그인한 사용자는 예약 버튼을 클릭하여 입실일, 퇴실일, 인원 수를 선택할 수 있으며, 총 숙박 일정과 총 금액이 자동으로 계산.
</details>

** 담당 **: 설석현
## 예약 페이지
![예약페이지](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/cf7a92f6-3937-4d80-a61e-2939f2a73631)
![image](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/327d5d47-e435-4e61-8f3d-8e9e0311ddaf)

## 결제 페이지
![image](https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/5237bfb5-b19d-4e9f-a3c0-c6dce73a202e)

