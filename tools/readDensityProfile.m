%% Import data from text file
% Script for importing data from the following text file:
%
%    filename: C:\Users\Konstantin Beck\OneDrive - bwedu\Masterarbeit\copy\thermo_juelich\32_temp05-15-15_05-1047\density.profile
%
% Auto-generated by MATLAB on 15-May-2021 18:19:33
clear all; close all; clc;
%% Set up the Import Options and import the data
opts = delimitedTextImportOptions("NumVariables", 5);

% Specify range and delimiter
opts.DataLines = [4, Inf];
opts.Delimiter = " ";

% Specify column names and types
opts.VariableNames = ["VarName1", "Chunkaveraged", "data", "for1", "Var5"];
opts.SelectedVariableNames = ["VarName1", "Chunkaveraged", "data", "for1"];
opts.VariableTypes = ["double", "double", "double", "double", "string"];

% Specify file level properties
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";
opts.ConsecutiveDelimitersRule = "join";
opts.LeadingDelimitersRule = "ignore";

% Specify variable properties
opts = setvaropts(opts, "Var5", "WhitespaceRule", "preserve");
opts = setvaropts(opts, "Var5", "EmptyFieldRule", "auto");

for iter=1:3
    % Import the data
    wd="./"; %strcat("scc_240_temp08_0",num2str(iteration),"-30_05-0624");
    if iter==1
        readfile='density.profile';
        savefile='density.avi';
    
    elseif iter==2
        readfile="temp.profile";
        savefile="temp.avi";
    elseif iter==3
        savefile="number.avi";
    end
    
    F=fullfile(wd,readfile);
    density = readtable(F, opts);
    %disp(strcat("currently on file", wd,". iteration index", num2str(iteration)))

    %% Clear temporary variables
    %clear opts

    % visualize density profile
    A=table2array(density);
    index=1;
    bin=A(index,2);
    nsteps=length(A)/(bin+1);
    data=zeros(nsteps,bin);
    
    if iter==1
        col=4;
        axvec=[0 160 0 1];
    elseif iter==2
        col=4; 
        axvec=[0 160 0.5 1.5];
    elseif iter==3
        col=3;
        axvec=[0 160 0 12000];
    end
    
        
    for i=1:1:nsteps-1
        data(i,:)=A( (i-1)*(bin+1)+2 :i*(bin+1),col);
        %I=imread(strcat('image.',num2str((i-1)*100),'.png'));
        plot(data(i,:));
        axis(axvec);
        M(i)=getframe;
    end

    writerObj = VideoWriter(fullfile(wd,savefile));
    writerObj.FrameRate = 30;
    open(writerObj);

    for i=1:length(M)
        % convert the image to a frame
        frame = M(i) ;    
        writeVideo(writerObj, frame);
    end

    close(writerObj);
end
    