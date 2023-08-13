x=imread("Sample.pgm");
m=size(x);

h=zeros(1,256);
for i=1:m(1)
    for j=1:m(2)
        h(1,x(i,j)+1)=h(1,x(i,j)+1)+1;
    end
end
fprintf("\nUnnormalized Histogram:\n");
h
normHist=zeros(1,256);
for j=1:256
    normHist(1,j)=h(1,j)/(m(1)*m(2));
end
fprintf("\nNormalized Histogram:\n");
normHist
