function Rayleigh(m)
%Rayleigh
%input m is the number of sample points

randn('state',21);
c = normrnd(0, 1, 1,m);
randn('state',27);
d = normrnd(0, 1, 1,m);
r=sqrt(c.^2 + d.^2);
u = mean(r);
variance = var(r);
%disp(u);
%disp(variance);
b1 = u * sqrt(2 / pi);
b2 = sqrt(2 * variance /( 4 - pi));
disp(b1);
disp(b2);
x = 0:0.1:10;
y1 = raylcdf(x, b1);
y2 = raylcdf(x, b2);
plot(x, y1);
hold on;
plot(x, y2);
legend('b from mean', 'b from variance');
end

