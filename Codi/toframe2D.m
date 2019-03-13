function [pf,J_pf_f,J_pf_p] = toframe2D(F,p)

T = [F(1);F(2)]; %coordenades punt
th = F(3); %angle

R = [cos(th) -sin(th); sin(th) cos(th)];

pf = R'*(p-T); %coordenades globals a coordenades locals

px = p(1);
py = p(2);
x = T(1);
y = T(2);

J_pf_f = [...
[ -cos(th), -sin(th),   cos(th)*(py - y) - sin(th)*(px - x)]
[  sin(th), -cos(th), - cos(th)*(px - x) - sin(th)*(py - y)]
];

J_pf_p = [...
[cos(th), sin(th)]
[-sin(th), cos(th)]
];
end

function f()
%%
syms x y th px py real

F = [x;y;th];
p = [px;py];

pf = toframe2D(F,p);

J_pf_f = simplify(jacobian(pf,F))
J_pf_p = simplify(jacobian(pf,p))
end