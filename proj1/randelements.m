clear all;
r1r2;

w = [0:100:1000000];
%v0 = (3,length(w));
%F = (3,length(w));

c1a = (.8 + .4*rand)*c1;
c2a = (.8 + .4*rand)*c2;
r1a = (.8 + .4*rand)*r1;
r2a = (.8 + .4*rand)*r2;

	for k=1:length(w)
		omega = w(k);
		H(k) = (1/(1 + j*omega*(r1a*c1a+r2a*c2a+r1a*c2a) + ((j*omega)^2*(r1a*r2a*c1a*c2a))));
		v0(k) = abs(H(k));
	end

	%v0 = mag(3,2:length(w)+1);

	Fa=20*log10(v0);

c1b = (.8 + .4*rand)*c1;
c2b = (.8 + .4*rand)*c2;
r1b = (.8 + .4*rand)*r1;
r2b = (.8 + .4*rand)*r2;
for k=1:length(w)
		omega = w(k);
		H(k) = (1/(1 + j*omega*(r1b*c1b+r2b*c2b+r1b*c2b) + ((j*omega)^2*(r1b*r2b*c1b*c2b))));
		v0(k) = abs(H(k));
	end

	%v0 = mag(3,2:length(w)+1);

	Fb=20*log10(v0);

c1c = (.8 + .4*rand)*c1;
c2c = (.8 + .4*rand)*c2;
r1c = (.8 + .4*rand)*r1;
r2c = (.8 + .4*rand)*r2;
	for k=1:length(w)
		omega = w(k);
		H(k) = (1/(1 + j*omega*(r1c*c1c+r2c*c2c+r1c*c2c) + ((j*omega)^2*(r1c*r2c*c1c*c2c))));
		v0(k) = abs(H(k));
	end

	%v0 = mag(3,2:length(w)+1);

	Fc=20*log10(v0);
c1e = (.8 + .4*rand)*c1;
c2e = (.8 + .4*rand)*c2;
r1e = (.8 + .4*rand)*r1;
r2e = (.8 + .4*rand)*r2;
	for k=1:length(w)
		omega = w(k);
		H(k) = (1/(1 + j*omega*(r1e*c1e+r2e*c2e+r1e*c2e) + ((j*omega)^2*(r1e*r2e*c1e*c2e))));
		v0(k) = abs(H(k));
	end

	%v0 = mag(3,2:length(w)+1);

	Fe=20*log10(v0);

c1f = (.8 + .4*rand)*c1;
c2f = (.8 + .4*rand)*c2;
r1f = (.8 + .4*rand)*r1;
r2f = (.8 + .4*rand)*r2;
	for k=1:length(w)
		omega = w(k);
		H(k) = (1/(1 + j*omega*(r1f*c1f+r2f*c2f+r1f*c2f) + ((j*omega)^2*(r1f*r2f*c1f*c2f))));
		v0(k) = abs(H(k));
	end

	%v0 = mag(3,2:length(w)+1);

	Ff=20*log10(v0);

semilogx(w,Fa,w,Fb,w,Fc,w,Fe,w,Ff);  grid;
xlabel('frequency (rads/sec)');
ylabel('Amplitude (dB');
