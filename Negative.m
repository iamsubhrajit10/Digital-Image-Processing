x=importdata('sample.pgm');

m=size(x);
neg=zeros(m(1),m(2));
size(neg);
for i=1:m(1)
    for j=1:m(2)
        neg(i,j)=255-x(i,j);
    end
end
neg=uint8(neg);
imwrite(neg,"Negative.pgm");