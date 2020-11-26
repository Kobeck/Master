function [phi, theta, psi]=Euler_calc(q1,q2,q3,q4)
phi= atan2( 2* (q1*q2+q3*q4) , 1-2 *(q2.^2 +q3.^2));
theta = asin(2* (q1*q3- q4*q2));
psi= atan2( 2* (q1* q4) +q2*q3 , 1- 2* (q3.^2 +q4.^2));
end 