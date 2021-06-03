clear all; close all;
size = 10;
radius = 5;
shiftx= 6.65;
shifty= 6.65;
shiftz= 7.57;
step = (radius*2)/size;

len = length(-size/2:step:size/2);
coords = zeros(len.^3,7);
coords(:,1) = 1:length(coords); % atom id 
coords(:,2) = 1;                %molecule
coords(:,4) = 0;                % q

[X, Y, Z] = meshgrid(-size/2:step:size/2, -size/2:step:size/2, -size/2:step:size/2);

coords(:,5:7) = [X(:) Y(:) Z(:)];  % sc coordinates
for i=1:len^3
    x= coords(i,5);
    y= coords(i,6);
    z= coords(i,7);
    sqrt(x.^2+y.^2+z.^2)
    if(sqrt(x.^2+y.^2+z.^2)>7)
        coords(i,:) = zeros(1,7);    % truncation
    else
        dist = sqrt(x^2+y^2+z^2);
        if (abs(x)==5 || abs(y) == 5 || abs(z)==5 || dist>6)
            coords(i,3)= 2;     % atom type
        else
            coords(i,3)= 3;     % ''
        end
    end
end
coords( ~any(coords,2), : ) = []; % removes all rows with all zero

coords(:,5) = coords(:,5) +shiftx;
coords(:,6) = coords(:,6) +shifty;
coords(:,7) = coords(:,7) +shiftz;

sqrt(x.^2+y.^2+z.^2)
plot3(coords(:,5),coords(:,6),coords(:,7),'.', 'MarkerSize', radius)
axis([0 14.2857 0 14.2857 0 13 ]);
Mat=[coords(:,3), coords(:,5:7)];
writematrix(Mat, 'coordsxyz.txt', "Delimiter", "\t");
writematrix(coords, 'truncated.txt', "Delimiter", "\t");
