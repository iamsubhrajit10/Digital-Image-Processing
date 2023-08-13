x=imread("Sample.pgm");
m=size(x);

final=zeros(m(1),m(2));
sum=0;
for i=2:m(1)-1
    for j=2:m(2)-1
        sum=x(i-1,j)+x(i+1,j)+x(i,j-1)+x(i,j+1)+x(i-1,j-1)+x(i+1,j+1)+x(i+1,j-1)+x(i-1,j+1);
        final(i,j)=sum/8;
    end
end
final=uint8(final);

imwrite(final,"8NeighbourAverage.pgm");