size = 7000 ; 
fid = fopen('bodies.txt','w');


for i =1:size 
    String=strcat(num2str(i)," 3 10\n1 0 0\n1 1 1 0 0 0\n0 0 0\n1\n");
    fprintf(fid, String);
end
ST = fclose(fid);