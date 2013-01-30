function [ euler ] = euler( s )
%transforms rotation into a single angle measurement based 
% on the Euler's rotation theorem that expresses any 3D rotation
% as a single angle and corresponding axis of rotation
% s is a three column matrix that contains the values for rotation in
% degrees for the three rotation directions
 phi = s(1);
 theta = s(2);
 psi= s(3);
 
euler = acos((cos(phi)*cos(theta)+cos(phi)*cos(psi)+cos(theta)*cos(psi)+sin(phi)*sin(psi)*sin(theta)-1)/2);


end