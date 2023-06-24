function[xx, yy] = center_of_mass(im)

        %zeroth order moment
        M00 = sum(im(:));
        
        
        % first order moment
        
        [x,y] = meshgrid(1:size(im,2),1:size(im,1));
        
        M10 = x.*im;
        M10 = sum(M10(:));
        
        M01 = y.*im;
        M01 = sum(M01(:));
        
        yy = M01/M00;
        xx = M10/M00;
          
        
end 