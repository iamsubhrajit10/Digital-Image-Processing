x=imread('sample.pgm');
m=size(x);
x=double(x);


p=zeros(m(1),m(2));
for i=1:m(1)
    for j=1:m(2)
        p(i,j)=1*(x(i,j)^0.8);
    end
end

p=uint8(p);
imwrite(p,"Gamma.pgm");