function b = gray2bin(g)
b(1) = g(1);
for i = 2 : length(g);
    b(i) = xor(b(i-1), g(i));
end