
yf = 65;
yl = 78;
y = yl:yf;
x1 = 129;


dy = (h(x1,yf)-h(x1,yl))/(yf-yl);
for ii=50:150;
for i = 1:length(y)-1;
h(ii,y(i+1))=h(ii,y(i))+dy;
end
end