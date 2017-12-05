function NLOS(m)
%NLOS scenario
%input m is the number of sample points

randn('state',21);
c = normrnd(0, 1, 1,m);
randn('state',27);
d = normrnd(0, 1, 1,m);
r=sqrt(c.^2 + d.^2);
randn('state',29);
x = abs(normrnd(0, 1, 1, m));
z = r.*x;
u = mean(z);
v = var(z);
[b, x] = hist(z, 100);
num = numel(z);
c = cumsum(b / num);
plot(x, c);%guessed cdf

b1 = u * sqrt(2 / pi);%parameter b of rayleigh 
b2 = sqrt(2 * v /( 4 - pi));
w = 0:0.1:10;
y1 = raylcdf(w, b1);
y2 = raylcdf(w, b2);
% hold on;
% plot(w, y1);
% hold on;
% plot(w, y2);
% disp(b1);
% disp(b2);
% legend('original CDF', 'Rayleigh CDF with parameter from mean', 'Rayleigh CDF with parameter from variance');
hold on;
theta = v / u;
k = u ^ 2 / v;
y3 = gamcdf(w, k ,theta);
plot(w, y3);
legend('original CDF', 'Gamma CDF with 20000 sample points')

end

