% reads all coordiates for $steps timesteps as well as number of particles
% input: 
%       -filename
%       -steps 
% output:
%       -[natoms,c,x,y,z]

function [natoms,c,x,y,z] = xyzread(filename,steps)
% xyzread simply imports the x,y,z columns of a .xyz file.  Note: there
% is no real standard for .xyz files, so your .xyz file may be different
% from the .xyz files I wrote this for.  I wrote this one for GMT/GIS
% files.  
% 
%% Syntax
% 
% [x,y,z] = xyzread(filename)
% [x,y,z] = xyzread(filename,Name,Value) 
% 
%% Description
% 
% [x,y,z] = xyzread(filename) imports the columns of a plain .xyz file. 
% 
% [x,y,z] = xyzread(filename,Name,Value) accepts any textscan arguments 
% such as 'headerlines' etc. 
% 
%% Author Info 
% This script was written by Chad A. Greene of the University of Texas 
% at Austin's Institute for Geophysics (UTIG), April 2016. 
% http://www.chadagreene.com 
% 
% See also xyz2grid and textscan. 

%% Error checks: 

narginchk(1,inf) 
nargoutchk(5,5)
assert(isnumeric(filename)==0,'Input error: filename must ba a string.') 
assert(exist(filename,'file')==2,['Cannot find file ',filename,'.'])

%% Open file: 
fid = fopen(filename); 

N = textscan(fid,'%f',1,'delimiter','\n');
natoms=N{1,1};
frewind(fid);
%% separate block for t=1, don't know why needed
t=1;
counter=t;
    counter = textscan(fid,'%f %f %f %f',N{1,1}, 'headerlines', 2);  %varargin{:},'headerlines',2); 
    % Get scattered data: 
    c(:,t) = counter{1};
    x(:,t) = counter{2}; 
    y(:,t) = counter{3}; 
    z(:,t) = counter{4}; 
    
%% read data for every step 
for t=2:1:steps
    counter=t;
    counter = textscan(fid,'%f %f %f %f',N{1,1}, 'headerlines', 3);  %varargin{:},'headerlines',2); 
    % Get scattered data: 
    c(:,t) = counter{1};
    x(:,t) = counter{2}; 
    y(:,t) = counter{3}; 
    z(:,t) = counter{4}; 
end

fclose(fid);
end