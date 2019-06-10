##Returns index for the row in
##lens_params where the point p is inside the lens

function ind = near(p, lens_params)
  ind = find(sqrt((lens_params(:,1) - p(1)) .^ 2 + (lens_params(:,2) - p(2)) .^ 2) <= lens_params(:,3));
endfunction
