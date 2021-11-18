function [IsWildType, phenotyped,areawtantmat,lgintantmat,count1,areawtantmut,lgintantmut]=AnalyzeWorm_pab1_mod(image_pixel,areawtantmat,lgintantmat,count1)

%% Define Thresholds
if count1<50
areawtantmut=2.07e+07;
lgintantmut=1.3e+07;
% Threshold adapted based on data points accumulated in current run
else
    areawtantmut=mean(areawtantmat(1:count1))+1.88*std(areawtantmat(1:count1));
    lgintantmut=mean(lgintantmat(1:count1))+1.88*std(lgintantmat(1:count1));
end


gim=image_pixel(:,:,1);
imn1=mat2gray(gim);

%% Split Into Anterior and Posterior Images
[antimb, postimb, xmid]=antpost(imn1);

% Discard animals that fail to split into anterior and posterior
if xmid==0
    areawtant=0;
    lgintant=0;
    IsWildType=true;
    phenotyped=true;
else

 
antim=image_pixel(1:xmid,:); %Anterior Image


%% Identify Approximate Pharynx Boundary
antimb=antim>650;

B2ant=regionprops(antimb,'Area','PixelIdxList');

if size(B2ant,1)>0
szant=extractfield(B2ant,'Area');
maxobant=max(szant);
else
    maxobant=0;
end

ct=0;
while maxobant<100000
    ct=ct+1;
    antimb=antim>(650-25*ct);
    B2ant=regionprops(antimb,'Area','PixelIdxList');
if size(B2ant,1)>0
szant=extractfield(B2ant,'Area');
maxobant=max(szant);
else
    maxobant=0;
end
end




% Remove all objects but the largest
kant=size(B2ant);
E1ant=zeros(kant(1));
for j=(1:kant(1))
    E1ant(j)=B2ant(j).Area;
end

Fant=sort(E1ant,'descend');

for j=(1:kant(1))
    if B2ant(j).Area==Fant(1)
        B2ant(j).Area=B2ant(j).Area;
    else
        epx=B2ant(j).PixelIdxList;
        antimb(epx)=0;
    end
end

% Pharynx boundary post-processing
se=strel('diamond',3);
antimb2=imdilate(antimb,se);
antimb=imerode(antimb2,se);
% figure(1);imshow(antimb);
B3ant=regionprops(antimb,antim,'MeanIntensity','Area');

% figure(1);imshow(postimb);


antint=B3ant(1).MeanIntensity; %Mean intensity of anterior pharynx



%% Aggregate Thresholding
nhood=ones(3,3);
Cant=stdfilt(antim,nhood); %Acquire standard deviation filter of 3x3 neighborhood
Cantm=Cant/antint; %Scale standard deviation filter by mean intensity of anterior pharynx
Cnant=mat2gray(Cant);
imfinalant=zeros(size(Cnant));
% imfinalant1=zeros(size(Cnant));
% imfinalant2=zeros(size(Cnant));
for i=(1:10) %Stepwise increments of a range of thresholds
    T=0.14+0.01*i; %Stepwise increase in threshold stringency
    BWant2=imbinarize(Cantm,T);
    BWant=bwareaopen(BWant2,10);
    se=strel('diamond',3);
    im3ant=imdilate(BWant,se);
    im4ant=imerode(im3ant,se);
    im5ant=imfill(im4ant,'holes');
    im6ant=bwareaopen(im5ant,5);
    Z=regionprops(im6ant,'Area','PixelIdxList');
    im6ant1=im6ant;
    for j=(1:size(Z,1))
        if Z(j).Area>500 %Remove objects that exceed size threshold
            p=Z(j).PixelIdxList;
            im6ant1(p)=0;
        end
    end
    imfinalant=imfinalant|im6ant1;%Overlay new objects from each step
end

Z=regionprops(imfinalant,'Eccentricity','PixelIdxList'); %Remove long objects
    for i=(1:size(Z,1))
        if Z(i).Eccentricity>0.97
            p=Z(i).PixelIdxList;
            imfinalant(p)=0;
        end
    end
    

%% Extract Pegionprops from Aggregate Objects 
Bant=regionprops(imfinalant,antim,'Area','MeanIntensity'); 

antwtint=0;
npunctant=size(Bant,1);
Bantarea=zeros(1,npunctant); %Initialize aggregate property matrices
Bantint=zeros(1,npunctant);
lgintant=0;



for i=1:npunctant
    antwtinti=Bant(i).Area*Bant(i).MeanIntensity;
    antwtint=antwtint+antwtinti; %Total Aggregate Intensity
    antareai=Bant(i).Area;
    Bantarea(i)=Bant(i).Area;
    Bantint(i)=Bant(i).MeanIntensity;
    if antareai>150 %Total Large Aggregate Intensity
        lgintanti=Bant(i).Area*Bant(i).MeanIntensity;
        lgintant=lgintant+lgintanti;
    end

end


areawtant=antwtint;
if max(max(imfinalant))==0 %Define large intensity if no aggregate objects
    lgintantm=0;
else
    lgintantm=lgintant;
end


    areawtantmat(count1)=areawtant;%Add values to accumulated matrices
    lgintantmat(count1)=lgintantm;
    count1=count1+1;
mutant=areawtant>areawtantmut||lgintantm>lgintantmut;%Mutant conditional statement




    IsWildType=~mutant;
    phenotyped=true;

end

