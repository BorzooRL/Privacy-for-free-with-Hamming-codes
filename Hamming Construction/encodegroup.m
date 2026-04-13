function encodegroup(i)
global n  k  x  g  G  H X C z;
 if i>= 2
    for r = 1 : 2^(nchoosek(n-k,i+1))
        encodegroup(i-1);
        u = find(mod(x([g(i,1) : g(i,2)])+Grayupdate(x([g(i,1) : g(i,2)])),2)==1)+g(i,1)-1; %index of the modified bit
        x([g(i,1) : g(i,2)])=Grayupdate(x([g(i,1) : g(i,2)]));
        v = find(sum(mod(H(:,[g(i-1,1):g(i-1,2)])+H(:,u),2))==1,1);
        x(v+g(i-1,1)-1)=~x(v+g(i-1,1)-1);
    end
 else
     for q = 1:2^(nchoosek(n-k,2))-1 
         X(z,:) = x;
         z = z + 1;
         x([g(1,1) : g(1,2)])=Grayupdate(x([g(1,1) : g(1,2)]));
     end
         X(z,:) = x;
         z = z + 1;
 end