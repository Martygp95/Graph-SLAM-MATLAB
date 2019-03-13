function [e, J_e_rob, J_e_lmk] = error_observe(rob,lmk,y)

%W: information matrix of measurement (2x2 matrix)%W: information matrix of measurement (2x2 matrix)
%in:
% rob: robot pose (x,y,th)
%lmk: landmark position (px,py)
%y: polar measurement (d,a)
%e = error measurement
%J_e_rob: Jacobian of error wrt. robot pose
%J_e_lmk: Jacobian of errorwrt. landmark position (2x2 matrix)

[h, J_h_rob, J_h_lmk] = observe(rob,lmk);

e = h-y; 
J_e_h = 1;
%J_e_y = -1;

J_e_rob = J_e_h * J_h_rob;
J_e_lmk = J_e_h * J_h_lmk;

%J_e_y = J_e_h * J_h_y;

end