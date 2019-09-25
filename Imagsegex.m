%% Image segmentation and extraction
clc
clear all
close all
%% Read Image
imagen=imread('Test.jpg');

%% Show image
figure(1)
imshow(imagen);

%% Convert to gray scale
if size(imagen,3)==3 % RGB image
    imagen=rgb2gray(imagen);
end



%% Convert to binary image
threshold = graythresh(imagen);
imagen =~im2bw(imagen,threshold);



%% Remove all object containing fewer than 30 pixels
imagen = bwareaopen(imagen,30);
pause(1)


%% Show image binary image
figure(2)
imshow(~imagen);

%% Label connected components
[L Ne]=bwlabel(imagen);
%% Measure properties of image regions
propied=regionprops(L,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
pause (1)
%% Objects extraction
j=1;
figure

for n=1:Ne
  [r,c] = find(L==n);
    n1=imagen((min(r)):(max(r)),(min(c)):(max(c)));
    n1=~n1;
    n1=imresize(n1,[130 66]);
    figure,imshow(n1);
    we=int2str(n);
    imwrite(n1,strcat(we,'.jpg'));
   k(:,:,j)=n1;
    j=j+1;
    pause(0.5)
end


    