%plot msd
data= dump;
steps = 1001;
Natoms = 490;
msd = zeros(490,steps);
ave = zeros(1,steps);
for i = 1:steps
    msd(:,i) = data(491*(i-1)+2:491*i,5);
    ave(i) = mean(msd(:,i));
end


    
    