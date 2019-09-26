function pts = readPoints(image, np)
%returns the coord of the pixel clicked
pts = zeros(np, 2);
imshow(image);   

hold on;  
for i = 1: np
    [xi, yi, ~] = ginput(1);
    pts(i,1) = xi;
    pts(i,2) = yi;
end
end