function two(a,b,d)
 
min_re = 1;
max_re = 8;
min_im = -3;
max_im = 3;
n_re = 100;
n_im = 100;
tol = 0.01;
coeff = [a b d]; polyroots = roots(coeff);
r1=polyroots(1);
r2=polyroots(2);
max_steps=40;

delta_re = (max_re-min_re)/n_re; 
delta_im = (max_im-min_im)/n_im;
x = min_re:delta_re:max_re; 
y = min_im:delta_im:max_im;
[X,Y]=meshgrid(x,y); 

Z = X + i*Y;

for j = 1:n_im + 1
for k = 1:n_re + 1

z = Z(j,k);

if z == 0
z = tol;
end

flag = 0;
p=0;
while (flag <= max_steps) && (p==0)
z = z - (a*z.^2 + b*z.^1 + d)./(2*a*z.^1 + b);
if norm(a*z.^2 + b*z.^1 +d) <= tol
p=1;
end
end
if norm(z-r1)<=tol
Z(j,k)=100;

elseif norm(z-r2)<=tol
Z(j,k)=230;

end
end
end
axis([1 8 -3 3]);
brighten(0.5);

pcolor(X,Y,Z)

shading flat;


endfunction


