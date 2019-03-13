function [e, J_e_rob1, J_e_rob2] = error_move(rob1, rob2, drob)
%expected measurement
%rob1: pose robot at time 1
%rob2: pose of robot at time 2
%drob : motion measurement between times 1 and 2
%out
% e: expected motion error
% J_e_rob1: Jacobian of wrt. rob1
% J_e_rob2: Jacobian of wrt. rob2
[drobexp, J_drobexp_rob1, J_drobexp_rob2] = between(rob1, rob2);
%expectation error
e = drobexp - drob;
J_e_robexp = eye(3);
%chan rule
J_e_rob1 = J_e_robexp * J_drobexp_rob1;
J_e_rob2 = J_e_robexp * J_drobexp_rob2;
end