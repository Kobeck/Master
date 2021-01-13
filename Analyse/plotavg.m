clear all; close all;
files=dir('ordavgt*');
numArrays=length(files);
for j=1:numArrays
    A=importdata(files(j).name);
    subplot(numArrays/2,2,j), plot(A,'LineWidth',2);
    hold on;
end
  
    
 
%legend('4','5','6','7','8','9','11','12')
