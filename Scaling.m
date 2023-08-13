x=importdata('sample4.pgm');
m=size(x);

c=zeros(m(1),m(2));
x=double(x);
min=x(1,1);
max=x(1,1);
for i=1:m(1)
    for j=1:m(2)
        if x(i,j)<min
            min=x(i,j);
        end
        if x(i,j)>max
            max=x(i,j);
        end
    end
end

for i=1:m(1)
    for j=1:m(2)
        c(i,j)=255*((x(i,j)-min)/(max-min));
    end
end
c=uint8(c);

imwrite(c,"Scaled.pgm");