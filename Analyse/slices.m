function [index]=slices(filename, axis, bin)

read=@xyzread;
[natoms c x y z] = read(filename);
%index= zeros(natoms,5);
index= [c x y z zeros(1,natoms)]

end 

