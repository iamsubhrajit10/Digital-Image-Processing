x=randi([0 1],6,6);
x(1,4)=1;
x(2,5)=1;
x(2,4)=0;
x(1,5)=0;
m=size(x);
x=imbinarize(x);
x
p1x=1
p1y=4

p2x=2
p2y=5

if((checkMAdjacency(p1x,p1y,p2x,p2y,x)))
    fprintf("\n\tYes! M Adjacent!\n");
else
    fprintf("\n\tNo! Not M Adjacent!\n");
end
function[flag]=checkMAdjacency(p1x,p1y,p2x,p2y,x)
    flag=false;
    m=size(x);
    if(check4Adjacency(p1x,p1y,p2x,p2y)&& x(p1x,p1y)==x(p2x,p2y))
        flag=true;
        return;
    else
        if(checkDiagonalAdjacency(p1x,p1y,p2x,p2y)&& x(p1x,p1y)==x(p2x,p2y))          
                p1Neighbours=getFourNeighbours(p1x,p1y)
                p2Neighbours=getFourNeighbours(p2x,p2y)
                for i=1:4
                    if ~isnan(p1Neighbours(i,1)) &&~isnan(p1Neighbours(i,2)) && x(p1Neighbours(i,1),p1Neighbours(i,2))==x(p1x,p1y)
                        for j=1:4
                            if ~isnan(p2Neighbours(j,1))&&~isnan(p2Neighbours(j,2))&&p1Neighbours(i,1)==p2Neighbours(j,1) && p1Neighbours(i,2)==p2Neighbours(j,2)
                                'ok'
                                flag=false;
                                return;
                            end
                        end
                    end
                end
                 flag=true;

        else
            flag=false;
        end
    end
end

function[neighbours]=getFourNeighbours(p1x,p1y)
    neighbours=zeros(4,2);
    neighbours(1,1)=p1x;
    neighbours(1,2)=p1y-1;
    neighbours(2,1)=p1x;
    neighbours(2,2)=p1y+1;
    neighbours(3,1)=p1x-1;
    neighbours(3,2)=p1y;
    neighbours(4,1)=p1x+1;
    neighbours(4,2)=p1y;
    for i=1:4
        for j=1:2
            if neighbours(i,j)<1
                neighbours(i,j)=NaN;
            end
        end
    end
%     neighbours=sort(neighbours);
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