function pts = readPoints(image)
%returns the coord of the pixel clicked
pts = zeros(2,1);
imshow(image);   

hold on;          
[xi, yi, ~] = ginput(1);
pts(1,1) = xi;
pts(2,1) = yi;

end