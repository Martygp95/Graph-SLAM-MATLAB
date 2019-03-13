function  [y, J_y_rob, J_y_lmk] =  observe(rob, lmk)

%tenim un punt en cartesià i el volem sobre un altre frame polar
%primer canviem el frame (que és cartesià) i després ho passem a polar

[lmkrob, J_lmkrob_rob, J_lmkrob_lmk] = toframe2D(rob,lmk);
[y,J_y_lmkrob] = c2p(lmkrob);


J_y_rob = J_y_lmkrob * J_lmkrob_rob;
J_y_lmk = J_y_lmkrob * J_lmkrob_lmk;


end

function f()
%%
syms x y th px py real
r = [x;y;th];
p = [px;py];

[yy, J_yy_r, J_yy_p] = observe(r,p)

simplify(jacobian(yy,r) - J_yy_r)
simplify(jacobian(yy,p) - J_yy_p)

end