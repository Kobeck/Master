clear all; close all;
% build the data file for rigid colloids simulation 
size = 10;
step = 1;
coords = zeros(981513,3);
counter = 0;
for x=-size/2:step:size/2 
    for y=-size/2:step:size/2
        for z=-size/2:step:size/2
            if (sqrt(sum([x.^2,y.^2,z.^2]))<6) 
                counter=counter+1;
                coords(counter,:) = [x y z];
            end
        end
    end
end



plot3(coords(:,1),coords(:,2),coords(:,3),'o')
%writematrix(coords, 'coords.txt', "Delimiter", "\t");