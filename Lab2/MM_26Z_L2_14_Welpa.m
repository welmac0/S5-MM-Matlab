function y = f1(x)
    y = zeros(size(x));

    for i = 1:length(x)
        if x(i) <= 0
            y(i) = 0;
        else 
            y(i) = x(i);
        end
    end
end

function y = f2(x)
    y = zeros(size(x));

    for i = 1:length(x)
        if x(i) <= 0
            y(i) = x(i);
        else 
            y(i) = 0;
        end
    end
end

close all;
clear;
clc;

% Zadanie 1
figure;

x_s = @(t) sin(t);
x_c = @(t) cos(2.*t);

T = 0:0.01*pi:2*pi; % wektor

% a)
A_s = 1;
A_c = 2;

% k = 1
L_1 = f1(A_s * x_s(T) + A_c * x_c(T));
plot(T, L_1)
hold on

R_1 = A_s * f1(x_s(T)) + A_c * f1(x_c(T));
plot(T, R_1)

% k = 2
L_2 = f2(A_s * x_s(T) + A_c * x_c(T));
plot(T, L_2)

R_2 = A_s * f2(x_s(T)) + A_c * f2(x_c(T));
plot(T, R_2)

grid on;
title('Porownanie systemow f_1, f_2 dla par A_s = 1 i A_c = 2')
legend('f_1 (Lewa Strona, k=1)', 'f_1 (Prawa Strona, k=1)', 'f_2 (Lewa Strona, k=2)', 'f_2 (Prawa Strona, k=2)');
xlabel('T');
ylabel('Wartości');
hold off;


% b)
figure;
hold on
A_s = 0.1;
A_c = 0.2;

% k = 1
L_1 = f1(A_s * x_s(T) + A_c * x_c(T));
plot(T, L_1)
hold on

R_1 = A_s * f1(x_s(T)) + A_c * f1(x_c(T));
plot(T, R_1)

% k = 2
L_2 = f2(A_s * x_s(T) + A_c * x_c(T));
plot(T, L_2)

R_2 = A_s * f2(x_s(T)) + A_c * f2(x_c(T));
plot(T, R_2)

grid on;
title('Porownanie systemow f_1, f_2 dla par A_s = 0.1 i A_c = 0.2')
legend('f_1 (Lewa Strona, k=1)', 'f_1 (Prawa Strona, k=1)', 'f_2 (Lewa Strona, k=2)', 'f_2 (Prawa Strona, k=2)');
xlabel('T');
ylabel('Wartości');
hold off;

% Zad 2
% pol. szeregowe S_1 i S_2
S_szer = @(t) f2(f1(t)); % S_1'
S_rown = @(t) f1(t) + f2(t); % S_2'

% a) szeregowy
figure;
hold on;
title('Porownanie systemow szeregowych dla par A_s = 1 i A_c = 2')
A_s = 1;
A_c = 2;

Szer_a_L = S_szer(A_s * x_s(T) + A_c * x_c(T));
plot(T, Szer_a_L, '--', 'LineWidth', 1.5)
hold on

Szer_a_R = A_s * S_szer(x_s(T)) + A_c * S_szer(x_c(T));
plot(T, Szer_a_R, '--')

grid on;
legend('Szer L (Lewa Strona, k=1)', 'Szer R (Prawa Strona, k=1)');
xlabel('T');
ylabel('Wartości');

% b) 
figure;
hold on;
title('Porownanie systemow szeregowych dla par A_s = 0.1 i A_c = 0.2')
A_s = 0.1;
A_c = 0.2;

Szer_b_L = S_szer(A_s * x_s(T) + A_c * x_c(T));
plot(T, Szer_b_L, '--', 'LineWidth', 1.5)
hold on

Szer_b_R = A_s * S_szer(x_s(T)) + A_c * S_szer(x_c(T));
plot(T, Szer_b_R, '--')

grid on;
legend('Szer L (Lewa Strona)', 'Szer R (Prawa Strona)');
xlabel('T');
ylabel('Wartości');

% Rownolegly
% a) szeregowy
figure;
hold on;
title('Porownanie systemow rownoleglych dla par A_s = 1 i A_c = 2')
A_s = 1;
A_c = 2;

Rown_a_L = S_rown(A_s * x_s(T) + A_c * x_c(T));
plot(T, Rown_a_L, '--', 'LineWidth', 1.5)
hold on

Rown_a_R = A_s * S_rown(x_s(T)) + A_c * S_rown(x_c(T));
plot(T, Rown_a_R, '--')

grid on;
legend('Rown L (Lewa Strona)', 'Rown R (Prawa Strona)');
xlabel('T');
ylabel('Wartości');

% b) 
figure;
hold on;
title('Porownanie systemow rownoleglych dla par A_s = 0.1 i A_c = 0.2')
A_s = 0.1;
A_c = 0.2;

Rown_b_L = S_rown(A_s * x_s(T) + A_c * x_c(T));
plot(T, Rown_b_L, '--', 'LineWidth', 1.5)
hold on

Rown_b_R = A_s * S_rown(x_s(T)) + A_c * S_rown(x_c(T));
plot(T, Rown_b_R, '--')

grid on;
legend('Rown L (Lewa Strona)', 'Rown R (Prawa Strona)');
xlabel('T');
ylabel('Wartości');




