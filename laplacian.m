x=imread("sample.pgm");
m=size(x);

x=double(x);

y=x;

for i=2:m(1)-1
    for j=2:m(2)-1
        y(i,j)=x(i-1,j)+x(i,j-1)+x(i,j+1)+x(i+1,j)-4*x(i,j);
    end
end

y=uint8(y);
imshow(y)
imwrite(y,"Laplacian.pgm");