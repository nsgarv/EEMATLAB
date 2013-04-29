%resistor calculation

c1 = 1.0000e-07;
c2 = 1.0000e-08;
a = 3000;
b = 20000;
t1 = (1/a+1/b);
t2 = (1/(a*b));

r2 = real(r2val((c1*c2*c2), (-(t1*c2*c1)), (t2*c1+t2*c2)));
r1 = (t1-r2*c2)/(c1+c2);

