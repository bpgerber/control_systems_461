%% Homework 4 Problem 1
H1a = zpk([6],[-1,-7,-10],10);
H1a = tf(H1a);
temp1b1 = evalfr(H1a, -4j);
temp1b2 = evalfr(H1a, 4j);
temp1b3 = evalfr(H1a, 0);
G1d = zpk([-6], [-1, -7, -10], 10);
t1d = [0:0.01:10];
y1d = 2*step(G1d,t1d);
plot(y1d, t1d);
figure;

%% Homework 4 Problem 2
H2b = tf(50,[1 32 70 300]);
temp2b1 = evalfr(H2b, -4j);
temp2b2 = evalfr(H2b, 4j);
temp2b3 = evalfr(H2b, 0);
mag2b2 = abs(temp2b2);
angle2b2 = angle(temp2b2);

angle2cA = angle(-5/194 + 155/583*j);
mag2cA = abs((-5/194 + 155/583*j));

%% Homework 4 Problem 3

G3 = zpk([],[-2 -7 -10 -15], 100000);
DC3 = evalfr(G3, 0);
G3first = zpk([],-2, DC3*2);

t = [0:0.1:10];
y3first = step(G3first, t);
y3fourth = step(G3, t);
plot(t,y3fourth, 'b', t, y3first, 'r');
figure;

%% Homework 4 Problem 4

G4 = zpk([],[(-1.5000 - 3.5707j) (-1.5000 + 3.5707j) -20 -50],100000);
DC4 = evalfr(G4, 0)
G4temp = zpk([],[-1.5000 - 3.5707j -1.5000 + 3.5707j], DC4);
G4first = zpk([],[-1.5000 - 3.5707j -1.5000 + 3.5707j], DC4*6.66./(evalfr(G4temp,0)));

y4first = step(G4first, t);
y4fourth = step(G4, t);
plot(t,y4fourth, 'b', t, y4first, 'r');

