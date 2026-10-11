% 1a) dy/dt = -3t dla y(0)=1 i t w [0,1]

syms t y(t) % zmienna symboliczna
eqn = diff(y,t) == -3*t; % pochodna z y po t = -3t
cnd = y(0) == 1;

y_ds = dsolve(eqn, cnd);

figure(1)
fplot(y_ds, [0, 1])
grid on

%b
syms t y(t)
eqn = diff(y,t) == (y(t)-3)^2; % pochodna z y po t = -3t
cnd = y(0) == 0.1;

y_ds = dsolve(eqn, cnd);

figure(2)
fplot(y_ds, [0, 4])
grid on

%c
syms t y(t) x(t)
eqn = [
    diff(x,t) == y+t; 
    diff(y,t) == -x-2
] ;
cnd = [y(0) == 4; x(0) == 10];

xy_ds = dsolve(eqn, cnd);
x_ds = xy_ds.x;
y_ds = xy_ds.y;

figure(3)
fplot([x_ds, y_ds], [0, 3])
grid on

% zadanie 2
% a) dy/dt = -3t dla y(0)=1 i t w [0,1]

syms t y(t)
eqn = diff(y,t) == -3*t; 
cnd = y(0) == 1;

y_ds = dsolve(eqn, cnd);

% w odefuna zawsze musi byc czas nawet jak z niego nie korzystamy
odefuna = @(t, y) -3*t;

[t_45, y_45] = ode45(odefuna, [0,1], 1)

figure(1)
fplot(y_ds, [0, 1])
grid on
hold on
plot(t_45, y_45)
legend('dsolve', 'ode45')
hold off

%b
syms t y(t)
eqn = diff(y,t) == (y-3)^2; % pochodna z y po t = -3t
cnd = y(0) == 0.1;

y_ds = dsolve(eqn, cnd);

odefunb = @(t, y) (y-3)^2;

[t_45, y_45] = ode45(odefunb, [0,4], 0.1) % trzeci arg to war. pocz

figure(2)
fplot(y_ds, [0, 4])
grid on
hold on
plot(t_45, y_45)
legend('dsolve', 'ode45')
hold off

%c
syms t y(t) x(t)
eqn = [
    diff(x,t) == y+t; 
    diff(y,t) == -x-2
    ] ;
cnd = [y(0) == 4; x(0) == 10];

xy_ds = dsolve(eqn, cnd);
x_ds = xy_ds.x;
y_ds = xy_ds.y;

% xy(2) <- wykorzystujemy drugi element (czyli x) wektora xy
odefunc = @(t, xy) [xy(2) + t; -xy(1)-2];
[t_45, xy_45] = ode45(odefunc, [0,3], [10, 4]) % to zwraca dwie zmienne - t_45 to wektor
% xy_45 to macierz dwukolumnowa
x_45 = xy_45(:, 1);
y_45 = xy_45(:, 2);

figure(3)
fplot([x_ds, y_ds], [0, 3])
grid on
hold on
plot(t_45, x_45)
plot(t_45, y_45)
hold off
legend('x_{ds}', 'y_{ds}', 'x_{ode45}', 'y_{ode45}')


