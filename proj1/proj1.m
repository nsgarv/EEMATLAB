%project 1 mfile for Passive filter design
clear all;
r1r2;


%bode(1/(1 + j*w*(r1*c1+r2*c2+r1*c2) + ((j*w)^2)*(r1*r2*c1*c2)));

w = [0:100:1000000];

%for istep=1:length(w)
%	H = (1/(1 + j*w(istep)*(r1*c1+r2*c2+r1*c2) + ((j*w(istep))^2)*(r1*r2*c1*c2)));
%end

%yplot = 20*log10(H);

%loglog(w,yplot);

%function F = freqresep4(c1,c2,r1,r2,w)

	for k=1:length(w)
		omega = w(k);
		H(k) = (1/(1 + j*omega*(r1*c1+r2*c2+r1*c2) + ((j*omega)^2*(r1*r2*c1*c2))));
		v0(k) = abs(H(k));
	end

	%v0 = mag(3,2:length(w)+1);

	F=20*log10(v0);

semilogx(w,F);  grid;
xlabel('frequency (rads/sec)');
ylabel('Amplitude (dB');

%x < 3000, y=0;
%3000 <=  x < 20000, y = -20*x;
%x >= 20000, y = -40*x;

%y = piecewise_eval(0:length(w));



%Now you do one at a time into the proper place in y.
% z=1:1000000
%	while(z<=3000)
%		y = 0;
%	end
%	while(z > 3000 && z<=20000)
%		y = -20*w(z) + 3000;
%	end 
%	while(z > 20000)
%		y = -40*w(z) + 20000;
%	end
%end

%y(1:10:3000) = 0;
%y(3001:10:20000) = -20.*x(3001:10:20000) + 3000;
%y(20001:10:1000000) = -40.*x(20001:10:1000000) + 20000;

%semilogx(w, y);

