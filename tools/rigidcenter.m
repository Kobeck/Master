clear all; close all;
% build the data file for rigid colloids simulation 
size = 10;
step = 0.10;
coords = zeros(895,7);
center = 2.5;
replicatex =0;
replicatey =0;
replicatez =0;
counter=0;


for x=-size/2:step:size/2 
    for y=-size/2:step:size/2
        for z=-size/2:step:size/2
            dist = sqrt(x.^2 + y.^2 + z.^2);
            dist_edge = sqrt((center-abs(x)).^2 + (center-abs(z)).^2 + (center-abs(z)).^2);
            if ((abs(x)<=5 && abs(y)<=5 && abs(z)<=5))
                if (abs(x)==5 || abs(y)==5 || abs(z)==5) 
                    counter=counter+1;
                    coords(counter,1) = counter; % id
                    coords(counter,2) = 1; % molecule                
                    coords(counter,3) = 2; % atom type 
                    coords(counter,4) = 0; % q
                    coords(counter,5:7) = [x y z];
                else
                    counter=counter+1;
                    coords(counter,1) = counter;
                    coords(counter,2) = 1;
                    coords(counter,3) = 1;
                    coords(counter,4) = 0;
                    coords(counter,5:7) = [x y z];
                end
            end
        end
    end
end
coords(:,5:7)=coords(:,5:7)+20;




for i=1:replicatex
    
    coords_new= [coords ; [coords(1:counter,1)+counter, coords(:,2), coords(:,3)+20*i, coords(:,4), coords(:,5)]];
    counter = counter*(i+1);
    coords=coords_new;
end
for j=1:replicatey
    
    coords_new= [coords ; [coords(1:counter,1)+counter, coords(:,2), coords(:,3), coords(:,4)+20*j, coords(:,5)]];
    coords=coords_new;
    counter=counter*(j+1);
end
for k=1:replicatez
    coords_new= [coords ; [coords(1:counter,1)+counter, coords(:,2), coords(:,3), coords(:,4), coords(:,5)+20*k]];
    coords=coords_new;
    counter=counter*(k+1);
end
        
A=plot3(coords(:,5),coords(:,6),coords(:,7),'.', 'MarkerSize',10);
axis([0 50 0 50 0 50 ]);
writematrix(coords, 'rigidcoords.txt', "Delimiter", "\t");