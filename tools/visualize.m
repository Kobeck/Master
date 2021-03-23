clear all; close all; clc;
%% Programm zur Visualisierung der Nachbarn eines Teilchens i
read= @xyzread; %path: C:\XYZ\xyzfileoperation\
filename='dump - Kopie.xyz';
[natoms, c, x, y, z] = read(filename);
dump=[c x y z];
i = input('particle index:');
disp('particle coordinates:');
disp( [x(i), y(i), z(i)]);

N = input('Number of neighbors:');
neighbors= @Neighbors;
Neigh=neighbors(N,dump,natoms);
disp(['The indices of the ', int2str(N), ' next neighboring particles are:'])
disp(Neigh(i,:));

% Matrix containing indices and coordinates of the neighboring particles
mat=[i, x(i), y(i), z(i)];
mat=[mat; Neigh(i,:)' , x(Neigh(i,:)), y(Neigh(i,:)),z(Neigh(i,:))];

plot3(mat(1,2),mat(1,3),mat(1,4), 'x')
hold on
for k=2:N+1
    plot3(mat(k,2),mat(k,3),mat(k,4),'o');
end 


