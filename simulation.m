

clear; close all; clc;

% Will eventually read from .mat file
% Lenses' positions, radii, and rotation angles (in degrees)

% x, y, radius, angle of rotations
lens_params = [0.5 0.5 0.5 90];
##               0.5 0.875 0.125 90];

t = linspace(0, 2*pi, 150)';

%lenses = createLenses(lens_params, t);
figure 1;
hold on;
axis("equal");
plotLenses(lens_params, t);

iter = 10;
traj = 45;
step = 0.1; % scaled down, but is a geodesic's path
p = [0 0];
dx = step * cosd(traj);
dy = step * sind(traj);

for i=1:iter
##  p , dx, dy
##  size(p)
  plot(p(1), p(2), "r-x")
##  p
  p(1) = p(1) + dx; p(2) = p(2) + dy;
  
  % Make sure the point p is within the unit square
  if (p(1) > 1 || p(1) < 0)
    % the exponent helps to avoid extra if-statements
    p(1) -= (-1) ^ (p(1) < 0.5);
  endif
  
  if (p(2) > 1 || p(2) < 0)
    p(2) -= (-1) ^ (p(2) < 0.5);
  endif
  
  indices = near(p, lens_params);
  
  if (size(indices, 1))
    [p , dx, dy] = lensRotate(p, lens_params(indices, :), dx, dy);
  endif
  
  pause (2);
  
endfor

hold off;