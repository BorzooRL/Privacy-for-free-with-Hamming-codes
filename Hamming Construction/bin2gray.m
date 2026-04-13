function g = bin2gray(b)
g(1) = b(1);
for i = 2 : length(b);
    g(i) = xor(b(i-1), b(i));
end