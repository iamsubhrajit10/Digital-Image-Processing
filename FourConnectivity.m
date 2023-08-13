x=randi([1 1],3,3);
p1x=1;
p1y=1;
p2x=1;
p2y=2;
x
check4Connectivity(x,p1x,p1y,p2x,p2y)
function[flag]=check4Connectivity(x,p1x,p1y,p2x,p2y)
    flag=false;
    if (p1x>=1 && p1x<=3) && (p1y>=1 && p1y<=3)
        if x(p2x,p2y)~=x(p1x,p1y)
            return
        end
        if p1x==p2x && p1y==p2y
            flag=true;
            return
        else
            if(check4Connectivity(x,p1x+1,p1y,p2x,p2y))
                'ok1'
                return
            end
            if check4Connectivity(x,p1x,p1y+1,p2x,p2y)
                'ok2'
                return
            end
            if check4Connectivity(x,p1x,p1y-1,p2x,p2y)
                'ok3'
                return
            end
            if check4Connectivity(x,p1x,p1y+1,p2x,p2y)
                'ok4'
                return;
            end
        end
    end
end
