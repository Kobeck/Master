% lj93 
close all; clear all;
x = 10.1:0.01:10.581 ;
epsilon = 100.0; 
sigma = 1.0; 
pot93 = 2* epsilon * ( 2/15 * (sigma./x) .^9 - (sigma./x).^3);
pot126= 4*epsilon * ((sigma./(x-10)) .^12 - (sigma./(x-10)).^6);
%plot(x, pot93)
%hold on 
plot(x, pot126)
hold off 
axis([9 12])
legend('93', '126')