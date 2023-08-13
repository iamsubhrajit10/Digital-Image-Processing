image=imread("sample2.pgm");
m=size(image);
zero_padded_image=padarray(double(image),[1 1],0);
zero_padded_min_image=image;

for i=2:m(1)
    for j=2:m(2)
        arr=[zero_padded_image(i-1,j) zero_padded_image(i+1,j) zero_padded_image(i,j-1) zero_padded_image(i,j+1) zero_padded_image(i-1,j-1) zero_padded_image(i+1,j+1) zero_padded_image(i+1,j-1) zero_padded_image(i-1,j+1) zero_padded_image(i,j)];
        zero_padded_min_image(i-1,j-1)=min(arr);        
    end
end
zero_padded_image=uint8(zero_padded_image);
zero_padded_min_image=uint8(zero_padded_min_image);
imwrite(zero_padded_min_image,"zero_padded_min_image.pgm");

replicate_padded_image=padarray(double(image),[1 1],'replicate');
replicate_padded_max_image=image;

for i=2:m(1)
    for j=2:m(2)
        arr=[replicate_padded_image(i-1,j) replicate_padded_image(i+1,j) replicate_padded_image(i,j-1) replicate_padded_image(i,j+1) replicate_padded_image(i-1,j-1) replicate_padded_image(i+1,j+1) replicate_padded_image(i+1,j-1) replicate_padded_image(i-1,j+1) replicate_padded_image(i,j)];
        replicate_padded_max_image(i-1,j-1)=max(arr);
      
    end
end
replicate_padded_max_image=uint8(replicate_padded_max_image);
imwrite(replicate_padded_max_image,"replicate_padded_max_image.pgm");


mirror_padded_image=padarray(double(image),[1 1],'symmetric');
mirror_padded_median_image=image;

for i=2:m(1)
    for j=2:m(2)
        arr=[mirror_padded_image(i-1,j) mirror_padded_image(i+1,j) mirror_padded_image(i,j-1) mirror_padded_image(i,j+1) mirror_padded_image(i-1,j-1) mirror_padded_image(i+1,j+1) mirror_padded_image(i+1,j-1) mirror_padded_image(i-1,j+1) mirror_padded_image(i,j)];
        mirror_padded_median_image(i-1,j-1)=median(arr);
    end
end
mirror_padded_median_image=uint8(mirror_padded_median_image);
imwrite(mirror_padded_median_image,"mirror_padded_median_image.pgm");

