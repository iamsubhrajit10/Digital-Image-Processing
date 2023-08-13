x=imread("sample2.pgm");
% x=imresize(x,[500 500]);
m=size(x)

x=double(x);
 for n=1:10
    filename = strcat('noise-', num2str(n), '.pgm');
    noisy_image=x+generateNoiseMatrix(m);
    imwrite(uint8(noisy_image),filename);
    smooth_image=generateSmoothMatrix(noisy_image,m);
    smooth_image=uint8(smooth_image);
    filename = strcat('smooth-', num2str(n), '.pgm');
    imwrite(smooth_image,filename);
 end
    
 
 function[smooth_image]=generateSmoothMatrix(noisy_image,m)
    noisy_image=double(noisy_image);
     smooth_image = noisy_image;
    for i=2:m(1)-1
        for j=2:m(2)-1
            sum=2*noisy_image(i-1,j)+2*noisy_image(i+1,j)+2*noisy_image(i,j-1)+2*noisy_image(i,j+1)+noisy_image(i-1,j-1)+noisy_image(i+1,j+1)+noisy_image(i+1,j-1)+noisy_image(i-1,j+1)+4*noisy_image(i,j);
            smooth_image(i,j)=sum/16;
        end
    end
 end
    

function[noise_matrix]=generateNoiseMatrix(m)
    noise_matrix=randi([-50 50],m(1),m(2));
    noise_matrix=noise_matrix-round(mean(noise_matrix(:)));
end