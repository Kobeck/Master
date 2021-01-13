clear;
files=dir('ordavgt*');
numArrays=length(files);
A= zeros(101,numArrays);
for i=1:numArrays
    A(:,i)=importdata(files(i).name);
    plot(A(:,i));
    hold on
   
end
