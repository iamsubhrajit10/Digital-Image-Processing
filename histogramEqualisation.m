x=imread("Sample.pgm");
m=size(x);

h=zeros(1,256);
for i=1:m(1)
    for j=1:m(2)
        h(1,x(i,j)+1)=h(1,x(i,j)+1)+1;
    end
end

normHist=zeros(1,256);
for j=1:256
    normHist(1,j)=h(1,j)/(m(1)*m(2));
end
cdf=zeros(1,256);
for i=1:256
    if i==1
        cdf(1,i)=normHist(1,i)*255;
    else
        cdf(1,i)=cdf(1,i-1)+normHist(1,i)*255;
    end
end
equalisedHist=round(cdf);

mapping=cat(1,[0:255],equalisedHist)
