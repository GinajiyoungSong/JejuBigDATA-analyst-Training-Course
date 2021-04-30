print('hello python basic!')

#3 chapter 2_1
# 파이썬 왼전 기초

# 2-1강 인프런 파이썬 print 사용법
# 다양한 print 출력
# Separator 사용
# End 사용
# python Format 사용

print() # 공백으로 실행하면 아무것도 안나옴 <= 여기선 엔터기능
# 아래 콘솔창 보면 위 1번 : 스크립트 프린트 한다음 엔터 줄바꿈 후 아래 스크립트 출력
print('Python start!')
print("Python start!")
print('''Python strat!''')
print("""Python start!""")

print()

# seperatator 옵션
print('P','Y','T','H','O','N', sep='') #''공백없이 그냥 붙여라
print('P','Y','T','H','O','N', sep=',') # 각각의 문자열 사이를 어떻게 구분
print('P','Y','T','H','O','N', sep=' ') # 공백을 넣어라
print('P','Y','T','H','O','N', sep=';')
print()
print('010','3282','4411', sep='-')
print('jnlovejy','naver.com', sep='@')

print()
# end 옵션
print('Welcome','to', end=' ') #내가 넣은 단어를 연결해주고 싶을때 : 공백 추가
print('IT News', end='_ ')       # end 옵션을 써서 다음 문장과 이어줄때
print('Web site', end='!!')
print()
#
print('Welcome','to', end='\n ') #내가 넣은 단어를 연결해주고 싶을때 : 공백 추가
print('IT News', end=' ~~ ')       # end 옵션을 써서 다음 문장과 이어줄때
print('Web site', end='!!')
print();print()


#file 옵션
import sys #보라색글자는 파이썬에 지정된 예약어

print('Learn Python', file=sys.stdout)
