--프로시져와 함수의 차이점

--1. 함수는 어플리케이션에서 호출해서 사용 할 수 없다
--2. 구조가 다르다
     --프로시져 OUTPUT PARAMETER
     --함수 RETURN
     
--3. 프로시져 : 업무의 최소 단위 - TRANSACTION
--   함수 : 기능별로 필요할때 사용 DATABASE 내부에서만 호출 가능 .. 반복되는 특정한 기능을 구현, 전역변수로 취급 가능

--트리거 : 테이블에 이벤트(UPDATE, DELETE, INSERT) 자동으로 실행 되는 프로시져