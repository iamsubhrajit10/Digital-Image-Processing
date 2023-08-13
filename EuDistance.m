x=imread("sample.pgm");
m=size(x);

x=imbinarize(x);
p1x=randi([1 m(1)],1,1);
p1y=randi([1 m(2)],1,1);

p2x=randi([1 m(1)],1,1);
p2y=randi([1 m(2)],1,1);

fprintf("\nPixel 1 : (x,y): (%d,%d) ",p1x,p1y);
fprintf("\nPixel 2 : (x,y): (%d,%d) ",p2x,p2y);

euDistance=findEuclidianDistance(p1x,p1y,p2x,p2y);

fprintf("\nEuclidian Distance between the pixels is: %f\n",euDistance);

function[euDistance]=findEuclidianDistance(p1x,p1y,p2x,p2y)
    euDistance=((p1x-p2x)^2+(p1y-p2y)^2)^0.5;
end