%Function to calculate a neighbors list for every particle with N next
%Neighbors
%input:
    % N - number of neighbors 
    % dump - data read by function xyzread, format: [c x y z]
    % natoms - number of atoms 
%output:
    % A - neighbors list 
    % dist - distance matrix

function [A, dist] = Neighbors(N,dump, natoms)
%N is the Number of Neighbors
%dump is of format [c x y z]
A=zeros(natoms,N); %Neighborslist
dist= zeros(natoms, natoms);
distFunction=@distance;
for k=1:natoms %parfor
        x=dump(k,2);
        y=dump(k,3);
        z=dump(k,4);
    for j=k+1:natoms
        a=dump(j,2);
        b=dump(j,3);
        c=dump(j,4);
        dist(k,j)= distFunction(x,y,z,a,b,c);
        %matrixoperation
        dist(j,k)=dist(k,j);
    end
    dist_t = [1:natoms;dist(k,:)];
    dist_t= sortrows(dist_t',2); %sorted list of index and distance to k 
    for p=1:N
    A(k,p)= dist_t(p+1,1); %first N entries
    end 
end 


end 
