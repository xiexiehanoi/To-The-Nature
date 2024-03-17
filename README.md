# To-The-Nature

## 프로젝트 소개
To-The-Nature 프로젝트는 캠핑장에 관련된 웹 애플리케이션입니다. 사용자가 쉽게 캠핑장을 찾고 예약할 수 있는 기능을 제공합니다.
<hr>
<br/>

## 팀 소개
<img width="80%" alt="팀 소개" src="https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/98e4186c-6841-4618-9eb0-9319352ecc8c">

## 
| <img src="https://avatars.githubusercontent.com/u/123315364?v=4&s=100" width="100" height="100"> | <img src="https://avatars.githubusercontent.com/u/44179492?v=4&s=100" width="100" height="100"> | <img src="https://avatars.githubusercontent.com/u/70689639?v=4&s=100" width="100" height="100"> | <img src="https://avatars.githubusercontent.com/u/81728111?v=4&s=100" width="100" height="100"> |
|:----------------------------------------------------------------------------------------------------------------------:|:------------------------------------------------:|:------------------------------------------------:|:----------------------------------------------------:|
| [김상우](https://github.com/xiexiehanoi)                                                                                | [이준일](https://github.com/GaleRhee)             | [이진경](https://github.com/w0wjk13)               | [설석현](https://github.com/tjftjrgus777)             |
<hr>
<br/>

## 프로젝트 링크
http://110.165.18.20:8091/nature/ (현재 사용X)
<hr>

## 사용 Stack
<img width="80%" alt="팀 소개" src="https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/221592b5-fb22-4dc4-bb1d-6b5be92d745b">
<hr>

### 역할 분담 (Full Stack)

- **이진경**
    <details>
    <summary>로그인</summary>

    - **프론트엔드(JavaScript & jQuery)**
      - 사용자 개인정보 입력 폼 (아이디, 비밀번호, 이메일 등)
      - 입력 데이터의 유효성 검사 및 에러 메시지 표시
      - Ajax를 통한 회원가입 요청 및 응답 처리
      
    - **백엔드(Spring & MyBatis)**
      - 입력된 사용자 데이터의 유효성 검증
      - 회원 정보 데이터베이스에 저장
      - 회원가입 성공/실패 응답 처리
    </details>
        
    <details>
    <summary>회원가입</summary>
        
  - **프론트엔드(JavaScript & jQuery)**
    - 사용자 개인정보 입력 폼 (아이디, 비밀번호, 이메일 등)
    - 입력 데이터의 유효성 검사 및 에러 메시지 표시
    - Ajax를 통한 회원가입 요청 및 응답 처리

  - **백엔드(Spring & MyBatis)**
    - 입력된 사용자 데이터의 유효성 검증
    - 회원 정보 데이터베이스에 저장
    - 회원가입 성공/실패 응답 처리
    </details>
    
    <details>
    <summary>아이디/비밀번호 찾기</summary>
        
      - **프론트엔드(JavaScript & jQuery)**
        - 사용자에게 이름, 이메일 등 필요 정보 입력 폼 제공.
        - 입력 데이터의 유효성 검사 및 에러 메시지 표시.
        - Ajax를 통한 정보 찾기 요청 및 응답 처리.
      - **백엔드(Spring & MyBatis)**
        - 입력된 정보를 기반으로 사용자 식별.
        - 해당 사용자의 아이디 또는 임시 비밀번호 생성 및 반환.
        - 이메일을 통한 임시 비밀번호 전송 처리.
    </details>
    
    <details>
    <summary>관리자 페이지</summary>
        
      - **프론트엔드(JavaScript & jQuery)**
        - 관리자에게 사용자 관리 인터페이스 제공
        - 사용자 계정 관리, 데이터 조회, 통계 보기 등의 기능
        - Ajax를 통한 관리자 요청 및 응답 처리
      
      - **백엔드(Spring & MyBatis)**
        - 관리자 권한 검증 및 보안 유지
        - 사용자 계정 관리 (생성, 수정, 삭제) 기능
        - 데이터베이스에서 사용자 및 시스템 데이터 조회 및 반환
    </details>
 <br />
    
- **이준일**
  
  <details>
    <summary>메인 페이지</summary>
      
  - **프론트엔드 기능(Javascript, Three.js):**
    - **3D 시각화:**
      - Three.js 라이브러리를 사용하여 3D 그래픽을 웹 페이지에 통합
      - `main.js`를 통해 3D 씬 설정, 카메라, 렌더러, 조명, 3D 객체 생성 및 조정
      - 사용자 인터랙션에 반응하는 3D 애니메이션을 구현

    - **사용자 인터페이스:**
      - HTML 및 CSS를 사용하여 메인 페이지 레이아웃 및 스타일을 구성
      - JavaScript를 통해 사용자 세션 정보에 따른 조건부 렌더링 처리를 구현 (예: 로그인 여부에 따른 UI 변화)

    - **동적 콘텐츠 로딩:**
      - JavaScript 모듈(`main.js`)를 사용하여 Three.js 관련 코드를 동적으로 로딩하고 실행
      - Three.js 씬의 크기를 브라우저 창 크기에 맞게 조정
  </details>
    
  <details>
    <summary>캠핑장 리스트 페이지</summary>
  
  - **프론트엔드(JavaScript & jQuery):**
    - **검색 기능:**
      - 사용자가 검색어와 필터 옵션(캠핑장, 도, 시/군/구)을 입력할 수 있는 검색 폼을 제공
      - 검색 버튼 클릭 시, 입력된 검색어와 필터 옵션을 바탕으로 검색 결과 페이지로 이동
    - **캠핑장 목록 표시:**
      - 서버로부터 받은 캠핑장 데이터를 사용하여 캠핑장 목록을 동적으로 생성하고 표시
      - 각 캠핑장에 대한 정보(이미지, 이름, 위치, 이용 가능 여부 등)를 사용자에게 제공
  </details>
<br />

- **설석현**

    <details>
      <summary>예약 페이지</summary>
      
  - 결제 전 예약 페이지 화면 구성
  - 예약 내용들 출력
  - 안내 내용 고지
  - 총 인원 수, 금액 등을 결제 페이지로 전달
  - 빈방 여부 확인
   </details>
    
    <details>
      <summary>결제 페이지</summary>
  
  - **프론트엔드**:
    - 사용자가 결제 정보를 입력 후 '결제' 버튼 클릭하면, JavaScript와 jQuery를 사용하여 서버로 결제 정보를 전송
    - 사용자의 로그인 상태를 확인하여 로그인되지 않은 경우 결제를 진행 불가
    - 결제 정보와 관련된 데이터를 서버에 전송하고, 서버로부터의 응답에 따라 사용자에게 알림을 표시
    - PortOne SDK 이용하여 결제
  - **백엔드**:
    - POST 메서드를 사용하여 결제 정보를 받아들이고, 해당 정보를 서비스 계층으로 전달
    - 결제 정보를 DAO로 전달하여 데이터베이스에 저장
    - 결제 정보와 관련된 SQL 쿼리는 MyBatis 매퍼에서 정의, 데이터베이스 작업에 사용
    </details>

<br />

- **김상우**

    <details>
      <summary>상세 페이지</summary>
      
  - 캠핑장 주요 정보(이름, 주소, 객실수 등등) 자료 출력
  - 예약 페이지 화면 구성 및 자동 계산(총 인원, 금액, 객실 수) 
  - 네이버 지도 API를 사용하여 캠핑자 지도 출력 및 간단한 정보 지도에 함께 출력
  - 리뷰 작성 및 리뷰 목록 표시
    </details>
    
    <details>
      <summary>찜하기 기능</summary>
      
      - **프론트엔드 (JavaScript & jQuery)**:
        - 사용자가 찜하기 아이콘(#heartIcon)을 클릭할 때 이벤트가 발생
        - 세션을 통해 로그인 상태를 확인하고, 로그인한 사용자만 찜하기 기능을 사용 가능
        - 찜하기 추가와 삭제를 Ajax 호출을 통해 서버에 요청. 해당 요청은 사용자의 찜하기 상태(iswished)에 따라 다른 URL (insertWish 또는 deleteWish)로 전송됩니다.
        - 서버로부터의 응답에 따라 찜하기 상태를 업데이트하고, 찜한 횟수를 화면에 반영합니다.
    
      - **백엔드 (Spring & MyBatis)**:
        - 찜하기 추가와 삭제 기능
        - Unique Key를 통해 중복 찜하기 방지
        - 해당 캠프 전체 찜한 수 count
    </details>
    
    <details>
      <summary>리뷰 기능</summary>
      
      - 리뷰 별점 기능
      - 리뷰 총 별점 점수 출력
      - 리뷰 작성 기능 (회원만 작성 가능)
      - 작성된 전체 리뷰 목록 표시
    </details>
