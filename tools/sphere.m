clear all;
close all;
clc;

D = 10;                        % Durchmesser Kolloid
d = 1;                          % Durchmesser Perlen

%% Winkelraster
b = d;                          % Falls Perlen zu nahe: anpassen
N = 1 / 4 * pi * D / b;
N = floor(N);
dPhi = pi / 2 / N;
Angle = (dPhi / 2):dPhi:(pi / 2 - dPhi / 2);

%% Achtelkugel
Z = D / 2 * cos(Angle);
RZ = sqrt((D / 2)^2 - Z.^2);
NR = 1 / 2 * pi * RZ / b;
NR = floor(NR);
dPhiR(NR > 0) = pi / 2 ./ NR(NR > 0);
dPhiR(NR <= 0) = 0;

Beads = [];
for i = 1:length(Angle)
    if dPhiR(i) > 0
        Temp = Z(i) * 2 / D;
        X = cos((dPhiR(i) / 2):dPhiR(i):(pi / 2 - dPhiR(i) / 2)) * sqrt(1 - Temp.^2);
        Y = sin((dPhiR(i) / 2):dPhiR(i):(pi / 2 - dPhiR(i) / 2)) * sqrt(1 - Temp.^2);
        X = X * D / 2;
        Y = Y * D / 2;
        BeadsTemp = [X; Y; ones(1,length(X)) * Z(i)];
        Beads = [Beads BeadsTemp];
    end
end

%% Spiegeln
for dim = 1:3
   BeadsTemp = Beads;
   BeadsTemp(dim,:) = - BeadsTemp(dim,:);
   Beads = [Beads BeadsTemp];
end

%% Ergänzen
if dPhiR(1) == 0
   BeadsTemp = [0 0; 0 0; (D / 2) -(D / 2)];
   Beads = [Beads BeadsTemp];
end

%% Ausgabe VMD
out = [zeros(1,length(Beads)); Beads];
fileID = fopen('sphere-10nm.xyz','w');
fprintf(fileID,'%d\n\n',length(Beads));
fprintf(fileID,'%d\t%8.5f\t%8.5f\t%8.5f\n', out);
fclose(fileID);

%% Ausgabe Hydro++
out = [Beads; d / 2 * ones(1,length(Beads))];
fileID = fopen('sphere-10nm.txt','w');
fprintf(fileID,'1.E-07,\n');
fprintf(fileID,'%d,\n',length(Beads));
fprintf(fileID,'%11.7f  %11.7f  %11.7f  %9.5f\n', out);
fclose(fileID);

%% Schwerpunkt
M = sum(Beads');
