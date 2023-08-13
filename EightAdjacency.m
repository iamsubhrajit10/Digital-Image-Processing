x=randi([0 1],6,6);
m=size(x);
x=imbinarize(x);
x
p1x=2
p1y=3

p2x=3
p2y=4

if((check8Adjacency(p1x,p1y,p2x,p2y))&& x(p1x,p1y)==x(p2x,p2y))
    fprintf("\n\tYes! 8 Adjacent!\n");
else
    fprintf("\n\tNo! Not 8 Adjacent!\n");
end
function[flag]=check8Adjacency(p1x,p1y,p2x,p2y)
    flag=false;
    if(check4Adjacency(p1x,p1y,p2x,p2y))
        flag=true;
    else
        flag=checkDiagonalAdjacency(p1x,p1y,p2x,p2y);
    end
end
function[flag]=checkDiagonalAdjacency(p1x,p1y,p2x,p2y)
    flag=false;
    if (p1x-1==p2x && p1y-1==p2y) || (p1x-1==p2x && p1y+1==p2y)|| (p1x+1==p2x && p1y-1==p2y)||(p1x+1==p2x && p1y+1==p2y)
           flag=true;
    end
end
function[flag]=check4Adjacency(p1x,p1y,p2x,p2y)
    flag=false;
    if ((p1x+1==p2x) || (p1x-1==p2x)) && p1y==p2y
        flag=true;
        return;
    end
    if((p1y+1==p2y) || (p1y-1==p2y)) && p1x==p2x
        flag=true;
    end
end