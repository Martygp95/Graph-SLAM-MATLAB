function [dx] = solvelinearized(A,r)
%dx = A\r; així es fa tot d'una

p = colamd(A,r)
Ap = A(p);

[d,R] = qr(Ap,r);

dx = -R\d;
end