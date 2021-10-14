%function to calculate the local order of particle i by comparing the 
%euler angles mod90 to the neighbors as well as the average distance of the
%nearest neighbors. 
%input: 
    % index - index of particle to calculate the order of 
    % Neighbors - 1st output of function Neighbors, gives a Neighbors list
    % quatfile - filename of quaternions
    % dist - 2nd output of function Neighbors, gives distance matrix
%output: 
    % local order of particle index
function [o] = order(index,Neighbors, N, quatfile, dist)

euler=@Euler_calc;
Delta_avg=0;    %average deviation
Delta=zeros(3,N);    %deviation
A=quatfile;% dlmread(quatfile,' ',9,0);

%Angles of the particle 'index'
[alpha, beta, gamma]=euler(A(index,2:5));
alpha=mod(alpha,pi/2);
beta=mod(beta,pi/2);
gamma=mod(gamma,pi/2);
%Angles of the neighboring particles
nOrder= 0;
%sum over all Neighbors, cos(<theta>)/r
for i=1:N
    index2=Neighbors(i);
    [phi, theta, psi]=euler(A(index2,2:5));

    
    phi=mod(phi,pi/2);
    theta=mod(theta,pi/2);
    psi=mod(psi,pi/2);
    
    
    Delta(1,i)= alpha-phi;
    Delta(2,i)= beta - theta;
    Delta(3,i)= gamma - psi;
    Delta_avg(i) = mean(Delta(:,i));
    disp(Delta_avg(i));
    nOrder=nOrder + cos(abs(Delta_avg(i)))*1./(dist(index2)-9);
end
o = nOrder./N;

end 
