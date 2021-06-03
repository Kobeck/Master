clear all; close all;
size = 10;  % kantenlaenge
radius = 0.5; % half diameter of lj balls

% Box size:
% for 252 cubes a 6x6x7: x & y = 13.3, z = 15.14
shiftx= 6.65;
shifty= 6.65;
shiftz= 7.57;
% for 490 cubes a 7x7x10: x & y = 14.2857, z = 13
% shiftx= 7.14285;
% shifty= 7.14285;
% shiftz= 6.5;

step = radius*2; %balls touch 

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
plot3(coords(:,5),coords(:,6),coords(:,7),'.', 'MarkerSize', 5)
axis([0 13.3 0 13.3 0 15.14 ]);
Mat=[coords(:,3), coords(:,5:7)];
writematrix(Mat, 'coordsxyz.txt', "Delimiter", "\t");
writematrix(coords, 'truncated.txt', "Delimiter", "\t");
