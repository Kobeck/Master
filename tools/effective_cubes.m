%plot the effective potential between two cubes
clearvars; 
cube_coords = readmatrix('coordsxyz.txt');
cutoff = 2.5;
sig = 1;
eps = 2;

x_1=0;
y_1=0;
z_1=0;


% x_2=-10;
% y_2=0;
% z_2=0;


cube1=cube_coords(:,2:4);
cube1(:,1)=cube1(:,1)+x_1;
cube1(:,2)=cube1(:,2)+y_1;
cube1(:,3)=cube1(:,3)+z_1;

% cube2=cube_coords(:,2:4);
% cube2(:,1)=cube2(:,1)+x_2;
% cube2(:,2)=cube2(:,2)+y_2;
% cube2(:,3)=cube2(:,3)+z_2;

figure(1)
plot3(cube1(:,1),cube1(:,2),cube1(:,3),'o', 'MarkerSize', 10)
axis([-10 10 -10 10 -10 10])
% hold on;
% plot3(cube2(:,1),cube2(:,2),cube2(:,3),'o', 'MarkerSize', 10)
% hold off;

%% probe the surrounding of the cube and evaluate the effective potential

k=0;
for x = 4.5:0.001:5+cutoff+1
    % for y = 5:0.01:7.5
        k=k+1;
        
        neighbors = effective_neighbors(x,x,x, cube_coords, cutoff);
        v(k,:)=[sqrt(3*x.^2),0,0];
        if isempty(neighbors)==0
            
            len=length(neighbors(:,1));
            for i=1:len
                v(k,3)=v(k,3)+lj(eps,sig,cutoff,neighbors(i,4));
            end
        end
%         disp(length(neighbors));
%         pause(0.01)
     %end
end
figure(2)
plot(v(:,1),v(:,3));

k=0;
for x = 4.5:0.001:5+cutoff+1
    % for y = 5:0.01:7.5
        k=k+1;
        
        neighbors = effective_neighbors(x,x,x, cube_coords, cutoff);
        v(k,:)=[sqrt(3*x.^2),0,0];
        if isempty(neighbors)==0
            
            len=length(neighbors(:,1));
            for i=1:len
                v(k,3)=v(k,3)+lj(eps,sig,cutoff,neighbors(i,4));
            end
        end
%         disp(length(neighbors));
%         pause(0.01)
     %end
end
figure(2)
plot(v(:,1),v(:,3));k=0;
for x = 4.5:0.001:5+cutoff+1
    % for y = 5:0.01:7.5
        k=k+1;
        
        neighbors = effective_neighbors(x,x,x, cube_coords, cutoff);
        v(k,:)=[sqrt(3*x.^2),0,0];
        if isempty(neighbors)==0
            
            len=length(neighbors(:,1));
            for i=1:len
                v(k,3)=v(k,3)+lj(eps,sig,cutoff,neighbors(i,4));
            end
        end
%         disp(length(neighbors));
%         pause(0.01)
     %end
end
figure(2)
plot(v(:,1),v(:,3));k=0;
for x = 4.5:0.001:5+cutoff+1
    % for y = 5:0.01:7.5
        k=k+1;
        
        neighbors = effective_neighbors(x,x,x, cube_coords, cutoff);
        v(k,:)=[sqrt(3*x.^2),0,0];
        if isempty(neighbors)==0
            
            len=length(neighbors(:,1));
            for i=1:len
                v(k,3)=v(k,3)+lj(eps,sig,cutoff,neighbors(i,4));
            end
        end
%         disp(length(neighbors));
%         pause(0.01)
     %end
end
figure(2)
plot(v(:,1),v(:,3));k=0;
for x = 4.5:0.001:5+cutoff+1
    % for y = 5:0.01:7.5
        k=k+1;
        
        neighbors = effective_neighbors(x,x,x, cube_coords, cutoff);
        v(k,:)=[sqrt(3*x.^2),0,0];
        if isempty(neighbors)==0
            
            len=length(neighbors(:,1));
            for i=1:len
                v(k,3)=v(k,3)+lj(eps,sig,cutoff,neighbors(i,4));
            end
        end
%         disp(length(neighbors));
%         pause(0.01)
     %end
end
figure(2)
plot(v(:,1),v(:,3));k=0;
for x = 4.5:0.001:5+cutoff+1
    % for y = 5:0.01:7.5
        k=k+1;
        
        neighbors = effective_neighbors(x,x,x, cube_coords, cutoff);
        v(k,:)=[sqrt(3*x.^2),0,0];
        if isempty(neighbors)==0
            
            len=length(neighbors(:,1));
            for i=1:len
                v(k,3)=v(k,3)+lj(eps,sig,cutoff,neighbors(i,4));
            end
        end
%         disp(length(neighbors));
%         pause(0.01)
     %end
end
figure(2)
plot(v(:,1),v(:,3));
%contour(v(:,1),v(:,2),v(:,3))
axis([4 5+cutoff+1 -30 10])
title('cube')
