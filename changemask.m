function[]=changemask(fname)
% change mask

% fname = 'Combined2016_10mv4_grd.nc';

d = ncread(fname,'h');
mask_r = ncread(fname,'mask_rho');
mask_u = ncread(fname,'mask_u');
mask_v = ncread(fname,'mask_v');
mask_p = ncread(fname,'mask_psi');

[ii, jj] = size(d); % 734 834

for i = 1:ii;
    for j = 1:jj;
        if d(i,j)>4; % 4 is my minh - CHECK THIS VALUE IN YOUR GRID!
            mask_r(i,j)=1;
        elseif d(i,j)==4;
            mask_r(i,j)=0;
        end
    end
end
    
for i = 1:ii-1;
    for j = 1:jj;
        if d(i,j)>4;
            mask_u(i,j)=1;
        elseif d(i,j)==4;
            mask_u(i,j)=0;
        end
    end
end

for i = 1:ii;
    for j = 1:jj-1;
        if d(i,j)>4;
            mask_v(i,j)=1;
        elseif d(i,j)==4;
            mask_v(i,j)=0;
        end
    end
end

for i = 1:ii-1;
    for j = 1:jj-1;
        if d(i,j)>4;
            mask_p(i,j)=1;
        elseif d(i,j)==4;
            mask_p(i,j)=0;
        end
    end
end

 ncwrite(fname,'mask_rho',mask_r);
 ncwrite(fname,'mask_u',mask_u);
 ncwrite(fname,'mask_v',mask_v);
 ncwrite(fname,'mask_psi',mask_p);
end
