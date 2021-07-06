function neighbors = effective_neighbors(x,y,z, cube, cutoff)
% this function returns a list of neighbors contributing to the interaction
% strength of one particle.
% input:    xyz coordinates of probe particle
%           xyz coordinate matrix of nanoparticle

neighbors=[];

for i=1:length(cube(:,1))
    coords = cube(i,:);
    dist = distance(x,y,z, coords(2),coords(3),coords(4));
    
    if dist < cutoff && coords(1)==2 
        neighbors=[neighbors; coords(2),coords(3),coords(4), dist];
        disp('1');
    end
    
    
end



end
