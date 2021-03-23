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
cd /data/scc/kobeck/Master/28112020_121020
addpath('/data/scc/kobeck/Master/Analyse/')
%% Initialize 
tStart=0;           %starttime
tStep=10000;        %timesstep
steps=1001;            %number of steps
nNeighbors=10;
filename='dump.xyz';

read=@xyzread;
neighbors=@Neighbors;
ord=@order;
[natoms, c, x, y, z] = read(filename,steps);
listing=dir('dump_quat.*');
quat={listing.name};
o=zeros(natoms,1);
ordnung=zeros(steps);


%% Calculate

for t=1:100:1001%steps
        dump=[c(:,t) x(:,t) y(:,t) z(:,t)];
        [Neigh, dist]=neighbors(nNeighbors,dump,natoms);
        disp('Zeitschritt:');
        disp(t);
        file=quat{t};
        %vecotrization
        i=[1:natoms];
        o=ord(i,Neigh(i,:),nNeighbors,file,dist(i,:));
        
%         for i=1:natoms
%             if (mod(i,1000)==0)
%                 disp(i)
%             end
%             o(i)=ord(i,Neigh(i,:), nNeighbors, file, dist(i,:));
%         end

        ordnung(t)=mean(o);

end

save('ordnung.ascii','ordnung');


% %% Plot
% plot(ordnung)
% xlabel('Zeitschritte')
% ylabel('Unordnung')






