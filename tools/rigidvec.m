clear all; close all;
size = 10;  % kantenlaenge
radius = 0.5; % half diameter of lj balls

% Box size: 100 = 100x100x130   = 13 000 000
%           80  = 80x80x106     =    678 400
%           60  = 60x60x120     =    432 000
% for 252 cubes a 6x6x7 (80):   x & y = 13.3, z = 15.14  phi=0.371
% for 490 cubes a 7x7x10 (100): x & y = 14.2857, z = 13 phi=0.377
% for 200 cubes a 5x5x8 (100):  x & y = 20, z = 16.25,      phi=0.146
% for 128 cubes a 5x5x5 (80):   x & y = 16, z=21.2
% for 96 cubes a 4x4x6 (80):    x & y = 20, z = 17.6666    phi=0.13
% for 63 cubes a 3x3x7 (60):    x & y = 20; z = 17.14      phi=0.145 
% for 450 cubes a 7x7x10 (120): x & y = 17.14; z = 16
boxx= 17.14;
boxy= 17.14;
boxz= 16;
shiftx= boxx./2;
shifty= boxy./2;
shiftz= boxz./2;

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

%sqrt(x.^2+y.^2+z.^2);
plot3(coords(:,5),coords(:,6),coords(:,7),'.', 'MarkerSize', 10)
axis([0 boxx 0 boxy 0 boxz]);

shell=[];
for i=1:length(coords)
    if (coords(i,3)==2)
        shell=[shell;coords(i,5:7)];
    end
end
figure(2)
plot3(shell(:,1),shell(:,2),shell(:,3),'.', 'MarkerSize', 10)
title('shell')


%% Ausgabe Hydro++
data=coords(:,5:7);
out = [data'; radius * ones(1,length(data))];
fileID = fopen('../Wuerfel/cube-10nm.txt','w');
fprintf(fileID,'1.E-07,\n');
fprintf(fileID,'%d,\n',length(data));
fprintf(fileID,'%11.7f  %11.7f  %11.7f  %9.5f\n', out);
fclose(fileID);


%%
Mat=[coords(:,3), coords(:,5:7)];
writematrix(Mat, 'coordsxyz.txt', "Delimiter", "\t");
writematrix(coords, 'truncated.txt', "Delimiter", "\t");
