function out = Grayupdate(x)
n = 2^length(x);
b = gray2bin(x);
s=dec2bin(mod(bin2dec(num2str(b))+1,n),length(x));
out = bin2gray(str2num(s(:))'); %Next Gray