x=randi([0 1],8,8);
m=size(x);

x=imbinarize(x);
p1x=randi([1 m(1)],1,1);
p1y=randi([1 m(2)],1,1);

p2x=randi([1 m(1)],1,1);
p2y=randi([1 m(2)],1,1);

fprintf("\nPixel 1 : (x,y): (%d,%d) ",p1x,p1y);
fprintf("\nPixel 2 : (x,y): (%d,%d) ",p2x,p2y);

d8Distance=findD8Distance(p1x,p1y,p2x,p2y);

fprintf("\nD8 Distance between the pixels is: %f\n",d8Distance);

function[d8Distance]=findD8Distance(p1x,p1y,p2x,p2y)
    d8Distance=max(abs(p1x-p2x),abs(p1y-p2y));
end