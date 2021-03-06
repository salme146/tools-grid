function [maxu, maxv]=calc_rx0(h)

[ii, jj] = size(h);

for i = 2:(ii);
for j = 1:jj;
    if h(i,j)>0 && h(i-1,j)>4
        rx0_u(i,j) = abs( h(i,j) - h(i-1,j) )/( h(i,j) + h(i-1,j) );
%     a(i,j) = abs(h(i,j)-h(i-1,j))
%     b(i,j) = h(i,j)+h(i-1,j)
%     c(i,j) = a/b;
    else
        rx0_u(i,j)=0;
    end
end
end

maxu = max(max(rx0_u));

figure
pcolor(rx0_u')
shading('interp')
colorbar
figure(gcf)

for i = 1:ii;
for j = 2:(jj-1);
    if h(i,j)>4 && h(i,j-1)>0
        rx0_v(i,j) = abs( h(i,j) - h(i,j-1) )/( h(i,j) + h(i,j-1) );
%     a(i,j) = abs(h(i,j)-h(i-1,j))
%     b(i,j) = h(i,j)+h(i-1,j)
%     c(i,j) = a/b;
    else
        rx0_v(i,j)=0;
    end
end
end

maxv = max(max(rx0_v));

figure
pcolor(rx0_v')
shading('interp')
colorbar
figure(gcf)

end