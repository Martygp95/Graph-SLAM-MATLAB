function [A,r] = buildproblem(states,factors)

K = numel(factors); %quantitat de fators que tenim

A = zeros(25,17);
r = zeros(25,1);
numrows = 1;

for k = 1:1:K
    
   W = inv(factors{k}.covariance); %matriu d'informació de cada factor
   y= factors{k}.measurement;
   Wt2 = chol(W,'upper');
   
   switch(factors{k}.type)
   
       case 'motion' %calulem l'error de moviment
           
            i = factors{k}.index(1);
            j = factors{k}.index(2);
            rob1 = states{1+i};
            rob2 = states{1+j};
   
            [e, J_e_rob1, J_e_rob2] = error_move(rob1.value,rob2.value,y); 
           
            rows = numrows:(numrows + numel(y)-1);
   
            r(rows) = Wt2*e;

            A(rows, rob1.range) = Wt2*J_e_rob1;
            A(rows, rob2.range) = Wt2*J_e_rob2;
            
       case 'lmk' %calculem error per a cada mesura
           
            i = factors{k}.index(1);
            j = factors{k}.index(2);
                
           rob = states{1+i};
           lmk = states{1+j};
    
           [e, J_e_rob, J_e_lmk] = error_observe(rob.value,lmk.value,y); 
        
           rows = numrows:(numrows + numel(y)-1);
            
           r(rows) = Wt2*e;
          
           A(rows, rob.range) = Wt2*J_e_rob;
           A(rows, lmk.range) = Wt2*J_e_lmk;
           
       case  'pose'
           
           i = factors{k}.index(1);
           j = factors{k}.index(2);
            
           rob = states{1+i};
            
           [e, J_e_rob] = error_pose(rob.value,y); 

           rows = numrows:(numrows + numel(y)-1);
            
           r(rows) = Wt2*e;
           A(rows, rob.range) = Wt2*J_e_rob;
          
   end      
   
   numrows = numrows + numel(y);
  % dlmwrite('matrix.txt', Wt2*J_e_rob,'-append', 'precision', '%.1f', 'delimiter','\t')
    
end
    
end