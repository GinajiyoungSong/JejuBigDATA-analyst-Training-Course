#저장프로시져 연습
# 테이블 오른쪽마우스버튼 새로생성 - 저장루틴을 만들고
# 저장된 프로시져를 불러오는 것.
CALL student_select();

# 클라이언트에서 불러오는 데이터 저장 프로시저

CALL student_insert('제주도', 100, 100, 100, 'IC00000001', @res);
select @res;

# 문제
# 이름을 변경하는 프로시져를 작성하시요
CALL student_updatename('제주도', '제주민', @res);
SELECT @res;


CALL student_sum();


CALL student_updateone();
SELECT * FROM student;