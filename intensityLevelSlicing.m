x=imread("sample.pgm");
m=size(x);
sum=0;
for i=1:m(1)
    for j=1:m(2)
        sum=sum+x(i,j);
    end
end
average=sum/(m(1)*m(2));
y=x;
for i=1:m(1)
    for j=1:m(2)
        if x(i,j)>=(average-20) && x(i,j)<=average+20
            y(i,j)=average+100;
        end
    end
end

subplot(1,2,1),imshow(x);
subplot(1,2,2),imshow(y);