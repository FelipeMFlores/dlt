function A = dlt2(a, b)

[n,k ] = size(a);
[m,ky] = size(b);

% dimensionality check
assert(k == ky);

A = zeros(k*2, 12);
line = 1;
for i = 1:k
    x = a(1,i);
    y = a(2,i);
    z = a(3,i);
    u = b(1,i);
    v = b(2,i);
    A(line,:) = [x y z 1 0 0 0 0 -u*x -u*y -u*z -u];
    line = line+1;
    A(line,:) = [0 0 0 0 x y z 1 -v*x -v*y -v*z -v] ;   
    line = line+1;
end


[~,~,V] = svd(A);
A = V(end, :) ./ V(end);
A = reshape(A,3, 4);