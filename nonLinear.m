x=imread("Sample.pgm");
m=size(x);

max=zeros(m(1),m(2));
f1=zeros(m(1),m(2));
f2=zeros(m(1),m(2));
a=randi([0 5],1,1);
b=randi([0 5],1,1);
x=double(x);
for i=1:m(1)
    for j=1:m(2)
        f1(i,j)=a*x(i,j);
    end
end
for i=1:m(1)
    for j=1:m(2)
        f2(i,j)=b*x(i,j);
    end
end
% f1=uint8(f1);
% f2=uint8(f2);
% f1=scale(f1);
% f2=scale(f2);

for i=1:m(1)
    for j=1:m(2)
        if f1(i,j)>f2(i,j)
            max(i,j)=f1(i,j);
        else
            max(i,j)=f2(i,j);
        end
    end
end
max=uint8(max);

imwrite(max,"MaxImage.pgm");

