function J = AqueousChem_J(Met)
% INPUTS
struct2var(Met)

J=struct;
J.JO3 = 2.98e-4;
J.JH2O2 = 4.81e-6;