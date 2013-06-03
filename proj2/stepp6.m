
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


if 0
	 % ELEN 100 - Project 2

% Tutorial 
%close all;
clear all;
 
% Symbolic variables 
syms R1 R2 R3 
syms C
syms s t
 
% Real values
r1 = 2;
r2 = 2;
r3 = 1;
c  = 1/2;
 
% Matrix in Laplace form
M = [1/R1 + 1/R2 + 1/R3, -1/R3; -1/R3, 1/R3+s*C];
S = [1/(s*R1) ; 0];
 
% Solving the matrix
X = M\S;
Xn = subs (X, {R1 R2 R3 C} , {r1 r2 r3 c} );
 
% Finding Inverse Laplace
x = ilaplace(Xn);
 
v1 = x(1);
v2 = x(2);
 
% Calculate transient response
tt = [0: .1 : 5];
 
for i = 1:length(tt) 
    v1n (i) = subs ( v2 , {t} , {tt(i)});
    v2n (i) = subs ( v1 , {t} , {tt(i)});
end
 
% Plotting
figure(2);
plot(tt,v1n,tt,v2n); grid on; title('Step Response R1 = R2 = 1.2k\omega R3 = 838\omega, R4 = R5 = 1k\omega');
legend('V_C = Voutput','V_R_1');xlabel('Time [s] '); ylabel('Vo [V]');
grid on; 
end;
