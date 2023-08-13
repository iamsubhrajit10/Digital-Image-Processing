x=imread('sample.pgm');
m=size(x);
x=double(x);

b8=zeros(m(1),m(2));

for i=1:m(1)
    for j=1:m(2)
        if mod(floor(double(x(i,j))/(2^7)),2)==0
            b8(i,j)=0;
        else
             b8(i,j)=128;
        end
    end
end
% b8=imbinarize(b8);

b7=zeros(m(1),m(2));
for i=1:m(1)
    for j=1:m(2)
        if mod(floor(double(x(i,j))/(2^6)),2)==0
            b7(i,j)=0;
        else
             b7(i,j)=64;
        end
    end
end
% b7=imbinarize(b7);

b6=zeros(m(1),m(2));
for i=1:m(1)
    for j=1:m(2)
        if mod(floor(double(x(i,j))/(2^5)),2)==0
            b6(i,j)=0;
        else
             b6(i,j)=32;
        end
    end
end
% b6=imbinarize(b6);

b5=zeros(m(1),m(2));
for i=1:m(1)
    for j=1:m(2)
        if mod(floor(double(x(i,j))/(2^4)),2)==0
            b5(i,j)=0;
        else
             b5(i,j)=16;
        end
    end
end
% b5=imbinarize(b5);

b4=zeros(m(1),m(2));
for i=1:m(1)
    for j=1:m(2)
        if mod(floor(double(x(i,j))/(2^3)),2)==0
            b4(i,j)=0;
        else
             b4(i,j)=8;
        end
    end
end
% b4=imbinarize(b4);

b3=zeros(m(1),m(2));
for i=1:m(1)
    for j=1:m(2)
        if mod(floor(double(x(i,j))/(2^2)),2)==0
            b3(i,j)=0;
        else
             b3(i,j)=4;
        end
    end
end
% b3=imbinarize(b3);

b2=zeros(m(1),m(2));
for i=1:m(1)
    for j=1:m(2)
        if mod(floor(double(x(i,j))/(2^1)),2)==0
            b2(i,j)=0;
        else
             b2(i,j)=2;
        end
    end
end

% b2=imbinarize(b2);
b1=zeros(m(1),m(2));
for i=1:m(1)
    for j=1:m(2)
        if mod(floor(double(x(i,j))),2)==0
            b1(i,j)=0;
        else
             b1(i,j)=1;
        end
    end
end
% b1=imbinarize(b1);



subplot(3,4,1),imshow(uint8(x)),title('original image');
subplot(3,4,2),imshow(b8),title('bit plane 8');
subplot(3,4,3),imshow(b7),title('bit plane 7');
subplot(3,4,4),imshow(b6),title('bit plane 6');
subplot(3,4,5),imshow(b5),title('bit plane 5');
subplot(3,4,6),imshow(b4),title('bit plane 4');
subplot(3,4,7),imshow(b3),title('bit plane 3');
subplot(3,4,8),imshow(b2),title('bit plane 2');
subplot(3,4,9),imshow(b1),title('bit plane 1');

revert=zeros(m(1),m(2));
for i=1:m(1)
    for j=1:m(2)
        revert(i,j)=b8(i,j)+b7(i,j)+b6(i,j)+b5(i,j)+b4(i,j)+b3(i,j)+b2(i,j)+b1(i,j);
    end
end

o=revert;
revert=uint8(o);

subplot(3,4,10),imshow(revert),title('Reverted Image');