% lj93 
close all; clear all;
x = 0.1:0.01:2 ;
epsilon = 1; 
sigma = 2; 
pot93 = epsilon * ( 2/15 * (sigma./x) .^12 - (sigma./x).^6);
pot126= 4*epsilon * ((sigma./x) .^12 - (sigma./x).^6);
plot(x, pot93)
hold on 
plot(x, pot126)
hold off 
axis([0 4 -5 4])
legend('93', '126')