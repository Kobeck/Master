% lj93 
close all; clear all;
x = .1:0.01:0.581 ;
epsilon = 1.0; 
sigma = 1.0; 
pot93 = 2* epsilon * ( 2/15 * (sigma./x) .^9 - (sigma./x).^3);
pot126= 4*epsilon * ((sigma./x).^12 - (sigma./x).^6);
%plot(x, pot93)
%hold on 
plot(x, pot126./10.^12)
hold off 
%axis([9 14 0 100])
%legend('93', '126')