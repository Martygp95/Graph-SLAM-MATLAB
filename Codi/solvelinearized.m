function dx = solvelinearized(A,r)

% dx = A\r;

p       = colamd(A);        % permutations or reordering

Ap      = A(:,p);           % reordered A

[d,R]   = qr(sparse(Ap),r); % QR decommposition of reordered A

dx(p,1) = -R\d;             % optimal update step by back-substitution

end