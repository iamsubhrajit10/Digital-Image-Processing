x=imread("sample.pgm");
m=size(x);

x=double(x);

y=x;

for i=2:m(1)-1
    for j=2:m(2)-1
        sobelx=((-1)*x(i-1,j-1)+(-2)*x(i-1,j)+(-1)*x(i-1,j+1))+(x(i+1,j-1)+2*x(i+1,j)+x(i+1,j+1));
        sobely=((-1)*x(i-1,j-1)+(-2)*x(i,j-1)+(-1)*x(i+1,j-1))+(x(i-1,j+1)+2*x(i,j+1)+x(i+1,j+1));
        y(i,j)=((sobelx)^2+(sobely)^2)^0.5 ;
    end
end

y=uint8(y);
imshow(y)
imwrite(y,"Sobel.pgm");