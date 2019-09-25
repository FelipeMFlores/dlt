function P = dlt(x, y)
% x = pontos no mundo 3d (k linhas e m colunas)
% y = pontos correspondentes na imagem (k linhas e n colunas)

m = size(x, 2);
n = size(y, 2);
k = size(x, 1);

h = 1;
A = zeros(2*k, 12);
for i = 1:k
    A(h,:) = [  x(i,1) x(i,2) x(i,3) 1 0 0 0 0 ...
                -y(i,1)*x(i,1) -y(i,1)*x(i,2) -y(i,1)*x(i,3) -y(i,1)    ];
    A(h+1,:) = [0 0 0 0 x(i,1) x(i,2) x(i,3) 1 ...
                -y(i,2)*x(i,1) -y(i,2)*x(i,2) -y(i,2)*x(i,3) -y(i,2)    ];
            
    h = h+2;
end

[~, ~, V] = svd(A'*A);
Pt = reshape(V(:,end),m,n);
P = Pt';

end