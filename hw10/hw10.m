%% Controls Homework 10 Problem 1

Gs1 = zpk([],[2 -10 -15 -30],[200]);

X1 = evalfr(Gs1, -2)
K1 = -1/X1

Gcl1 = minreal(Gs1*abs(K1) / (1 + Gs1*abs(K1)))

Gs1_2 = zpk([],[0 -8 -20.24 -28.46],[11648]);

X1_2 = evalfr(Gs1_2, -2.3302 + 4.5505i)
K1_2 = -1/X1_2

Gcl1_2 = minreal(Gs1_2*abs(K1_2) / (1 + Gs1_2*abs(K1_2)))
roots([1 4.661 26.13])
figure;
step(Gcl1_2)

%% Controls Homework 10 Problem 2
T = .1;

s2 = [-2 -5 -10 -15];
z2 = exp(s2*T);

Gz2 = zpk([],z2,1);
Gs2 = zpk([],s2,200);
kz2 = evalfr(Gz2, 1);
ks2 = evalfr(Gs2, 0);
k2 = ks2/kz2
Gz2 = zpk([0 0],z2,k2,T)
Gz2tf = tf(Gz2)

figure;
step(Gz2)
hold on
step(Gs2)
hold off

%% Controls Homework 10 Problem 3
roots3 = roots([1 2 10]);
s3 = [roots3' -10];
z3 = exp(s3*T);

Gz3 = zpk([],z3,1);
Gs3 = zpk([],s3,200);
kz3 = evalfr(Gz3, 1);
ks3 = evalfr(Gs3, 0);
k3 = ks3/kz3
Gz3 = zpk([0 0],z3,k3,T)
Gz3tf = tf(Gz3)

figure;
step(Gz3)
hold on
step(Gs3)
hold off

%% Controls Homework 10 Problem 4

s4_poles = [0 -20];
z4_poles = exp(s4_poles*T);
s4_zeros = [-2 -5];
z4_zeros = exp(s4_zeros*T);

Gz4 = zpk(z4_zeros,z4_poles,1);
Gs4 = zpk(s4_zeros,s4_poles,6);
kz4 = evalfr(Gz4, exp(0.01*T));
ks4 = evalfr(Gs4, 0.01);
k4 = ks4/kz4
Gz4 = zpk(z4_zeros,z4_poles,k4,T)
Gz4tf = tf(Gz4)

figure;
step(Gz4)
hold on
step(Gs4)
hold off