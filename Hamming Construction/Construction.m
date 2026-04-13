global n  k  x  g  G  H X C z;
n = 7;
k = 4;

A = [];
for i = 2: n-k
    A = [A unique(perms([ones(1,i) zeros(1,n-k-i)]),'rows')'];
end

H = [A eye(n-k)];
G = [eye(k) A'];

X = zeros(2^k,k);
C = zeros(2^k,n);
x = zeros(1,k);
g = zeros(n-k-1,2);
m = 0;
z = 1;
for i = 1 : n-k-1
    g(i,:)=[1+m m+nchoosek(n-k,i+1)];
    m = m+nchoosek(n-k,i+1);
end
encodegroup(n-k-1);
C = mod(X*G,2);
D = zeros(2^k,2^k);
for i = 1 : 2^k
    for j = 1 : 2^k
       D(i,j) = sum(mod(C(i,:)+C(j,:),2)); %pairwise distance of codewords captured in a 2^k-by-2^k matrix
    end
end