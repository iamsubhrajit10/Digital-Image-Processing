image=imread("sample2.pgm");
m=size(image);
zero_padded_image=padarray(double(image),[1 1],0);
zero_padded_smooth_image=image;

for i=2:m(1)
    for j=2:m(2)
        sum=2*zero_padded_image(i-1,j)+2*zero_padded_image(i+1,j)+2*zero_padded_image(i,j-1)+2*zero_padded_image(i,j+1)+zero_padded_image(i-1,j-1)+zero_padded_image(i+1,j+1)+zero_padded_image(i+1,j-1)+zero_padded_image(i-1,j+1)+4*zero_padded_image(i,j);
        zero_padded_smooth_image(i-1,j-1)=sum/16;
    end
end
zero_padded_image=uint8(zero_padded_image);
zero_padded_smooth_image=uint8(zero_padded_smooth_image);
imwrite(zero_padded_smooth_image,"gaussian_zero_padded_smooth_image.pgm");

replicate_padded_image=padarray(double(image),[1 1],'replicate');
replicate_padded_smooth_image=image;

for i=2:m(1)
    for j=2:m(2)
        sum=2*replicate_padded_image(i-1,j)+2*replicate_padded_image(i+1,j)+2*replicate_padded_image(i,j-1)+2*replicate_padded_image(i,j+1)+replicate_padded_image(i-1,j-1)+replicate_padded_image(i+1,j+1)+replicate_padded_image(i+1,j-1)+replicate_padded_image(i-1,j+1)+4*replicate_padded_image(i,j);
        replicate_padded_smooth_image(i-1,j-1)=sum/16;
    end
end
replicate_padded_smooth_image=uint8(replicate_padded_smooth_image);
imwrite(replicate_padded_smooth_image,"gaussian_replicate_padded_smooth_image.pgm");


mirror_padded_image=padarray(double(image),[1 1],'symmetric');
mirror_padded_smooth_image=image;

for i=2:m(1)
    for j=2:m(2)
        sum=2*mirror_padded_image(i-1,j)+2*mirror_padded_image(i+1,j)+2*mirror_padded_image(i,j-1)+2*mirror_padded_image(i,j+1)+mirror_padded_image(i-1,j-1)+mirror_padded_image(i+1,j+1)+mirror_padded_image(i+1,j-1)+mirror_padded_image(i-1,j+1)+4*mirror_padded_image(i,j);
        mirror_padded_smooth_image(i-1,j-1)=sum/16;
    end
end
mirror_padded_smooth_image=uint8(mirror_padded_smooth_image);
imwrite(mirror_padded_smooth_image,"gaussian_mirror_padded_smooth_image.pgm");

