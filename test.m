function [p, dx, dy] = test(p, lens, dx, dy)
  % distance between p and the center of lens
##  dist = sqrt((lens(1) - p(1)) .^ 2 + (lens(2) - p(2)) .^ 2);
  
  % Find the radius vector connecting center to p
  center = [lens(1) lens(2)]; % point to rotate about
  if (norm(p - center) < 0.001)
    return
  endif
  r = p - center;
  
  % unit tangent vector
  T_in = [-1 * r(2), r(1)]/norm(r);
  
  % find angle between tangent line to lens at p and direction [dx, dy]
  alpha = asind(dot(T_in, [dx dy]));
  theta = 2 * alpha + lens(4);
  
  % Matrices for rotation about the center of the lens
  % NOTE: Need to find different formula for theta!!!!!!
  
  rotP = [cosd(theta) ,  -sind(theta), 0 ; sind(theta) , cosd(theta), 0; 0 0 1];
  trans = [1 0 center(1); 0 1 center(2); 0 0 1];
  trans_inv = [1 0 -center(1); 0 1 -center(2); 0 0 1];
  
  
  p_3d = [p(1) ; p(2) ; 1];
  temp_p = trans * rotP *   trans_inv * p_3d
  
  p(1) = temp_p(1); p(2) = temp_p(2);
##  plot(p(1), p(2), "g+")
  
  % Rotate the direction of motion by the desired rotation angle
  
  rotDir = -[cosd(lens(3)) -sind(lens(3)); sind(lens(3)) , cosd(lens(3))];
  tempDir = rotDir * [dx ; dy];
  dx = tempDir(1); dy = tempDir(2);

##  temp = rotP * [dx ; dy; 0];
##  dx = temp(1); dy = temp(2);
  
endfunction
