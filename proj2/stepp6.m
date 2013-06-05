%Nathan Garvey and Jaster Tan
%ELEN 100 2013
%check for problem 6
%transient analysis of a circuit with chosen values
% values give peak overshoot of < 10%

clear all;
syms R1 R2 R3 R4 R5
syms C1 C2
syms s t

r1 = 1200;
r2 = 1200;
r3 = 838;
r4 =1000;
r5 = 1000;
c1 = .1e-6;
c2 = .1e-6;

M = [1/R1+1/R2+1/R3+C1*s, -1/R3, -C1*s; -1/R3, 1/R3+C2*s, 0; 0, 1/R4+1/R5, -1/R4];
S = [1/(s*R1); 0; 0];

X = M\S;
%X outputs v1(2), v2(s), v0(3)
Xn = subs (X, {R1 R2 R3 R4 R5 C1 C2} , {r1 r2 r3 r4 r5 c1 c2} )

x = ilaplace(Xn)

v0 = x(3);
v1 = x(1);
v2 = x(2);
  
% Calculate transient response
tt = [0: 1e-5 : .005];
 
for i = 1:length(tt) 
    v1n (i) = subs ( v2 , {t} , {tt(i)});
    v2n (i) = subs ( v1 , {t} , {tt(i)});
    v0n (i) = subs ( v0 , {t} , {tt(i)});
end;
 
% Plotting
figure(1);
plot(tt,v0n,'g',tt,v1n,'b',tt,v2n,'r'); grid on; title('Step Response R1 = R2 = 1.2k\Omega  R3 = 838\Omega, R4 = R5 = 1k\Omega');
legend('V_o = Voutput');xlabel('Time [s] '); ylabel('Vo [V]');
grid on; 
