function [p,J_p_c] = c2p(c)

x = c(1);
y = c(2);

d = sqrt(x*x + y*y);
a = atan2(y,x);

p = [d;a];


J_p_c = [...
[ x/(x^2 + y^2)^(1/2), y/(x^2 + y^2)^(1/2)]
[      -y/(x^2 + y^2),       x/(x^2 + y^2)]
];
end

function f()
%%
syms x y real
c = [x;y];
p = c2p(c);
J_p_c = simplify(jacobian(p,c))

end
