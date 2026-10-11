A = [1, 2, 3;4, 5, 6; 7,8,9]
A(1, 2)
A(1:2,2:3)

A(A==5) = 99 % 5->99
A<5

A=A(2,3)

a1 = 1:9
a2=1:2:10
a3=a2'

b=[a1,a1]
b1=[a1;a1]

% mnozenie tablicowe
%A .* B

%C*x = b % x to wektor niewiadomych
%x=C\b


syms x
solve(x^6==16) % rozwiazanie wzgl x

roots([1, 2, 3, 4]) % = x^3 + 2x^2 + 3x + 4

clear
syms x
f1=abs(x^2-3)
fplot(f1, [-2,3])
grid on
hold on



