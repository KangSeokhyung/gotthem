스프링 프로젝트

1. 아이디어 회의 및 아이디어 선정

- 우리 원활한 계획 수립을 위해 팀 규칙 정하기

2. 사용 기술 / 새로운 기술( 정보 수집 )

- DB - Mybatis (sboard 예제, bbs 예제- DB설정 참고)
- Spring Tools Suite
- 어떠한 기능을 구현하기 위해서는 다른 언어와 Tool이 필요하다면 받기 (nodeJS, AngularJS 등)
- PPT파일 참고

3. 프로젝트 규칙 정하기

- 자바파일 명명규칙(자바 파일은 첫글자 대문자에 카멜표기법), jsp파일 명명규칙(카멜표기법)
- 변수명 명명규칙(변수명만 봐도 의미를 알아볼 수 있게 변수명 지정)
- 패키지 명명 규칙, 자바/뷰파일 클라이언트단, 관리자단 패키지 구성(<-DB 구성 후 하기)
  - 예 ) com.TemeName.member.controller
  - 예 ) com.TemeName.member.dao/bean/service
  - DB ) com.TemeName.member.mepper/mybatis
  - 공통 ) com.TemeName.commons
- 코드는 가독하기 좋게 배치/구성, 주석 남발 금지(소스해석에 방해되지 않게)
- 수시로 통합 및 백업
- 나중에 사용 빈객체, 어노테이션 규칙정하기

4. 역할 분담 및 역할에 따른 DB생성(컬럼 생성)

- DB 테이블 이름 및 컬럼 이름도 알아 볼 수 있게 
- DB 제약조건 이름 설정
- 시퀀스 이름도 규칙에 맞게
- DB 수정 시 공유 폴더에 올리고 수정 날짜 기재 및 팀원들께 보고

5. 프로젝트 생성

6. Web.xml(배포서술자) 설정

- DispatcherServlet 설정 (경로 및 이름), URL Pattern 설정
- 빈 객체를 구성할 xml 파일을 Dispatcher로 할 것인지 다른 xml 파일 설정으로 할 것인지 선택
  - 특별한 설정은(Interceptor, Component-scan, Validation 등) DispatcherServlet1에서 나머지는 2로. 
  - Controller는 어노테이션으로 처리하여 다중 RequestMapping
  - Controller 객체 생성은 xml 빈으로 한다.
  - Service, DAO도 xml 빈으로 생성.
  - 나머지 클래스는 Inject-Name 이나 Autrowirde-Component 사용.
- context-param 설정 (되도록 DB설정은 Listener를 통한 applicationContext.xml 이용)
- DB설정만 모음
- Filter

7. 스프링 틀 만들기

- 가장 중요한 버전 선택 및 라이브러리 선택 (버전에 따른 호환이 가능해야 한다.)
- 필요한 라이브러리 pom.xml에 추가 및 테스트
- 기존의 라이브러리 lib 폴더에 추가
- 시큐리티 사용
- Bootstrap 틀 정하기
- JQ, JS, Bootstrap CDN
- Log4j 사용

8. 프로젝트 시작

- 간단한 테스트

9. Database 연결

10. 역할에 따른 관리자 or 사용자 페이지 작업 시작

- 필요한 부분 만들어서 팀원들에게 배포

---



명명규칙

1. 테이블 이름 및 컬럼 명명 규칙

테이블 이름

- 회원테이블 : member
- 매장테이블 : store
- 상품테이블 : product
- 주문테이블 : order
- 공지테이블 : noticebo
- 이벤트테이블 : eventbo
- Q&A테이블 : qnabo

컬럼 명명 규칙

- 회원 : mem_
- 매장 : sto_
- 상품 : pro_
- 결제 : order_
- 공지 : not_
- 이벤트 : eve_
- Q&A : qna_

2. 패키지 규칙

SRC 패키지

- kr.co.gotthem.member.dao
- kr.co.gotthem.member.bean
- kr.co.gotthem.member.service
- kr.co.gotthem.member.mybatis
  - mybatis-config.xml
  - *-mapper.xml
- kr.co.gotthem.member.controller
- kr.co.kgotthem.admin.~

Views 패키지

- member
- store
- product
- order
- notice
- event
- qna

3. java, jsp 파일명

- 카멜표기법 준수
- .java 예 = MemberUpdateService.java, MemberController.java
- .jsp 예 = memberInfo.jsp, noticeDetail.jsp

4. 시퀀스 명명규칙

- member테이블의 mem_no 컬럼에 시퀀스를 넣는다면 seq_memno
- notice테이블의 not_no 컬럼에 시퀀스를 넣는다면 seq_notno

5. css, js 등 resource파일 경로

- style01.zip 파일을 통해 나온 js, css등의 파일을 분배하여 넣어두기 (아래 참고)
- WebContent/WEB-INF/css/style01/css 파일
- WebContent/WEB-INF/js/style01/js 파일

---

라이브러리

스프링 버전 4.2.1

Mybatis는 bbs프로젝트 pom.xml 참고 (마이바티스는 스프링 3.0이상이여야 가능)

 mybatis 버전 3.4.1

 mybatis-spring 1.3.0

 spring-jdbc 

MariaDB

 maria-java-client 

파일업로드

 commons-fileupload 1.3.1 > io도 추가로 받아준다

log4j

 datasource 빈 객체 생성시 url 부분과 driverClassName 부분 참고하여 설정 

 src의 log4j 설정 참고하기 

Spring - Security

 Spring버전을 따른다.

JSON

---

테이블

