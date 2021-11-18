function [filt_im]=create_features(image)
image=double(image);

img=image;


filt_im=zeros(size(img,1)*size(img,2),14,'double'); %Creates the features matrix

% Defines Gaussian transforms

% hsizes=[5 11]; %for average and std dev
h1 = fspecial('gaussian', 15, 0.1);
h2 = fspecial('gaussian', 15, 15*0.1);
h3 = fspecial('gaussian', 15, 100*0.1);

% Each of the subsequent operations defines a metric 
 
    %1=image
    im_slice=img;
    filt_im(:,1)=im_slice(:);
    %2=gradient 
    hy = fspecial('sobel'); hx = hy';
    Iy = imfilter(im_slice, hy, 'replicate');
    Ix = imfilter(im_slice, hx, 'replicate');
    grad_im = sqrt(Ix.^2 + Iy.^2);
    filt_im(:,2)=grad_im(:);
  
    %3,4=DOGs
    dog1=imfilter(im_slice,h1,'replicate');

    ddog1=dog1-imfilter(im_slice,h2,'replicate');filt_im(:,3)=ddog1(:);

    ddog3=dog1-imfilter(im_slice,h3,'replicate');filt_im(:,4)=ddog3(:);
    % 5 Standard Deviation Filter 
    SE = strel('disk',1);
    temp_im=stdfilt(im_slice,SE.Neighborhood);
    filt_im(:,5)=temp_im(:);
    % 6= LOG
    hlog2=fspecial('log',3,0.1);
    temp_im=imfilter(im_slice,hlog2,'replicate'); 
    filt_im(:,6)=temp_im(:);
    
    % 7= Disk Filter
    temp_im = imfilter((im_slice),fspecial('disk',3),'replicate')-im_slice;
    filt_im(:,7)=temp_im(:);
    
    % 8= Intensity Scaled
    imin0=min(min(im_slice));
    minval=double(imin0)/65535;
    imax0=max(max(im_slice));
    maxval=double(imax0)/65535;
    temp_im=imadjust(uint16(im_slice),[minval maxval]);
    temp_im=double(temp_im);
    filt_im(:,8)=temp_im(:);
    
    % 9,10= Background Subtracted Images
    im2=imgaussfilt(im_slice,16);
    im3=abs(im_slice-im2);
    temp_im=im3;
    filt_im(:,9)=temp_im(:);
    imsm=imgaussfilt(im3,16);
    im7=abs(im3-imsm);
    temp_im=im7;
    filt_im(:,10)=temp_im(:);
    
    % 11,12 = Smoothed Standard Deviation
    stdim=stdfilt(im_slice,SE.Neighborhood);
    temp_im=imgaussfilt(stdim);
    filt_im(:,11)=temp_im(:);
    temp_im=imgaussfilt(stdim,2);
    filt_im(:,12)=temp_im(:);
    
    % 13, 14= Range Filter
    rngim=rangefilt(im_slice,SE.Neighborhood);
    filt_im(:,13)=rngim(:);
    temp_im=imgaussfilt(rngim);
    filt_im(:,14)=temp_im(:);
