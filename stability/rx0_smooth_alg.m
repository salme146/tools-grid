% rx0 smoothing algorithm

% h = ncread(fname,'h');
% h = d;

[ii, jj] = size(h);
rx0_new = 0.2;

for i = 1:ii-1;
    for j = 1:jj;
        
        if rx0_u(i,j)>0.4 && h(i-1,j)>0
           h_new(i-1,j)=(h(i,j)+h(i-1,j))/2;
           
%         elseif rx0_u(i,j)>0.4 && h(i-1,j)==4 && h(i+1,j)>4
%            h_new(i,j)=(h(i,j)+h(i-1,j))/2;
%            
        elseif rx0_u(i,j)<0.4
            h_new(i,j)=h(i,j);
        end
    end
end

for i = 2:ii;
for j = 2:(jj-1);
         if rx0_v(i,j)>0.4 && h(i,j-1)>4
         h_new(i,j-1)=(h(i,j)+h(i,j-1))/2;
         elseif rx0_v(i,j)<0.4
          h_new(i,j)=h(i,j);
        end
end
end

figure
pcolor(h')
shading('interp')
colorbar
