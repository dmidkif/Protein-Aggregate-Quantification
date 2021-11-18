%% Function for splitting anterior and posterior objects in vertically oriented animals
function [antout, postout, xmid]=antpost(im)
t1=graythresh(im); %Binarize anterior and posterior objects
rbw=imbinarize(im,t1);
se=strel('square',130);
imin1=imdilate(rbw,se);
imin=imerode(imin1,se);
%% Identify Two Largest objects
E=regionprops(imin,'all');
k=size(E);
E1=zeros(k(1));
imout=imin;
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

E2=regionprops(imout,'all');

%% Image Splitting
if size(E2,1)<=1 %If no objects are identified
    antout=0;
    postout=0;
    xmid=0;
else
 midpoint=(E2(1).Centroid+E2(2).Centroid)/2;
 xmid=midpoint(2);
 xmid=round(xmid);

antout=imout(1:xmid,:);
postout=imout(xmid:size(imout,1),:);

end
end

