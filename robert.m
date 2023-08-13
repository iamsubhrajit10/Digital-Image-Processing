x=imread("sample.pgm");
m=size(x);

x=double(x);

y=x;

for i=2:m(1)-1
    for j=2:m(2)-1
        robertx=(-1)*x(i-1,j-1)+x(i,j);
        roberty=(-1)*x(i-1,j)+x(i,j-1);
        y(i,j)=((robertx)^2+(roberty)^2)^0.5 ;
    end
end

y=uint8(y);
imshow(y)
imwrite(y,"robert.pgm");