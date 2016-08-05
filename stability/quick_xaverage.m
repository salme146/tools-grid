
xf = 19;
xl = 50;
x = xf:xl;
y1 = 65;


dx = (h(xf,y1)-h(xl,y1))/(xf-xl);

for i = 1:length(x)-1;
h(x(i+1),y1)=h(x(i),y1)+dx;
end