function fiv(a,b,c,d,f,g)
 
min_re = -4;
max_re = 4;
min_im = -4;
max_im = 4;
n_re = 100;
n_im = 100;
tol = 0.01;
coeff = [a b c d f g] ; polyroots = roots(coeff);
r1=polyroots(1);
r2=polyroots(2);
r3=polyroots(3);
r4=polyroots(4);
r5=polyroots(5);
max_steps=30;

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
z = z - (a*z.^5 + b*z.^4 + c*z.^3 +d*z.^2+f*z+g)./(5*a*z.^4 + 4*b*z.^3 + 3*c*z.^2 + 2*d*z+f);
if norm(a*z.^5 + b*z.^4 + c*z.^3 +d*z.^2+f*z+g) <= tol
p=1;
end
end
if norm(z-r1)<=tol
Z(j,k)=0;
elseif norm(z-r2)<=tol
Z(j,k)=67;
elseif norm(z-r3)<=tol
Z(j,k)=123;
elseif norm(z-r4)<=tol
Z(j,k)=188;
elseif norm(z-r5)<=tol
Z(j,k)=255;
end
end
end
axis([-4 4 -4 4]);
pcolor(X,Y,Z)
shading flat;
endfunction


