format compact
% 1.1) 다음을 계산하여 보라:
% (1)
35 * 5.4 - 78 / 15 + 9
% (2)
exp(-1.2) * log(5.7) + sin(2.3)*cos(-4.5)
% (3)
sqrt(5) * log10(1.6) + 3^(-0.8) * (12/5)

% 1.2)
% (1) 반지름이 6.2cm인 원의 면적을 소수점 이하 15자리까지 구하고 이를 A에 저장하여라
format long; r = 6.2; A = pi * r^2
% (2) -7.42보다 크며 가장 근접한 정수 및 이보다 작으면서 이 수에 가장 근접한 정수를 구하여라
round(-7.42)
floor(-7.42) % 내림
% + ceil(-7.42) 올림
% (3) 가로 4cm, 세로 2.6cm, 높이 hcm인 육면체가 있다. h가 10, 13, 18, 22.5부피를 구하라.
format;
h = [10, 13, 18, 22.5];
V = 4 * 2.6 * h

% 1.3) 이상기체방정식은 PV = nRT로 나타낼 수 있다. P는 압력(kPa), V는 부피(m^3), n은 몰수, T는
% 온도(T), R은 기체상수(8.314 kPs * m^3 / (kmol * K)). 여기서 n = 40kmol, T = 325K.
% (1) P = 80일때 V = ?
P = 80; n = 40; R = 8.314; T = 325;
V = n * R * T / P
% (2) 압력이 매우 작아져서 P = eps라면 부피는?
P = eps; % eps = 2.2204e-16 = 2^-52(in 2진법)
V = n * R * T / P 
% (3) 부피가 매우 작아져서 V = eps라면 압력는? 부피가 매우 작아져서 V = 0라면 압력는?
V = eps; % eps = 2.2204e-16
P = n * R * T / V
V = 0; 
P = n * R * T / V % P = Inf(infinite)

% 1.4)
% 1)
v = [2 3 1]; u = [-4 0 5]'; syms x; 
f(x) = 3*x^3 -2*x^2 +1; %함수선언 : f = inline('3*x.^3 -2*x.^2 +1', 'x'), f = @(x) 3*x.^3 -2*x.^2 +1
f(v)
f(u)
% 2) 원소가 모두 5인 3 x 4 행렬 A를 생성하라. 생성된 행렬의 2,3행과 2,3열의 원소로 행렬 B를 생성하라
A = ones(3, 4) * 5 % square : A = ones(x), ones : 원소가 모두 1인 행렬(+ zeros : 원소가 모두 0인 행렬)
% + eigenvector(고유벡터) : eye(x,y) : x행 y열 + eye(x) : square
B = A(2:3, 2:3)
% 3) 행렬 A의 행렬값 |A|(det), A', A의 역행렬을 구하여라(|A|는 연산자 아님.)
A = [4 5 2; -3 1 0; 0 6 5]
det(A)
A'
inv(A)
% 4)Coefficient * Various = Sol 일때 Various = ?
syms x1, syms x2, syms x3; % for Various
Coefficient = [3 -2 1; -1 4 2; 2 1 -1]; Various = [x1 x2 x3]'; Sol = [7 -1 -1]';
% A = [1 2 3]' => A = [1; 2; 3]
Various = Coefficient\Sol % Various = inv(Coefficient)*Sol

% 1.5)Fibonacci : x1 = 1, x2 = 2일때 x20까지 그래프로 나타내어라
n = 2:21;
fibonacci(n)
plot(n,fibonacci(n))
% fibo함수를 구현한 것 바탕으로 그래프그리기
n = input('수열의 마지막 항');
syms i;
for i = 1: n;

      F(i)=fibo(i);
      plot(i, F(i))
     
end

% 1.6) 이산시간 k에 따른 개체 x의 증가모델은 x(k+1) = a*x(k)*(1-x(k))로 나타낼 수 있다.
%      1<=k<=30의 범위에서 개체 Xk의 변화를 그래프로 나타내어라.
%      단, X1 = 0.1, a = 2.69
[k,x] = pmod(2.69, 0.1, 30);
plot(k,x), xlabel('시간(k) '), ylabel('개체(x_k)'), title('개체증가모델')


