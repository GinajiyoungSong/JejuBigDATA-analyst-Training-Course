print('hello python basic!')
a =10
b =a
c= 10
print(a)
print(b)
print(id(a),id(b), id(c))

#같은 주소값이 나옴
# python 스스로가 판단해서  같은 값을 메모리 할 필요 없으니 한번 저장한 데이터를
# 주소로 할당해서 c 에게 같은 주소를 주고 - 메모리는 한번만 쓰게 함

#빅데이터 첫날 수업에서 배운 기본 = print, id 주소값 확인
a =30
print(id(a),id(b),id(c))
# 이경우 a = 30이라는 새로운 데이터로 치환
# 새로운 주소가 지정되고, 기존에 b는 전데이터 a의 주소값을 기억하므로 바뀌지 않게

print('\n \n \n')
#input() 내가 넣고 싶은 단어를 넣는 명령어
# atom 에서 input 은 어떻게 쓰는지 모르겠네 ㅋㅋ


fullName = 'Song Jiyoung'
n = fullName.rfind(" ") #rfind() find()의 차이는 무엇인가!!!!



print(fullName[0]) # 변수명[] : 인덱스를 의미함
print(fullName[1])
print(fullName[2])
print(n) # 내가 찾으라고 지정한 공백을 n 으로 호출 : 4번째 인덱스 자리

print(" name:", fullName[n+1:]) # 이뜻은 변수명[n+1:] n+1 인덱스부터 끝까지 호출
print(" first name :", fullName[:n]) # 끝에 n까지는 즉  n-1 앞자리까지.
# python  에서 위치지정시 0:10 면 ~ 프린트호출은 0부터 9 까지만 가능

print(fullName[-1])
# python 에서 마지막 단어는 뒤에서 첫번째 인덱스를 의미함
print(fullName[-1:12]) # 전체 단어수를 다 적어줘야 뒷자리 하나 뽑아냄
print(fullName[-1:11]) # 11번째 자리가 -1 인덱스라서 아무단어도 호출못함
print(fullName[-2:11]) # 뒤에서 2개의 단어를 호출해야하는데 10번째까지밖에 안

print(fullName[5:-1]) #:-1 뒤에서 첫번째자리 까지를 지정해주면,
#                       범위에서 벗어나므로 뒤에서 2번째인덱스까지 호출


print(len(fullName)) # 인덱스수 전체 몇개인지 #산술연산할때 용이함
t = fullName.split(' ')
print(t)
j = ' '.join(t)
print(j)

print('\n \n \n')

s ='korea'
print(s.capitalize()) #첫글자 대문자표기
print(s.find('r')) #find() : 내가 원하는 ''를 찾아라
print(s.count('re')) #count() : 내가 원하는 ''의 빈도수를 알려줘
print(s.isalpha()) # is___ 논리형으로 물어볼때
print(s.isdigit())
print('0123'.isdigit())
print(s.replace('r','R')) #' '을 치환하고 싶을때
print(s.startswith('K')) # 변수에서 'K'로 시작하는지 묻는 논리
print(s.endswith('a'))
