function R = convCoord(d, a)
%d = dlt result
%a = coord to convert
n = size(a);
assert(n(2) == 1)
a = [a; 1];
r = d * a;

n = n(1);
R = r ./ r(end);
R = R(1:n);
