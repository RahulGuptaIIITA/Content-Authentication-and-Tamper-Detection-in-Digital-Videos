function [ output_args ] = Untitled( input_args )

clear all; 
obj = VideoReader('dataset/5.mp4');

nFrames = obj.NumberOfFrames;

file_name='dataset/image.jpg';
message=imread(file_name);
message=double(message);
message=round(message./256);
message=uint8(message);
Mm=size(message,1);	        %Height
Nm=size(message,2);	
writerObj = VideoWriter('C:\Users\PJ\Documents\MATLAB\file3', 'MPEG-4');
open(writerObj);
%Width
for i = 1:nFrames - 1
file_name=read(obj,i);
cover_object=file_name;

Mc=size(cover_object,1);	%Height
Nc=size(cover_object,2);	%Width



for ii = 1:Mc
    for jj = 1:Nc
        watermark(ii,jj)=message(mod(ii,Mm)+1,mod(jj,Nm)+1);
        
    end
end


watermarked_image=cover_object;

for ii = 1:Mc
    for jj = 1:Nc
        watermarked_image(ii,jj)=bitset(watermarked_image(ii,jj),1,watermark(ii,jj));
        
    end
end


masterFrame = watermarked_image;
f = im2frame(masterFrame);
writeVideo(writerObj,f);
%figure,imshow(watermarked_image,[])
%title('Watermarked Image')

end
end

