x1=imread("sample.pgm");
m=size(x1);

x2=imread("sample2.pgm");
n=size(x2);
x1=imbinarize(x1);
x2=imbinarize(x2);
if m(1)>n(1)
    m1=n(1);
else
    m1=m(1);
end
if m(2)>n(2)
    n1=n(2);
else
    n1=m(2);
end

orImg=zeros(m1,n1);


for i=1:m1
    for j=1:n1
        orImg(i,j)=or(x1(i,j),x2(i,j));
        
    end
end

for i=1:m1
    for j=1:n1
        if(orImg(i,j)==1)
            orImg(i,j)=255;
        end
    end
end
% orImg=uint8(orImg);
imshow(orImg)

imwrite(orImg,"orImage.pgm");