function states = updatestates(states,dx)

for i= 1:1:numel(states)

       states{i}.value = states{i}.value + dx(states{i}.range);
    
    if strcmp(states{i}.type , 'pose')
        
        while states{i}.value(3) > pi
            states{i}.value(3) = states{i}.value(3) -2*pi;
        end    
        
       while states{i}.value(3) < -pi
            states{i}.value(3) = states{i}.value(3) +2*pi;
       end  
        
    end
    
    
end

end