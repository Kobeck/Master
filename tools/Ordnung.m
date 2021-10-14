%Ordnung
% Dieses Skript soll die lokale Ordnung der Cubes bestimmen.
% Dafür werden die Quaternionen der Würfel direkt miteinander verglichen
% oder erst in Winkel umgerechnet
% Das Skript soll spaeter als function die Ordnung eines Zeitschritts
% bestimmen
%   Input: 
%       -   filename (Zeitschritt)
%       -   Ncubes
%       -   quat_0
%       -   Nneighbors
%   Output:
%       -   liste ( cube_i, ordnung(cube_i))
%       -   xyz file (ordnung x y z)

clearvars -EXCEPT quat_hist; close all;
o_avg=zeros(1,30);
for t = 1:30

    filename=strcat('dump.',num2str(t),'000000.order');
    data = readquat(filename,9);
    nAtoms = length(data);
    xyz = data(1:nAtoms, 1:4);
    quat21 = data(1:nAtoms, 5:9);

    % multiply quats with quat_0
    quat20 = readquat('dump.0.order',9);
    quat2 = quatcorrect(quat20, quat21);
    
    quatc = quatprod(quat_hist, quat2);
    % bestimme naechste Nachbarn 
    %       distance matrix speichern (symmetrisch)
    nNeighbors =6;
    fdist = @distance;
    neighList = zeros(nAtoms,nNeighbors);
    d = zeros(nAtoms, nAtoms);
    for i = 1:nAtoms
        x1 = xyz(i,2);
        y1 = xyz(i,3);
        z1 = xyz(i,4);
        for j = i+1:nAtoms
            x2 = xyz(j,2);
            y2 = xyz(j,3);
            z2 = xyz(j,4);

            d(i,j) = fdist(x1,y1,z1,x2,y2,z2);
            d(j,i)=d(i,j);
        end 
        d_tmp = [1:nAtoms; d(i,:)]';
        d_tmp = sortrows(d_tmp,2);

        %ignoriere selbst
        neighList(i,:) = d_tmp(2:nNeighbors+1,1);
    end

    %% Bestimme lokale Ordnung
    ord=@order;
    locOrd=zeros(1,nAtoms);
    for i=1:nAtoms
        locOrd(i)=ord(i,neighList(i,:),nNeighbors,quatc,d(i,:));
    end
    o_avg(t)=mean(locOrd);

end

plot(o_avg)

% order = [ i x y z o ]
