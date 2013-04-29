clear all;
r1r2;

w = logspace(0,6,500);
%v0 = (3,length(w));
%F = (3,length(w));
for g=1:10
	c1a = (.8 + .4*rand)*c1;
	c2a = (.8 + .4*rand)*c2;
	r1a = (.8 + .4*rand)*r1;
	r2a = (.8 + .4*rand)*r2;
	for k=1:length(w)
		omega = w(k);
		H(k) = (1/(1 + j*omega*(r1a*c1a+r2a*c2a+r1a*c2a) + ((j*omega)^2*(r1a*r2a*c1a*c2a))));
		v0(k) = abs(H(k));
	end
	F(:,g)=20*log10(v0);
end
semilogx(w,F(:,1),w,F(:,2),w,F(:,3),w,F(:,4),w,F(:,5),w,F(:,6));%,w,F(:,7),w,F(:,8),w,F(:,9),w,F(:,10)); 
grid;