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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



function [o] = order(index,Neighbors, N, quatfile, dist)

euler=@Euler_calc;
Delta_avg=0;    %average deviation
Delta=zeros(3,N);    %deviation
A= dlmread(quatfile,' ',9,0);

%Angles of the particle 'index'
[alpha, beta, gamma]=euler(A(index,2), A(index,3), A(index,4), A(index,5));
alpha=mod(alpha,pi/2);
beta=mod(beta,pi/2);
gamma=mod(gamma,pi/2);

%Angles of the neighboring particles
for i=1:N
    index2=Neighbors(i);
    [phi, theta, psi]=euler(A(index2,2), A(index2,3), A(index2,4), A(index2,5));
    
    
    phi=mod(phi,pi/2);
    theta=mod(theta,pi/2);
    psi=mod(psi,pi/2);
    
    
    Delta(1,i)= alpha-phi;
    Delta(2,i)= beta - theta;
    Delta(3,i)= gamma - psi;
    dist(i)=dist(index2);
end
Delta=mean(Delta);
neighborOrder=Delta(i);%*1./dist(i);
Delta_avg=mean(neighborOrder);
o=abs(Delta_avg);
end 
