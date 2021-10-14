function data = readquat(filename,ncol)
    
    assert(exist(filename,'file')==2,['Cannot find file ',filename,'.'])

    fid = fopen(filename,'r');
    fmt = repmat('%f', 1, ncol);
    datacell = textscan(fid,fmt, 'HeaderLines', 9, 'CollectOutput',1);
    fclose(fid);
    data = datacell{1};
    data = sortrows(data);
    
end
