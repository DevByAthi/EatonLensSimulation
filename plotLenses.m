function f = plotLenses(lens_params, t)
  
  num_lenses = size(lens_params, 1);
  
  x = lens_params(:, 1);
  y = lens_params(:, 2);
  radii = lens_params(:, 3);
  
  % Code taken from https://stackoverflow.com/questions/7971467/how-to-draw-a-circle-in-gnu-octave
  % user BenH
  
  # Vectorize???
  for i=1:num_lenses
    r = lens_params(i,3); 
    circsx = r.*cos(t) + lens_params(i,1);
    circsy = r.*sin(t) + lens_params(i,2); 
    plot(circsx,circsy, "b*"); 
  endfor
  
endfunction
