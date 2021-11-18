directory_name='G:\Shared drives\SanMiguelLab\RawData\Danny\imaging_1_22\M1_1218\Anterior\';
z=dir(fullfile(directory_name,'*.tif'));
svdir='G:\Shared drives\SanMiguelLab\RawData\Danny\imaging_1_22\M1_1218\Anterior 2\';
%%
for i=1:size(z,1)
file=fullfile(directory_name,z(i).name);
image=imread(file);
image=image/2;
% image=imresize(image,0.635);
imwrite(image,strcat(svdir,z(i).name));
end