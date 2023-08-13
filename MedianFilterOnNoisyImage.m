image=imread("sample3.pgm");
m=size(image);
image=double(image);
noisy_image=image+generateNoiseMatrix(m);

mirror_padded_image=padarray(noisy_image,[1 1],'symmetric');
mirror_padded_median_image=noisy_image;

for i=2:m(1)
    for j=2:m(2)
        arr=[mirror_padded_image(i-1,j) mirror_padded_image(i+1,j) mirror_padded_image(i,j-1) mirror_padded_image(i,j+1) mirror_padded_image(i-1,j-1) mirror_padded_image(i+1,j+1) mirror_padded_image(i+1,j-1) mirror_padded_image(i-1,j+1) mirror_padded_image(i,j)];
        mirror_padded_median_image(i-1,j-1)=median(arr);
    end
end
mirror_padded_median_image=uint8(mirror_padded_median_image);
imwrite(mirror_padded_median_image,"mirror_padded_median_imageNoisy.pgm");


subplot(2,2,1),imshow(uint8(image)),title('Original Image');
subplot(2,2,2),imshow(uint8(noisy_image)),title('Noisy Image');
subplot(2,2,3),imshow(mirror_padded_median_image),title('Median-Filter-On-Noisy-Image');



function[noise_matrix]=generateNoiseMatrix(m)
    noise_matrix=randi([-50 50],m(1),m(2));
    noise_matrix=noise_matrix-round(mean(noise_matrix(:)));
end