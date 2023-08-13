x=imread("Sample.pgm");
m=size(x);

sum=zeros(m(1),m(2));

for i=1:m(1)
    for j=1:m(2)
        sum(i,j)=x(i,j)+20;
        if sum(i,j)>255
            sum(i,j)=255;
        end
    end
end
sum=uint8(sum);

imwrite(sum,"SumImage.pgm");