n = 7;
k = 4;

A = [];
for i = n-k: -1: 2
    A = [A unique(perms([ones(1,i) zeros(1,n-k-i)]),'rows')'];
end

H = [A eye(n-k)];
p = bin2dec(num2str(H'))';
G = zeros(k,n);
for i = 1 : k
    hat_i = n - k + 1 - find(H(:,i)==1,1);
    a = p(i)-2^(hat_i-1);
    G(i,[i n-hat_i+1 find(p==a)])=1;
end
X = zeros(2^k,k);
C = zeros(2^k,n);
for i = 1 : 2^k
    a = dec2bin(i-1,k);
    X(i,:) = bin2gray(str2num(a(:))');
end

C = mod(X*G,2);
D = zeros(2^k,2^k);
for i = 1 : 2^k
    for j = 1 : 2^k
       D(i,j) = sum(mod(C(i,:)+C(j,:),2)); %pairwise distance of codewords captured in a 2^k-by-2^k matrix
    end
end