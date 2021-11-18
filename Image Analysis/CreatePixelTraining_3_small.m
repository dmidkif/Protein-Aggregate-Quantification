%This function creates a library containing the features matrix, as well as
%the classification vector for each pixel as either part of an aggregate or
%not.

function [data]=CreatePixelTraining_3_small(dictionary)

%dictionary - contrains the images to be used and x-y coordinates for the synapses

%cPixelTraining.negativeSamplesPerImage - contains the number of negative
%samples per image


index=1;

im=imread(dictionary(1).file);
% imin0=min(min(im));
% imin=double(imin0)/65535;
% imax0=max(max(im));
% imax=double(imax0)/65535;
% im=imadjust(im,[imin imax]);
features=create_features(im);
% n_features=size(features,2);
n_points=0;
for i=1:length(dictionary)
    temp_im=imread(dictionary(i).label);
    n_points=n_points+sum(temp_im(:)); %calculate # of positive points
end
% n_points=n_points+cPixelTraining.negativeSamplesPerImage*length(dictionary); %total points
% data.features=zeros(n_points,n_features,'double')-100;
% data.class=zeros(1,n_points)-100;


n_points=[];
tic; time=toc;

for i=1:length(dictionary)
    elapsed_t=toc-time;
    disp(sprintf('Worm %d', i))
    disp(sprintf('Time %d', elapsed_t))
    image=imread(dictionary(i).file);

% imin0=min(min(image));
% imin=double(imin0)/65535;
% imax0=max(max(image));
% imax=double(imax0)/65535;
% image=imadjust(image,[imin imax]);
    features=create_features(image); 
    temp_im=logical(imread(dictionary(i).label)); %ground truth
    
    
    se=strel('disk',10);
    se2=strel('disk',2);
%     dilated_label=imdilate(temp_im,se)-temp_im;  
%     dil_index=find([dilated_label-temp_im]
    
    BW=edge(image,'Sobel');
    BW2=imdilate(BW,se)-imdilate(temp_im,se2);
  
    class=temp_im(:);
    neg_index1=find(BW2==1 & temp_im==0); %pixels identified by edge detection
    neg_index2t=find(BW2==0 & temp_im==0); %negative pixels, not in edge
    
    neg_perm=randperm(length(neg_index2t)); %randomize neg_index2
    neg_index2=neg_index2t(neg_perm(1:length(neg_index1))); %take the same number of negs as those taken by edge
    
    neg_index=[neg_index1;neg_index2]; %concatenate both negative indices
    output=features(neg_index,:); %features of negative points
    class_temp=zeros(1,length(neg_index));
    
    pos_index=find(class~=0);
    class_temp(1,end+1:end+length(pos_index))=class(pos_index);
    output(end+1:end+length(pos_index),:)=features(pos_index,:);
    
    n_points=size(output,1);
    data.features(index:index+n_points-1,:)=output;
    data.class(1,index:index+n_points-1)=class_temp';
    index=index+n_points;    
end
