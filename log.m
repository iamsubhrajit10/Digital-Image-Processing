x=imread('sample.pgm');
m=size(x);
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

s=zeros(m(1),m(2));
for i=1:m(1)
    for j=1:m(2)
        s(i,j)=(255/(log(1+max)))*log((1+x(i,j)));
    end
end
s=uint8(s);

imwrite(s,"Log.pgm");