function Q1()
I = imread('maracana1.jpg');

x = [ 0 0 0 1; 7.32 0 0 1; 0 0 2.44 1; 7.32 0 2.44 1;
      -5.5 0 0 1; -5.5 -5.5 0 1; 12.82 0 0 1; 12.82 -5.5 0 1;
      23.82 0 0 1; -16.5 0 0 1; -16.5 -16.5 0 1];
y = [ 125 158 1; 160 140 1; 125 127 1; 160 111 1;
      97 172 1; 160 176 1; 184 128 1; 241 132 1;
      230 106 1; 32 205 1; 250 222 1];

P = dlt(x,y);
Pinv = [P(1,1) P(1,2) P(1,4);
        P(2,1) P(2,2) P(2,4);
        P(3,1) P(3,2) P(3,4)];

while true    
    imshow(I);
    fpos_img = [ginput(1) 1]';

    fpos_w2d = Pinv\fpos_img;
    fpos_w2d = fpos_w2d/fpos_w2d(3,1);
    fpos_w3d = [fpos_w2d(1,1); fpos_w2d(2,1); 0; 1];
    hpos_w3d = [fpos_w3d(1,1); fpos_w3d(2,1); 1.8; 1];

    hpos_img = P*hpos_w3d;
    hpos_img = hpos_img/hpos_img(3,1);
    hpos_img = round(hpos_img);

    I(hpos_img(2,1), hpos_img(1,1),:) = 255;
    I(fpos_img(2,1), fpos_img(1,1),:) = 255;
    
    h = round((hpos_img(1,1)+fpos_img(1,1))/2);
    for i=hpos_img(2,1):fpos_img(2,1)
        I(i,h,:) = 255;
    end
    
    imshow(I);
end
end