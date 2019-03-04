function [e, J_e_rob] = error_pose(rob, y)
% in
% ROB:ROBOT POSE
% y:MEASURED POSE
% OUT
% E:ESTIMATION ERROR
% J_e_rob : JACOBIAN OF E WRT. ROBOT POSE

e = rob-y

while e(3) > pi
    e(3) = e -2*pi;
end 
                
while e(3) < -pi
    e(3) = e +2*pi;
end  
       
J_e_rob = eye(3);


end