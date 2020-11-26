function [neighbors] = ord(filename,r)
read = @xyzread;
[natoms c x y z] = read(filename);
neighbors=zeros(natoms,1);

%calculate number of neighbors for each atom in given radius
dist=0;
for i= 1:natoms
    %display(dist);
    for j= i+1:natoms
        dist=sqrt(( x(i)-x(j) ).^2 + ( y(i)-y(j) ).^2 + ( z(i)-z(j) ).^2);
        if dist < r
            neighbors(i)= neighbors(i)+1;
            neighbors(j)= neighbors(j)+1;
        end
    end
end

end 