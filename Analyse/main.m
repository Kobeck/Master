%main program
%Was soll das Programm machen?
%Output: Zeitliche Entwicklung des Ordnungparameters 
%       -> o(t) 
%       -> Heatmap(t)
%Input: -> xyz Koordinaten
%       -> zugehoerige Quaternionen 
%       -> # Zeitschritte 
%       -> Anzahl Nachbarn
%       -> Anzahl Atome 
%
%
% determine t and nNeighbors and nAtoms 
% determine filenames of xyz and dump.quat(t)
% loop t
%       read coordinates out of xyz
%       read quaternions 
%       Determine order(...) of t
%       Visualize Heatmap(t)
%       give o(t) 
% end loop t
% give o(t)

clear all; close all; clc;
%% Initialize
tStart=0;           %starttime
tStep=10000;        %timesstep
steps=101;            %number of steps
nNeighbors=10;
filename='../dump.xyz';

read=@xyzread;
neighbors=@Neighbors;
ord=@order;
[natoms, c, x, y, z] = read(filename,steps);
listing=dir('../dump_quat.*');
quat=[];
quat={listing.name}
for t=1:steps
  
        t
        quat{t}
        dump=[c(:,t) x(:,t) y(:,t) z(:,t)];
        [Neigh, dist]=neighbors(nNeighbors,dump,natoms);
        
        for i=1:natoms
            i
            % Matrix containing indices and coordinates of the neighboring particles
            o(i)=ord(i,Neigh(i,:), nNeighbors, quat{t}, dist);
        end

        ordnung(t)=mean(o);


%       plot(ordnung,0:tstep:tMax)

end






