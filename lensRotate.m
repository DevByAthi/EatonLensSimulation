function [p, dx, dy] = lensRotate(p, lens, dx, dy)
  % distance between p and the center of lens
##  dist = sqrt((lens(1) - p(1)) .^ 2 + (lens(2) - p(2)) .^ 2);
  
  % Find the radius vector connecting center to p
  center = [lens(1) lens(2)];
  r = p - center;
  
  % unit tangent vector
  T_in = [-1 * r(2), r(1)]/norm(r);
  
  % find angle between tangent line to lens at p and direction [dx, dy]
  alpha = asind(dot(T_in, [dx dy]))
##  lens(3)
  theta = 2 * alpha + lens(4);
  
  rotP = [cosd(theta) ,  -sind(theta) ; sind(theta) , cosd(theta)];
  rotP, r'
  p = (rotP * r') + center;
##  plot(p(1), p(2), "g+")

##  temp = rotP * [dx ; dy];
##  dx = temp(1); dy = temp(2);
  
endfunction
