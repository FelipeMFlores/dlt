function Q2()

%mundo
a = [0 0; 16.5 16.5 ; -23.8 16.5 ; -3.66 11; 5.5 5.5 ; -12.8 5.5; 5.5 0; 16.5 0];
a = [a ones(8, 1)];
%imagem
b = [588 121; 269 63; 267 239; 377 135; 475 102; 509 179; 574 103; 551 61];
b = [b ones(8, 1)];

I = imread('maracana2.jpg');
imshow(I);
hold on;
while true
    [xi, yi, ~] = ginput(1);

    %pega posição no mundo do jogador
    d = dlt(b, a);
    p = convCoord(d, [xi; yi]);
    %define dois pontos que pertecem a linha 
    l = [p(1)+50 p(2); p(1)-50 p(2)];
    %transforma eles pra coord da imagem
    d = dlt(a, b);
    p1 = convCoord(d, l(1,:)');
    p2 = convCoord(d, l(2,:)');
    x = [p1(1) p2(1)];
    y= [p1(2) p2(2)];
    %desenha
    line(x,y,'Color','r','LineWidth',1);

end
end
