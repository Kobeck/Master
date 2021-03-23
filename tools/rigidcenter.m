clear all; close all;
% build the data file for rigid colloids simulation 
size = 10;
step = 1;
coords = zeros(485,5);
center = 2.5;
replicatex =1;
replicatey =1;
replicatez =1;
counter=0;


for x=-size/2:step:size/2 
    for y=-size/2:step:size/2
        for z=-size/2:step:size/2

            dist = sqrt((center -abs(x)).^2+(center -abs(z)).^2+(center -abs(z)).^2);
            if ((dist <-1 ) || sqrt(sum([x.^2 y.^2 z.^2]))< 5)
                counter=counter+1;
                coords(counter,1) = counter;
                coords(counter,2) = 1;
                coords(counter,3:5) = [x y z];
            end
        end
    end
end
coords(:,3:5)=coords(:,3:5)+20;




for i=1:replicatex
    coords_new= [coords ; [coords(:,1)+counter*i, coords(:,2), coords(:,3)+20*i, coords(:,4), coords(:,5)]];
    coords=coords_new;
end
for j=1:replicatey
    coords_new= [coords ; [coords(:,1)+counter*i*j, coords(:,2), coords(:,3), coords(:,4)+20*j, coords(:,5)]];
            coords=coords_new;
end
for k=1:replicatez
            coords_new= [coords ; [coords(:,1)+counter*i*j*k, coords(:,2), coords(:,3), coords(:,4), coords(:,5)+20*k]];
            coords=coords_new;
end
        
plot3(coords_new(:,3),coords_new(:,4),coords_new(:,5),'o')
writematrix(coords, 'rigidcoords.txt', "Delimiter", "\t");