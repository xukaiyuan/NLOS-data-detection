function gaussian(m) 
%gaussian random vector
%input m is the number of sample points

randn('state',19);

g = normrnd(0,1,1,m);
[mean, sigma] = normfit(g);
disp(mean);
disp(sigma);
x = -4: 0.1: 4;
y1 = normcdf(x, mean, sigma);%ideal one
y2 = normcdf(x, 0, 1);%estimated one
plot(x, y1);
hold on;
plot(x, y2);
legend('ideal', 'estimated');
end

