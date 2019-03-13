factors{1+0} = struct(...
    'type' , 'pose',...
    'measurement', [0;0;0],...
    'covariance', diag([1e-8,1e-8,1e-8]),...
    'index',[0,0]);

factors{1+1} = struct(...
    'type' , 'motion',...
    'measurement', [1.0;0.0;-5*pi/180],... 
    'covariance', diag([1e-4,1e-4,(0.5*pi/180)*(0.5*pi/180)]),...
    'index',[0,1]);

% li diem que ens movem 1 m i 5 graus i li indiquem que aquest factor 2 està
% associat al link 0 i 1
%li diem que la covariança sera de 1cm en x, tb en y i mig grau també per
%l'angle

factors{1+2} = struct(...
   'type' , 'motion',...
    'measurement', [1.0;-0.1;-5*pi/180],... 
    'covariance', diag([1e-2,1e-2,(2*pi/180)*(2*pi/180)]),...
    'index',[1,2]);

factors{1+3} = struct(...
    'type' , 'lmk',...
    'measurement', [1.1;30*pi/180],... 
    'covariance', diag([1e-4;(5*pi/180)*(5*pi/180)]),...
    'index',[0,3]);
% li diem que el 3 esta a 40 graus i a 1.2 m del 0

factors{1+4} = struct(...
    'type' , 'lmk',...
    'measurement', [0.7;80*pi/180],... 
    'covariance', diag([1e-4;(5*pi/180)*(5*pi/180)]),...
    'index',[1,3]);


factors{1+5} = struct(...
    'type' , 'lmk',...
    'measurement', [1.4;25*pi/180],... 
    'covariance', diag([1e-4;(5*pi/180)*(5*pi/180)]),...
    'index',[1,4]);

factors{1+6} = struct(...
    'type' , 'lmk',...
    'measurement', [1.5;-60*pi/180],... 
    'covariance', diag([1e-4;(5*pi/180)*(5*pi/180)]),...
    'index',[0,5]);

factors{1+7} = struct(...
    'type' , 'lmk',...
    'measurement', [0.8;-90*pi/180],... 
    'covariance', diag([1e-4;(5*pi/180)*(5*pi/180)]),...
    'index',[1,5]);

factors{1+8} = struct(...
    'type' , 'lmk',...
    'measurement', [2.4;-15*pi/180],... 
    'covariance', diag([1e-4;(5*pi/180)*(5*pi/180)]),...
    'index',[0,6]);

factors{1+9} = struct(...
    'type' , 'lmk',...
    'measurement', [1.7;-25*pi/180],... 
    'covariance', diag([1e-4;(5*pi/180)*(5*pi/180)]),...
    'index',[1,6]);

factors{1+10} = struct(...
    'type' , 'lmk',...
    'measurement', [0.7;-45*pi/180],... 
    'covariance', diag([1e-4;(5*pi/180)*(5*pi/180)]),...
    'index',[2,6]);

states{1+0} = struct(...
    'type' , 'pose',...
    'range', [1,2,3],...
    'value', [0;0;0]);

states{1+1} = struct(...
    'type' , 'pose',...
    'range', [4,5,6],...
    'value', rand(3,1));

states{1+2} = struct(...
    'type' , 'pose',...
    'range', [7,8,9],...
    'value', rand(3,1));

states{1+3} = struct(...
    'type' , 'lmk',...
    'range', [10,11],...
    'value', rand(2,1));

states{1+4} = struct(...
    'type' , 'lmk',...
    'range', [12,13],...
    'value', rand(2,1));

states{1+5} = struct(...
    'type' , 'lmk',...
'range', [14,15],...
    'value', rand(2,1));

states{1+6} = struct(...
    'type' , 'lmk',...
    'range', [16,17],...
    'value', rand(2,1));


dx = ones(17,1)*1e6;
eps = 1e-3;

while norm(dx)> eps
        
[A,r] = buildproblem(states,factors);

dx = solvelinearized(A,r)
states = updatestates(states,dx);
drawmap(states,factors);

end


%dlmwrite('A.txt',A,'precision','%.1f', 'delimiter','\t')