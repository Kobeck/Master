str='C:\Users\Konstantin Beck\OneDrive - bwedu\Cubes\Besprechung\NPT\1000Cubes\grossneu\';
j=100;
data=append(str,'dump_quat.',num2str(j(1)),'00000.ascii');
Im= append(str,'image.',num2str(j(1)),'00000.png'); 
A= dlmread(data,' ',9,0);
B= imread(Im);
% for i=1:1000
%     q(i) =quaternion(A(i,1:4));
%     E=quat2eul(quat);
% end 


for i=1:1000
phi(i)= atan2( 2* (A(i,1)*A(i,2)+A(i,3)*A(i,4)) , 1-2 *(A(i,2).^2 +A(i,3).^2));
theta(i) = asin(2* (A(i,1)*A(i,3)- A(i,4)*A(i,2)));
psi(i)= atan2( 2* (A(i,1)* A(i,4) +A(i,2)*A(i,3)), 1- 2* (A(i,3).^2 +A(i,4).^2));
end 
phi_mod=mod(phi,pi/2);
theta_mod=mod(theta+pi,pi/2);
psi_mod=mod(psi+pi,pi/2);

%Bilder
% figure(1)
% hist(phi_mod,100)
% figure(2)
% hist(theta_mod,100)
% figure(3)
% hist(psi_mod,100)
j=(j)/10;
subplot(1,3,1)
    hist(phi_mod,100)
    title('phi')
subplot(1,3,2 )
    hist(theta_mod,100)
    title('theta')
subplot(1,3,3)
    hist(psi_mod,100)
    title('psi')
