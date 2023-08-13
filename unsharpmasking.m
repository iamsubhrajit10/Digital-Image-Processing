image=imread("sample.pgm");
m=size(image);
zero_padded_image=padarray(double(image),[1 1],0);
zero_padded_smooth_image=image;

for i=2:m(1)
    for j=2:m(2)
        sum=zero_padded_image(i-1,j)+zero_padded_image(i+1,j)+zero_padded_image(i,j-1)+zero_padded_image(i,j+1)+zero_padded_image(i-1,j-1)+zero_padded_image(i+1,j+1)+zero_padded_image(i+1,j-1)+zero_padded_image(i-1,j+1)+zero_padded_image(i,j);
        zero_padded_smooth_image(i-1,j-1)=sum/9;
    end
end

mask=image-zero_padded_smooth_image;


sharpenedImage=image+mask;
sharpenedImage=uint8(sharpenedImage);

subplot(2,2,1),imshow(image),title('Original Image');
subplot(2,2,2),imshow(zero_padded_smooth_image),title('Blurred Image');
subplot(2,2,3),imshow(mask),title('Unsharp Mask');
subplot(2,2,4),imshow(sharpenedImage),title('Sharpened Image');