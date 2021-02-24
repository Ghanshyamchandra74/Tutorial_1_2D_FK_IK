%function for Plotting Workspace.
function [FK_plot3D] = FK_plot3D(Th_1, Th_2, a_1, a_2, d_1, d_2, al_1, al_2)


%Plotting The workspace 
L (1)  = Link( [Th_1 d_1 a_1 al_1] );
L (2)  = Link( [Th_2 d_2 a_2 al_2] ); 


Robot = SerialLink(L);
Robot.name = '2 - DoF FK/IK Kinematics';
Robot.plot([Th_1 Th_2]);
