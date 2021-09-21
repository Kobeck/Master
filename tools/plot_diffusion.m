%Script to plot the mean Diffusion according to %
%       D = 1/6 * dMSD/dt    
%   dMSD/dt is calculated using linear regression in subsections

clearvars; close all;
plot_msd;

secsize=50;
nsections=floor(steps./secsize);

b=zeros(nsections,2);
hold on;
for i=1:nsections
    section=ave((i-1)*secsize+1:i*secsize);
    x=[(i-1)*secsize+1:i*secsize]';
    X=[ones(secsize,1) x];
    b(i,:)=X\section;
    disp(b)
    ycalc=X*[b(i,1) b(i,2)]';
    plot(x,ycalc);
end

figure(2)
plot([secsize:secsize:steps],b(:,2)./(6*1000*0.005),'o--')
savefig('diff.fig');
saveas(gcf,'diff.png');
    
    