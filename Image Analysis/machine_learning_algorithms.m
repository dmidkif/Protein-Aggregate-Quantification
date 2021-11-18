%% 1) CREATE DIRECTORIES
%Training Data
directory_name='G:\Shared drives\SanMiguelLab\RawData\Danny\All Data Sets\Training\Raw Images\';
dir_labels='G:\Shared drives\SanMiguelLab\RawData\Danny\All Data Sets\Training\Image Binaries\';

z=dir(fullfile(directory_name,'*.tif'));
z2=dir(fullfile(dir_labels,'*.tif'));


for j=1:length(z)
    training_dictionary(j).file=fullfile(directory_name,z(j).name);
    training_dictionary(j).label=fullfile(dir_labels,z2(j).name);
end
%%  2) CREATE TRAINING MATRIX (LABELS & FEATURES)
[PixelTrainingData_large]=CreatePixelTraining_3_large(training_dictionary); 

%% 3)NORMALIZE TRAINING MATRIX VALUES FROM 0 TO 1 --
[r, c]=find(PixelTrainingData_large.features==Inf);
cPixelTrainingLarge.Pixel_Min=min(PixelTrainingData_large.features);
cPixelTrainingLarge.Pixel_Max=max(PixelTrainingData_large.features);
PixelTrainingData_large.features=(PixelTrainingData_large.features - repmat(cPixelTrainingLarge.Pixel_Min,size(PixelTrainingData_large.features,1),1));
PixelTrainingData_large.features=PixelTrainingData_large.features*spdiags(1./(cPixelTrainingLarge.Pixel_Max-cPixelTrainingLarge.Pixel_Min)',0,size(PixelTrainingData_large.features,2),size(PixelTrainingData_large.features,2));

%% 4) TRAIN SVM Algorithm
MdlLg = fitctree(PixelTrainingData_large.features,PixelTrainingData_large.class);
%%  2) CREATE TRAINING MATRIX (LABELS & FEATURES)
[PixelTrainingData_small]=CreatePixelTraining_3_small(training_dictionary); 

%% 3)NORMALIZE TRAINING MATRIX VALUES FROM 0 TO 1 --
[r, c]=find(PixelTrainingData_small.features==Inf);
cPixelTrainingSmall.Pixel_Min=min(PixelTrainingData_small.features);
cPixelTrainingSmall.Pixel_Max=max(PixelTrainingData_small.features);
PixelTrainingData_small.features=(PixelTrainingData_small.features - repmat(cPixelTrainingSmall.Pixel_Min,size(PixelTrainingData_small.features,1),1));
PixelTrainingData_small.features=PixelTrainingData_small.features*spdiags(1./(cPixelTrainingSmall.Pixel_Max-cPixelTrainingSmall.Pixel_Min)',0,size(PixelTrainingData_small.features,2),size(PixelTrainingData_small.features,2));

%% 4) TRAIN SVM Algorithm
MdlSm = fitcsvm(PixelTrainingData_small.features,PixelTrainingData_small.class,'Cost',[0 1;4 0]);
%% 5) Process Validation/Sample Data

strdir="imaging_1_22_20\M1_1228";
for m=1:size(strdir,2)
valdir_name=strcat('G:\My Drive\',strdir(m),'\Anterior\');
svdir=strcat('G:\My Drive\',strdir(m),'\Binaries\');
zdat=dir(fullfile(valdir_name,'*.tif'));
for n=1:size(zdat,1)%give index of image to test (From the training_dictionary) otherwise change file path below
file=strcat(valdir_name,zdat(n).name);
image=imread(file);

filtered_image_lg=create_features(image);
filtered_image_lg=(filtered_image_lg - repmat(cPixelTrainingLarge.Pixel_Min,size(filtered_image_lg,1),1)); %baseline=0
filtered_image_lg=double(filtered_image_lg);
filtered_image_lg=filtered_image_lg*spdiags(1./(cPixelTrainingLarge.Pixel_Max-cPixelTrainingLarge.Pixel_Min)',0,size(filtered_image_lg,2),size(filtered_image_lg,2)); %normalize


tic
%%


% STEP 1:IDENTIFY LARGE OBJECTS
pred_adj = trainedModel.predictFcn(filtered_image_lg);toc %create scores for filtered image from trained SVM algorithm
;
predict_image=reshape(pred_adj,[size(image,1) size(image,2)]);toc %Reshape to image dimensions

%Post-Processing
se2=strel('disk',10);  
BW=edge(image,'Sobel');
BW2=imdilate(BW,se2);
pred2=predict_image&BW2;
pred3=bwareaopen(pred2,3);
pred3=imfill(pred3,'holes');
pred3=bwpropfilt(pred3,'Eccentricity',[0 0.95]); %Removes long objects, such as pharynx edges, that are mistakenly classified as objects
pred3=bwpropfilt(pred3,'Area',[5 1000]);
alg1=double(pred3);

filtered_image_sm=create_features(image);
filtered_image_sm=(filtered_image_sm - repmat(cPixelTrainingSmall.Pixel_Min,size(filtered_image_sm,1),1)); %baseline=0
filtered_image_sm=double(filtered_image_sm);
filtered_image_sm=filtered_image_sm*spdiags(1./(cPixelTrainingSmall.Pixel_Max-cPixelTrainingSmall.Pixel_Min)',0,size(filtered_image_sm,2),size(filtered_image_sm,2)); %normalize
[pred,score] = predict(MdlSm,filtered_image_sm);toc

pred_adj=double(score(:,2)>0.5); %set a score threshold to define the image binary
predict_image=reshape(pred_adj,[size(image,1) size(image,2)]);toc %Reshape to image dimensions

%Post-Processing
se2=strel('disk',10);  
BW=edge(image,'Sobel');
BW2=imdilate(BW,se2);
pred2=predict_image&BW2;

pred3=bwareaopen(pred2,3);
pred3=bwpropfilt(pred3,'Eccentricity',[0 0.95]);
pred3=bwpropfilt(pred3,'Area',[1 100]); %Remove objects smaller than a specified threshold
pred3=double(pred3);
alg2=pred3;



imbin=alg2|alg1;imbin=double(imbin);
imwrite(imbin,strcat(svdir,zdat(n).name));

end
end