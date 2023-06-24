function [u] = central_moment(im, p, q)
    
    [xx, yy] = center_of_mass(im);
    
    X = size(im,1);
    Y = size(im, 2);
    u = 0;
    for x = 1:X
        for y = 1:Y
     
            u = u + (x-xx)^p * (y-yy)^q * (im(y,x));
            
        end 
    end 

end 

