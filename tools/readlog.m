function [varargout] = readlog(varargin)
% Read LAMMPS log files
% input is log file name with path
% output is a structure --> out
% out.Chead --> has heading of columns in each run
% out.data  --> has the data during each run in the form of string 
% Type str2num(out.data{i}) to get the numeric array
%
% Example
%       logdata = readlog('log.LAMMPS');
%
%  Author :  sarunkarthi@gmail.com
%            http://web.ics.purdue.edu/~asubrama/pages/Research_Main.htm
%            Arun K. Subramaniyan
%            School of Aeronautics and Astronautics
%            Purdue University, West Lafayette, IN - 47907, USA.

logfile ='log.lammps';%varargin{1};
try
    fid = fopen(logfile,'r');
catch
    error('Log file not found!');
end

loop = 1;
while feof(fid) == 0
    %----------- To get first line of thermo output --------
    while feof(fid) == 0
        a = fgetl(fid);
        if length(a) > 4 && strcmp(a(1:4),'Step')
            findstep = 1;
            break;
        end
    end
    %-------------------------------------------------------
    
    %---------Separate column headings----------------------
    j=1;
    k=1;
    Ch='';
    i=1;
    while i < length(a) && findstep == 1
        for i = k : 1 : length(a)
            if strcmp(a(i),' ')
                Chead{loop,j} = Ch;
                clear Ch;
                Ch = '';
                k=i+1;
                j=j+1;
                break;
            else
                Ch = [Ch a(i)];
            end
        end
    end
    if findstep == 1
        Chead{loop,j} = Ch; % to  get the last column heading        
    end
    %-------------------------------------------------------
    
    %----------------------Get Data-------------------------
    id = 1; %row id...
    while feof(fid) == 0
        a = fgetl(fid);
        if strcmp(a(1:4),'Loop')
            loop = loop + 1;
            break;
  %      elseif id > 3197
  %          loop = loop +1;
  %              break;
        else
            logdata(id,:) = str2num(a);
            id = id+1;
        end
    end

    %--------------------------------------------------------
    if feof(fid) == 0
        b = num2str(logdata);
        data{loop-1} = b;
        clear b;
        clear logdata;
        findstep = 0;
    end
end
fclose(fid);

%--------OUTPUT-------------------------------------------
out.Chead = Chead;
out.data = data;

varargout{1} = out;

thermo=str2num(out.data{1});
%hold on;
subplot(4,2,1)
plot(thermo(:,2))
title('Temp')
subplot(4,2,2)
plot(thermo(:,3))
title('E_pair')
subplot(4,2,3)
plot(thermo(:,4))
title('E_vdw')
subplot(4,2,4)
plot(thermo(:,5))
title('TotEng')
subplot(4,2,5)
plot(thermo(:,6))
title('Press')
subplot(4,2,6)
plot(thermo(:,7))
title('PotEng')
subplot(4,2,7)
plot(thermo(:,8))
title('KinEng')
subplot(4,2,8)
plot(thermo(:,9))
title('Atoms')

end

