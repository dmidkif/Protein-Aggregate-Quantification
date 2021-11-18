dirname='G:\Shared drives\SanMiguelLab\RawData\Danny\imaging_1_12_20\DCD214\';
antdirname=strcat(dirname,'Anterior\');
postdirname=strcat(dirname,'Posterior\');
z=dir(fullfile(dirname,'*.tif'));

%%

firstim=3;
lastim=3;
nimg=lastim-firstim+1;

npr=zeros(nimg);
i=1;

for n=(firstim:lastim)

% antfile=strcat(antdirname,zant(n).name); % creates a variable with the full path to image # 1 (if there was a 2 inside the parenthesis, that would be image #2)
file=strcat(dirname,z(n).name); 
im=imread(file);
% im=im(960:1920,:);
imsc=im*50;
thr=4000;
imbin=im>thr;
imbin=imbinarize(double(imbin));
se=strel('diamond',80);
imbin2=imdilate(imbin,se);
imbin3=imerode(imbin2,se);
imbin=imbin3;
E=regionprops(imbin,'Area','PixelIdxList');
k=size(E);
E1=zeros(k(1));
imout=imbin;
for j=(1:k(1))
    E1(j)=E(j).Area;
end
F=sort(E1,'descend');

for j=(1:k(1))
    if E(j).Area==F(1) || E(j).Area==F(2)
        E(j).Area=E(j).Area;
    else
        epx=E(j).PixelIdxList;
        imout(epx)=0;
    end
end
imbin=imout;

if k(1)<2
    npr(i)=n;
    i=i+1;
    
else
E=regionprops(imbin,'Centroid');
P1=E(1).Centroid;
P2=E(2).Centroid;
x=P1(1)-P2(1);
y=P1(2)-P2(2);
xyrat=x/y;
ymid=(P1(2)+P2(2))/2;
xmid=(P1(1)+P2(1))/2;
if abs(xyrat)<=1
    im1=im(1:ymid,:);
    im2=im(ymid:2304,:);
    imb1=imbin(1:ymid,:);
    imb2=imbin(ymid:2304,:);
else
    im1=im(:,1:xmid);
    im2=im(:,xmid:2304);
    imb1=imbin(:,1:xmid);
    imb2=imbin(:,xmid:2304);
end

pixels1=regionprops(imb1,'PixelList');
pixels2=regionprops(imb2,'PixelList');
pixels1=pixels1.PixelList;
pixels2=pixels2.PixelList;
min1=min(pixels1);
min1(1)=max((min1(1)-200),1);
min1(2)=max((min1(2)-200),1);
min2=min(pixels2);
min2(1)=max((min2(1)-200),1);
min2(2)=max((min2(2)-200),1);
max1=max(pixels1);
max1(1)=min((max1(1)+200),size(im1,2));
max1(2)=min((max1(2)+200),size(im1,1));
max2=max(pixels2);
max2(1)=min((max2(1)+200),size(im2,2));
max2(2)=min((max2(2)+200),size(im2,1));
im1=im1(min1(2):max1(2),min1(1):max1(1));
im2=im2(min2(2):max2(2),min2(1):max2(1));

figure(1);
subplot(1,3,1);imshow(im,[]);
subplot(1,3,2);imshow(im1,[]);
subplot(1,3,3);imshow(im2,[]);
impixelinfo();
figure(2);imshow(imbin);
filename=z(n).name;
prompt='Enter "a" if Image 1 is anterior, "p" if Image 1 is posterior, and "m" if manual split, "x" if discard: \n ';
inp=input(prompt,'s');
close;
if inp=='a'
    imwrite(im1,strcat(antdirname,z(n).name))
    imwrite(im2,strcat(postdirname,z(n).name))
elseif inp=='p'
    imwrite(im2,strcat(antdirname,z(n).name))
    imwrite(im1,strcat(postdirname,z(n).name))  
elseif inp=='m'
    npr(i)=n;
    i=i+1;
end
        

    
    

end




npr=npr(1:find(npr,1,'last')); 
m=size(npr,2);
nprfiles=strings(m,1);
for n=1:m
    b=npr(n);
    nprfiles(n)=z(b).name; 
    
end
