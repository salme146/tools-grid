function []=calc_rx1(h)

% h = ncread(fname,'h');
[ii, jj] = size(h);
N = 8;

w = (0:-1/N:-1)';
zw = ones(ii,jj,N+1);

for i = 1:ii;
    for j = 1:jj
        for k = 1:9;
            zw(i,j,k)=h(i,j)*w(k);
        end
    end
end


for i = 2:(ii-1);
    for j = 1:jj;
        for k = 2:9;
            if h(i,j)>4 && h(i+1,j)>4
                rx1_u(i,j) = abs((zw(i,j,k)-zw(i-1,j,k)+zw(i,j,k-1)-zw(i-1,j,k-1))/(zw(i,j,k)-zw(i-1,j,k)-zw(i,j,k-1)-zw(i-1,j,k-1)));
            else
                rx1_u(i,j)=0;
            end
        end
    end
end

figure
pcolor(rx1_u')
shading('interp')
colorbar
figure(gcf)

for i = 1:ii;
    for j = 2:(jj-1);
        for k = 2:9;
            if h(i,j)>4 && h(i,j+1)>4
                rx1_v(i,j) = abs(zw(i,j,k)-zw(i,j-1,k)+zw(i,j,k-1)-zw(i,j-1,k-1))/((zw(i,j,k)-zw(i,j-1,k))-zw(i,j,k-1)-zw(i,j-1,k-1));
            else
                rx1_v(i,j)=0;
            end
        end
    end
end

figure
pcolor(rx1_v')
shading('interp')
colorbar
figure(gcf)
end