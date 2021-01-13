%main program
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function main(filePath,savePath,size,Neighbors)

%disp(filePath);
cd(filePath);
addpath('/data/scc/kobeck/Master/Analyse/');

tStart=0;           %starttime
tStep=10000;        %timesstep
nNeighbors=Neighbors;
filename='dump.xyz';

read=@xyzread;
neighbors=@Neighbors;
ord=@order;

listing=dir('dump_quat.*');
quat={listing.name};
steps=length(quat);
[natoms, c, x, y, z] = read(filename,steps);
o=zeros(natoms,steps);

%% Calculate

parfor t=1:steps
        dump=[c(:,t) x(:,t) y(:,t) z(:,t)];
        [Neigh, dist]=neighbors(nNeighbors,dump,natoms);
        file=quat{t};
        for i=1:natoms
		o(i,t)=ord(i,Neigh(i,:), nNeighbors, file, dist(i,:));
        end
end

ordnung=mean(o);
save(fullfile(savePath,strcat('ordavgt',num2str(size),num2str(nNeighbors),'.txt')),'ordnung','-ASCII');
%save('ordmatrix.txt','o','-ASCII');
end