Member 테이블

  회원번호   	아이디   	비밀번호  	이름      	이메일      	폰번호      	주소1         	주소2         	우편번호    	가입일        	포인트                
  mem_no 	mem_id	mem_pw	mem_name	mem_email	mem_phone	mem_address1	mem_address2	mem_post	mem_regdate	mem_point          
  pk(seq)	uk    	nn    	nn      	nn       	nn       	nn          	nn          	nn      	nn         	null 가능 /default(0)
  num    	v2    	v2    	v2      	v2       	v2       	v2          	v2          	v2      	date       	num                

Grade 테이블

  아이디   	등급                     
  gra_id	gra_grade              
  fk    	nn / Default(role_user)
  v2    	v2                     

Store 테이블

  매장  번호 	아이디    	비밀  번호	점주       	매장이름    	매장주소       	사업자번호       	이미지    	전화번호     	이메일      	가입일        	지점소개글      	신청승인여부    
  sto_no 	sto_id 	sto_pw	sto_owner	sto_name	sto_address	sto_registno	sto_img	sto_phone	sto_email	sto_regdate	sto_comment	sto_status
  pk(seq)	uk / nn	nn    	nn       	nn      	nn         	nn          	null 가능	nn       	nn       	nn         	nn         	nn        
  num    	v2     	v2    	v2       	v2      	v2         	v2          	v2     	v2       	v2       	date       	v2         	v2        

 Store 테이블 = 점주 or 사장의 지점 테이블

 sto_status 컬럼 = '신청', '승인', '미승인' 값을 가짐

Product 테이블

  상품코드    	상품명     	매장번호     	분류          	재고(수량)   	가격       	유통기한      	이미지    
  pro_code	pro_name	pro_stono	pro_category	pro_stock	pro_price	pro_exdate	pro_img
  pk(seq) 	nn      	fk       	nn          	nn       	nn       	nn        	null 가능
  num     	v2      	num      	v2          	v2       	num      	date      	v2     

- pro_code : 시퀀스

Order 테이블

  결제  번호 	상품코드       	상품명        	회원번호     	매장번호     	재고(수량)   	가격       	상품수령시간      	수령상태    
  ord_no 	ord_procode	ord_proname	ord_memno	ord_stono	ord_stock	ord_price	ord_findtime	ord_find
  pk(seq)	fk         	fk         	fk       	fk       	nn       	nn       	nn          	nn      
  num    	num        	v2         	num      	num      	num      	num      	date        	v2      

 주문 테이블 = 결제 테이블

 ord_status = '미수령', '수령'

Noticebo 테이블

  글번호   	글제목      	작성일     	조회수    	작성자              	이미지    	내용         
  not_no	not_title	not_date	not_hit	not_writer       	not_img	not_content
  pk    	nn       	nn      	nn     	nn / Default(관리자)	null 가능	null 가능    
  num   	v2       	date    	num    	v2               	v2     	v2         

Noticebo_owner 테이블

  글번호      	글제목         	작성일        	조회수       	작성자              	이미지       	내용            
  not_ownno	not_owntitle	not_owndate	not_ownhit	not_ownwriter    	not_ownimg	not_owncontent
  pk       	nn          	nn         	nn        	nn / Default(관리자)	null 가능   	null 가능       
  num      	v2          	date       	num       	v2               	v2        	v2            

Eventbo 테이블

  글번호   	글제목      	작성일     	조회수    	작성자              	이미지    	내용         
  eve_no	eve_title	eve_date	eve_hit	eve_writer       	eve_img	eve_content
  pk    	nn       	nn      	nn     	nn / Default(관리자)	null 가능	null 가능    
  num   	v2       	date    	num    	v2               	v2     	v2         

Qnabo 테이블

- 답글 관련 컬럼도 포함되어 있다.

  글번호   	글제목      	작성일     	조회수    	작성자       	이미지    	내용         	부모글번호          	답글 댑스          	답글 순서          
  qna_no	qna_title	qna_date	qna_hit	qna_writer	qna_img	qna_content	qna_parent     	qna_depth      	qna_sort       
  pk    	nn       	nn      	nn     	nn        	null 가능	null 가능    	nn / Default(0)	nn / Default(0)	nn / Default(0)
  num   	v2       	date    	num    	v2        	v2     	v2         	num            	num            	num            

Qnabo_comment 테이블

  부모글번호    	작성자 아이디  	작성일        	내용        
  qna_comno	qna_comid	qna_comdate	qna_comhit
  pk       	uk       	nn         	nn        
  num      	v2       	date       	num       

Qnabo_owner 테이블

- 답글 관련 컬럼도 포함되어 있다.

  글번호   	글제목      	작성일     	조회수    	작성자       	이미지    	내용         	부모글번호          	답글 댑스          	답글 순서          
  qna_no	qna_title	qna_date	qna_hit	qna_writer	qna_img	qna_content	qna_parent     	qna_depth      	qna_sort       
  pk    	nn       	nn      	nn     	nn        	null 가능	null 가능    	nn / Default(0)	nn / Default(0)	nn / Default(0)
  num   	v2       	date    	num    	v2        	v2     	v2         	num            	num            	num            

Qnabo_owncomment 테이블

  부모글번호       	작성자 아이디     	작성일           	내용           
  qna_owncomno	qna_owncomid	qna_owncomdate	qna_owncomhit
  pk          	uk          	nn            	nn           
  num         	v2          	date          	num          

Basket 테이블

  장바구니번호 	회원번호     	상품코드       	상품명        	매장번호     	재고(수량)      	가격          	분류             	유통기한         
  bas_no 	bas_memno	bas_procode	bas_proname	bas_stono	bas_prostock	bas_proprice	bas_procategory	bas_proexdate
  pk(seq)	fk       	fk         	fk         	fk       	nn          	nn          	nn             	nn           
  num    	num      	num        	v2         	num      	v2          	num         	v2             	date         



***오류페이지 만들기




