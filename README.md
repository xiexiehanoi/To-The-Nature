# To-The-Nature

## 프로젝트 소개
To-The-Nature 프로젝트는 캠핑장에 관련된 웹 애플리케이션입니다. 사용자가 쉽게 캠핑장을 찾고 예약할 수 있는 기능을 제공합니다.

## 팀 소개
<img width="80%" alt="팀 소개" src="https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/98e4186c-6841-4618-9eb0-9319352ecc8c">

## 
| <img src="https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/d03cfffe-1db3-4a25-a287-615b9a872f36" size=10%> | ![이준일](https://github.com/GaleRhee.png?size=40) | ![이진경](https://github.com/w0wjk13.png?size=40) | ![설석현](https://github.com/tjftjrgus777.png?size=40) |
|:----------------------------------------------------------------------------------------------------------------------:|:------------------------------------------------:|:------------------------------------------------:|:----------------------------------------------------:|
| [김상우](https://github.com/xiexiehanoi)                                                                                | [이준일](https://github.com/GaleRhee)             | [이진경](https://github.com/w0wjk13)               | [설석현](https://github.com/tjftjrgus777)             |


## 프로젝트 링크
http://110.165.18.20:8091/nature/


### 역할 분담 (Full Stack)
- **이진경**
  - 로그인,
  - 회원가입
  - 아이디/비밀번호 찾기
  - 관리자 페이지
- **이준일**
  - 메인페이지
  - 네비게이션 컴포넌트
  - 캠핑장 리스트 페이지
- **설석현**
  - 예약 페이지
  - 결제 페이지
  - 페이지네이션
  - SMTP 기능
  - 오류 수정
- **김상우**
  - 상세페이지
  <details>
    <summary>찜하기 기능</summary>
    <div markdown="1">
  
    - **소개**: 사용자가 캠핑 장소에 대한 관심을 표시할 수 있는 '찜하기' 기능을 구현합니다.
    
    - **구현 방법**:
  
      - **프론트엔드 (JavaScript & jQuery)**:
        - 사용자가 찜하기 아이콘(#heartIcon)을 클릭할 때 이벤트가 발생합니다.
        - 세션을 통해 로그인 상태를 확인하고, 로그인한 사용자만 찜하기 기능을 사용할 수 있습니다.
        - 찜하기 추가와 삭제를 Ajax 호출을 통해 서버에 요청합니다. 해당 요청은 사용자의 찜하기 상태(iswished)에 따라 다른 URL (insertWish 또는 deleteWish)로 전송됩니다.
        - 서버로부터의 응답에 따라 찜하기 상태를 업데이트하고, 찜한 횟수를 화면에 반영합니다.
  
      - **백엔드 (Spring & MyBatis)**:
        - **WishController**는 찜하기 추가와 삭제 요청을 처리하며 각 요청은 **insertWish**와 **deleteWish** 메서드로 라우팅됩니다.
        - **WishService** 클래스는 DAO에 해당 요청을 전달합니다.
        - **WishDao**는 MyBatis를 사용하여 실제 데이터베이스 작업을 수행합니다. 데이터베이스에 찜하기를 추가하거나 삭제하는 SQL 쿼리를 실행합니다.
        - **WishDto**는 찜하기 관련 데이터(사용자 ID, 캠핑 장소 번호 등)를 전달하는 데이터 전송 객체입니다.
        - MyBatis 매퍼(**wishMapper.xml**)는 **WishDao**의 SQL 쿼리를 정의하고, 찜하기 데이터를 데이터베이스에 추가/삭제하는 SQL 쿼리가 명세되어 있습니다.
  
    - **시연 영상**: 시연 영상을 첨부할 수 있습니다.
  
    </div>
  </details>
  
  <details>
  <summary>리뷰/별점</summary>
    <div markdown="1">
      
    - **소개**: 사용자가 캠핑 장소에 대한 관심을 표시할 수 있는 '찜하기' 기능을 구현합니다.
    
    - **구현 방법**:

      - **프론트엔드 (JavaScript & jQuery)**:
        - 사용자가 리뷰 등록 버튼(.btn02)을 클릭하면 이벤트가 트리거됩니다.
        - 로그인 상태를 검증하고, 로그인하지 않은 사용자는 리뷰 작성을 할 수 없습니다.
        - 사용자가 선택한 별점과 리뷰 내용을 가져와 서버에 전송합니다.
        - Ajax를 통해 서버에 리뷰 데이터를 POST 요청하며, 성공적으로 등록되면 사용자에게 알림을 표시합니다.
        - 리뷰 목록을 가져오는 별도의 Ajax GET 요청을 통해 사용자 인터페이스에 리뷰를 동적으로 표시합니다.
      - **백엔드 (Spring & MyBatis)**:
        - ReviewController는 리뷰 등록 및 조회 요청을 처리합니다.
        - ReviewService는 DAO를 통해 데이터베이스 작업을 수행합니다.
        - ReviewDao는 MyBatis를 사용하여 리뷰 데이터를 조회하거나 삽입합니다.
        - ReviewDto는 리뷰 데이터를 전달하는 데 사용되며, 사용자 ID, 캠핑 장소 번호, 별점, 내용 등을 포함합니다.
        - MyBatis 매퍼(reviewMapper.xml)는 리뷰 조회 및 삽입에 필요한 SQL 쿼리를 정의합니다.
    </div>
</details>

  - 네이버 지도 API
  - DB설계
  - 관리자 페이지 검색 기능

## 사용 Stack
<img width="80%" alt="팀 소개" src="https://github.com/xiexiehanoi/To-The-Nature/assets/123315364/221592b5-fb22-4dc4-bb1d-6b5be92d745b">
