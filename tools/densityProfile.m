% script to read density profile file 
clearvars -except density
A=table2array(density);
index=1;
bin=A(index,2);
nsteps=length(A)/(bin+1);
data=zeros(nsteps,bin);

for i=1:10:nsteps-1
    data(i,:)=A( (i-1)*(bin+1)+2 :i*(bin+1),3);
    I=imread(strcat('image.',num2str((i-1)*100),'.png'));
    subplot(121), P=plot(data(i,:));
    subplot(122), imshow(I);
    M(i)=getframe;
end

writerObj = VideoWriter('myVideo.avi');
writerObj.FrameRate = 30;
open(writerObj);

for i=1:length(M)
    % convert the image to a frame
    frame = M(i) ;    
    writeVideo(writerObj, frame);
end

close(writerObj);

% while(true)
%     if(index+1>=length(A))
%         break;
%     end
%     data(,:) = A(index+1:index+bin,3);
%     index=index+1+bin;
% end 

    