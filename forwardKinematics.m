%Function for substituting [theta d a alpha] values {Denavit Hartenberg Parameters}. 
%*************************** Ghanshyam_Chandra *************************************
%*************************** Open_Robo_Simulator ***********************************

function[T00,T01,T12,Etip]=forwardKinematics(theta1,d1,a1,alpha1,theta2,d2,a2,alpha2)

T00 = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
T01 = getTransformMatrix(theta1,d1,a1,alpha1);
T12 = getTransformMatrix(theta2,d2,a2,alpha2);

Etip = T00 * T01 * T12;

end
