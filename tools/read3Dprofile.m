%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: /data/scc/kobeck/Master/juelich/mix/120/evap/juelich_768_evap37-10_10-2221/dens3.profile
%
% Auto-generated by MATLAB on 14-Oct-2021 13:08:19
clearvars; close all;
%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 7);

% Specify range and delimiter
opts.DataLines = [4, Inf];
opts.Delimiter = " ";

% Specify column names and types
opts.VariableNames = ["VarName1", "Chunk", "Coord1", "Coord2", "Coord3", "Ncount", "Var7"];
opts.SelectedVariableNames = ["VarName1", "Chunk", "Coord1", "Coord2", "Coord3", "Ncount"];
opts.VariableTypes = ["double", "double", "double", "double", "double", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";

% Specify variable properties
opts = setvaropts(opts, "Var7", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "Var7", "EmptyFieldRule", "auto");

% Import the data
dens3 = readtable("dens3.profile", opts);
mkdir dens3
%% Convert to output type
dens3 = table2array(dens3);
wobj = VideoWriter(fullfile(pwd,'dens3'));
wobj.FrameRate = 10;
open(wobj);


%% analyse data
xdim = 80;
ydim = xdim;
zdim = 160;
len = xdim*ydim*zdim;
hFig = figure;     

Y=[0.5:1:80];
Z=[0.5:1:160];
for t=1:20
    densmat = reshape(dens3((t-1)*(len+1)+2:(t-1)*(len+1)+1+ydim*zdim,6),zdim,ydim);

    p=pcolor(Y,Z,densmat);
    colorbar
    caxis([0,0.8])
    shading interp

    pbaspect([1 2 1]);
        drawnow;
    disp(t)
    %hFig.WindowState = 'maximized';  

    fname = ['dens3/dens3.' num2str(t) '.jpg']; % full name of image
    print('-djpeg','-r200',fname)     % save image with '-r200' resolution
    I = imread(fname);       % read saved image
    frame = im2frame(I);              % convert image to frame
    
    writeVideo(wobj,frame);           % save frame into video
end



% for i=1:length(M)
%     % convert the image to a frame
%     frame = M(i) ;    
%     writeVideo(wobj, frame);
% end

close(wobj);


%% Clear temporary variables
clear opts