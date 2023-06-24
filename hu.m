function [h] = hu(im, z)
    
    % moments about centroid
    u00 = central_moment(im,0,0);
    u02 = central_moment(im,0,2);
    u03 = central_moment(im,0,3);
    
    u11 = central_moment(im,1,1);
    u12 = central_moment(im,1,2);
    
    u20 = central_moment(im,2,0);
    u21 = central_moment(im,2,1);
    
    u30 = central_moment(im,3,0);
    
    
    % normalized moments
    n02 = u02/((u00)^2);
    n03 = u03/((u00)^2.5);
    
    n11 = u11/((u00)^2);
    n12 = u12/((u00)^2.5);
    
    n20 = u20/((u00)^2);
    n21 = u21/((u00)^2.5);
    
    n30 = u30/((u00)^2.5);
        
        
        
    % first hu moment
    if z == 1
      
        h = n20 + n02;
        h = -sin(h)*log(abs(h));
        
    % second hu moment    
    elseif z == 2
            
        h = (n20 - n02)^2 + 4*(n11)^2;
        h = -sin(h)*log(abs(h));
        
    % third hu moment  
    elseif z == 3
        
        h = (n30 - 3*n12)^2 + (3*n21 - n03)^2;
        h = -sin(h)*log(abs(h));
        
    % fourth hu moment    
    elseif z == 4
    
        h = (n30 + n12)^2 + (n21 + n03)^2;
        %h = -sin(h)*log(abs(h));

          
    % fifth hu moment
    elseif z == 5
        
        h = (n30 - 3*n12)*(n30 + n12)*(((n30 + n12)^2) - 3*(n21 + n03)^2) + (3*n21-n03)*(3*(n30+n12)^2 - (n21 + n03)^2);
        h = -sin(h)*log(abs(h));
    
    % sixth hu moment
    elseif z == 6
        
        h = (n20 - n02) * ((n30 + n12)^2 - (n21 + n03)^2 + 4*n11*(n30 + n12)*(n21+n03));
        h = -sin(h)*log(abs(h));
    
    % seventh hu moment
    elseif z == 7
        
        h = (3*n21 - n03) * (n30 + n12)*((n30 + n12)^2 - 3*(n21 + n03)^2) + (n30 - 3*n12) * (n21 + n03) * (3*(n30 + n12)^2 - (n21 + n03)^2);
        h = -sin(h)*log(abs(h));
      
    end 

end

