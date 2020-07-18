%naming rule: X is aqeuous species, G is gas phase species.
SpeciesToAdd = {...
       'GHO2';'XH2O';...
       'XH2O2'; 'XHO2'; 'XO2'; 'XO3'; 'XOH';...
       'XOH_1m';'XH_1p';'XO2_1m';...
       'XFe_2p'; 'XFe_3p';'XFeO_2p';'XFe_3p';...
       'XFe_OH_1p';'XFe_OH_2p';'XFe_OH2_1p';'XFe_SO4_1p';...
       'XSO4_2m';'XHSO4_1m';'XH2SO4';...
       'XCu_1p';'XCu_2p';'XCuSO4';...
       };
%        'THO2'; 'TFE'; 'TCU'; 'XH'; ...
%        'XFE2'; 'XFE3'; 'XFEOHp'; 'XFEOHpp'; 'XFEOH2p'; 'XFEO';...
%        'XCU'; 'XCU2'; 'XCUSO4';...
%        'XH2O2'; 'XHO2'; 'XOH'; 'XO2'; 'XO3';...
%        'XHO2m'; 'XO2m';...
%        'XSO4'; 'XFESO4p';...
%        'YFeOHp'; 'YFeOHpp'; 'YFeSO4p'; 'YCu'; 'YCuSO4';...
%        'YO2m'; 'YHO2m';};
   
AddSpecies

%% Fe
i=i+1;%R1
Rnames{i}='XH2O2 + XFe_2p = XFe_3p + XOH + XOH_1m';
k(:,i) = K_H2O2_Fe_2p;
Gstr{i,1} = 'XH2O2'; Gstr{i,2} = 'XFe_2p';
fXH2O2(i)=fXH2O2(i)-1; fXFe_2p(i)=fXFe_2p(i)-1; fXFe_3p(i)=fXFe_3p(i)+1;  fXOH(i)=fXOH(i)+1;fXOH_1m(i)=fXOH_1m(i)+1;

% i=i+1;%R2
% Rnames{i}='XH2O2 + XFeO_2p = XFe_3p + XHO2 + XOH_1m';
% k(:,i) = K_H2O2_FeO_2p;
% Gstr{i,1} = 'XH2O2'; Gstr{i,2} = 'XFeO_2p';
% fXH2O2(i)=fXH2O2(i)-1; fXFeO_2p(i)=fXFeO_2p(i)-1; fXFe_3p(i)=fXFe_3p(i)+1;  fXHO2(i)=fXHO2(i)+1;fXOH_1m(i)=fXOH_1m(i)+1;

% i=i+1;%R3
% Rnames{i}='XH2O2 + XFe_OH_1p = XFe_OH_2p + XOH + XOH_1m';
% k(:,i) = K_H2O2_Fe_OH_1p;
% Gstr{i,1} = 'XH2O2'; Gstr{i,2} = 'XFe_OH_1p';
% fXH2O2(i)=fXH2O2(i)-1; fXFe_OH_1p(i)=fXFe_OH_1p(i)-1; fXFe_OH_2p(i)=fXFe_OH_2p(i)+1;  fXOH(i)=fXOH(i)+1;fXOH_1m(i)=fXOH_1m(i)+1;

i=i+1;%R4
Rnames{i}='XH2O2 + XFe_3p = XFe_2p + XHO2 + XH_1p';
k(:,i) = K_H2O2_Fe_3p;
Gstr{i,1} = 'XH2O2'; Gstr{i,2} = 'XFe_3p';
fXH2O2(i)=fXH2O2(i)-1; fXFe_3p(i)=fXFe_3p(i)-1; fXFe_2p(i)=fXFe_2p(i)+1; fXHO2(i)=fXHO2(i)+1;

i=i+1;%R5
Rnames{i}='XH2O2 + XFe_OH_2p = XFe_2p + XHO2 + XH2O';
k(:,i) = K_H2O2_Fe_OH_2p;
Gstr{i,1} = 'XH2O2'; Gstr{i,2} = 'XFe_OH_2p';
fXH2O2(i)=fXH2O2(i)-1; fXFe_OH_2p(i)=fXFe_OH_2p(i)-1; fXFe_2p(i)=fXFe_2p(i)+1; fXHO2(i)=fXHO2(i)+1;

i=i+1;%R6
Rnames{i}='XH2O2 + XFe_OH2_1p = XFe_2p + XHO2 + XOH_1m + XH2O';
k(:,i) = K_H2O2_Fe_OH2_1p;
Gstr{i,1} = 'XH2O2'; Gstr{i,2} = 'XFe_OH2_1p';
fXH2O2(i)=fXH2O2(i)-1; fXFe_OH2_1p(i)=fXFe_OH2_1p(i)-1; fXFe_2p(i)=fXFe_2p(i)+1; fXHO2(i)=fXHO2(i)+1; %ignore H2O and OH_1m

i=i+1;%R7
Rnames{i}='XO2_1m + XFe_2p = XH2O2 + XFe_3p';
k(:,i) = K_O2_1m_Fe_2p;
Gstr{i,1} = 'XO2_1m'; Gstr{i,2} = 'XFe_2p';
fXO2_1m(i)=fXO2_1m(i)-1; fXFe_2p(i)=fXFe_2p(i)-1; fXH2O2(i)=fXH2O2(i)+1; fXFe_3p(i)=fXFe_3p(i)+1;

i=i+1;%R8
Rnames{i}='XO2_1m + XFe_3p = XFe_2p + XO2';
k(:,i) = K_O2_1m_Fe_3p;
Gstr{i,1} = 'XO2_1m'; Gstr{i,2} = 'XFe_3p';
fXO2_1m(i)=fXO2_1m(i)-1; fXFe_3p(i)=fXFe_3p(i)-1; fXFe_2p(i)=fXFe_2p(i)+1; %ignore O2

i=i+1;%R9
Rnames{i}='XO2_1m + XFe_OH_2p = XFe_2p + XO2 + XOH_1m';
k(:,i) = K_O2_1m_Fe_OH_2p;
Gstr{i,1} = 'XO2_1m'; Gstr{i,2} = 'XFe_OH_2p';
fXO2_1m(i)=fXO2_1m(i)-1; fXFe_OH_2p(i)=fXFe_OH_2p(i)-1; fXFe_2p(i)=fXFe_2p(i)+1; fXOH_1m(i)=fXOH_1m(i)+1;

i=i+1;%R10
Rnames{i}='XO2_1m + XFe_OH2_1p = XFe_2p + XO2 + 2*XOH_1m';
k(:,i) = K_O2_1m_Fe_OH2_1p;
Gstr{i,1} = 'XO2_1m'; Gstr{i,2} = 'XFe_OH2_1p';
fXO2_1m(i)=fXO2_1m(i)-1; fXFe_OH2_1p(i)=fXFe_OH2_1p(i)-1; fXFe_2p(i)=fXFe_2p(i)+1; %ignore OH_1m

i=i+1;%R11
Rnames{i}='XHO2 + XFe_2p = XFe_3p + XH2O2';
k(:,i) = K_HO2_Fe_2p;
Gstr{i,1} = 'XHO2'; Gstr{i,2} = 'XFe_2p';
fXHO2(i)=fXHO2(i)-1; fXFe_2p(i)=fXFe_2p(i)-1; fXFe_3p(i)=fXFe_3p(i)+1; fXH2O2(i)=fXH2O2(i)+1;

% i=i+1;%R12
% Rnames{i}='XHO2 + XFeO_2p = XFe_3p + XO2 + XOH_1m';
% k(:,i) = K_HO2_FeO_2p;
% Gstr{i,1} = 'XHO2'; Gstr{i,2} = 'XFeO_2p';
% fXHO2(i)=fXHO2(i)-1; fXFeO_2p(i)=fXFeO_2p(i)-1; fXFe_3p(i)=fXFe_3p(i)+1; %ignore OH_1m and O2

i=i+1;%R13
Rnames{i}='XHO2 + XFe_OH_2p = XFe_2p + XO2 + XH2O';
k(:,i) = K_HO2_Fe_OH_2p;
Gstr{i,1} = 'XHO2'; Gstr{i,2} = 'XFe_OH_2p';
fXHO2(i)=fXHO2(i)-1; fXFe_2p(i)=fXFe_2p(i)-1; fXFe_2p(i)=fXFe_2p(i)+1;

i=i+1;%R14
Rnames{i}='XOH + XFe_2p = XFe_OH_2p';
k(:,i) = K_OH_Fe_2p;
Gstr{i,1} = 'XOH'; Gstr{i,2} = 'XFe_2p';
fXOH(i)=fXOH(i)-1; fXFe_2p(i)=fXFe_2p(i)-1; fXFe_OH_2p(i)=fXFe_OH_2p(i)+1; 

% i=i+1;%R15
% Rnames{i}='XOH + XFeO_2p = XFe_3p + XH2O2';
% k(:,i) = K_OH_FeO_2p;
% Gstr{i,1} = 'XOH'; Gstr{i,2} = 'XFeO_2p';
% fXOH(i)=fXOH(i)-1; fXFeO_2p(i)=fXFeO_2p(i)-1; fXFe_3p(i)=fXFe_3p(i)+1; %ignore H2O2

% i=i+1;%R16
% Rnames{i}='XO3 + XFe_2p = XFeO_2p + XO2';
% k(:,i) = K_O3_Fe_2p;
% Gstr{i,1} = 'XO3'; Gstr{i,2} = 'XFe_2p';
% fXO3(i)=fXO3(i)-1; fXFe_2p(i)=fXFe_2p(i)-1; fXFeO_2p(i)=fXFeO_2p(i)+1; 
% 
% %remove H2O in this equation
% i=i+1;%R17
% Rnames{i}='XFeO_2p + XH2O = XFe_3p + XOH + XOH_1m';
% k(:,i) = K_FeO_2p;
% Gstr{i,1} = 'XFeO_2p'; 
% fXFeO_2p(i)=fXFeO_2p(i)-1;fXFe_3p(i)=fXFe_3p(i)+1; fXOH(i)=fXOH(i)+1;%ignore H2O and OH_1m
% 
% i=i+1;%R18
% Rnames{i}='XFeO_2p + XFe_2p = 2*XFe_3p + 2*XOH_1m';
% k(:,i) = K_Fe_2p_FeO_2p;
% Gstr{i,1} = 'XFeO_2p'; Gstr{i,2} = 'XFe_2p';
% fXFeO_2p(i)=fXFeO_2p(i)-1; fXFe_2p(i)=fXFe_2p(i)-1; fXFe_3p(i)=fXFe_3p(i)+2; %ignore OH_1m

% i=i+1;%R19
% Rnames{i}='FeO_2p + Fe_2p = Fe_OH2_Fe_4p';
% RK25C(i)= 1.8e4;RKEOR(i) = 5052; TKCOEF = (298-TK)./(298.*TK);
% k(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));
% Gstr{i,1} = 'FeO_2p'; Gstr{i,2} = 'Fe_2p';
% fFeO_2p(i)=fFeO_2p(i)-1; fFe_2p(i)=fFe_2p(i)-1; fFe_OH2_Fe_4p(i)=fFe_OH2_Fe_4p(i)+1;
% 
% i=i+1;%R20
% Rnames{i}='Fe_OH2_Fe_4p = 2Fe_3p + 2OH_1m';
% RK25C(i)= 0.49;RKEOR(i) = 8780; TKCOEF = (298-TK)./(298.*TK);
% k(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));
% Gstr{i,1} = 'Fe_OH2_Fe_4p'; 
% fFe_OH2_Fe_4p(i)=fFe_OH2_Fe_4p(i)-1; fFe_3p(i)=fFe_3p(i)+2; fOH_1m(i)=fOH_1m(i)+2;
% 
% i=i+1;%R21
% Rnames{i}='Fe_OH2_Fe_4p = 2Fe_3p + 2H2O';
% RK25C(i)= 1.95;RKEOR(i) = 5653; TKCOEF = (298-TK)./(298.*TK);
% k(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));
% Gstr{i,1} = 'Fe_OH2_Fe_4p'; 
% fFe_OH2_Fe_4p(i)=fFe_OH2_Fe_4p(i)-1; fFe_3p(i)=fFe_3p(i)+2; fOH_1m(i)=fOH_1m(i)+2;fH2O(i)=fH2O(i)+2;

% i=i+1;%R29
% Rnames{i}='HSO3_1m + Fe_OH_2p = Fe_2p + SO3_1m + H2O';
% RK25C(i)= 30;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
% k(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));
% Gstr{i,1} = 'HSO3_1m'; Gstr{i,2} = 'Fe_OH_2p';
% fHSO3_1m(i)=fHSO3_1m(i)-1; fFe_OH_2p(i)=fFe_OH_2p(i)-1; fFe_2p(i)=fFe_2p(i)+1;fSO3_1m(i)=fSO3_1m(i)+1;fH2O(i)=fH2O(i)+1;

i=i+1;%R33
Rnames{i}='XO2_1m + XFe_SO4_1p = XFe_2p + XSO4_2m + XO2';
k(:,i) = K_O2_1m_Fe_SO4_1p;
Gstr{i,1} = 'XO2_1m'; Gstr{i,2} = 'XFe_SO4_1p';
fXO2_1m(i)=fXO2_1m(i)-1; fXFe_SO4_1p(i)=fXFe_SO4_1p(i)-1; fXFe_2p(i)=fXFe_2p(i)+1;fXSO4_2m(i)=fXSO4_2m(i)+1;

i=i+1;%R34
Rnames{i}='XHO2 + XFe_SO4_1p = XFe_2p + XSO4_2m + XH_1p';
k(:,i) = K_HO2_Fe_SO4_1p;
Gstr{i,1} = 'XO2_1m'; Gstr{i,2} = 'XFe_SO4_1p';
fXHO2(i)=fXHO2(i)-1; fXFe_SO4_1p(i)=fXFe_SO4_1p(i)-1; fXFe_2p(i)=fXFe_2p(i)+1;fXSO4_2m(i)=fXSO4_2m(i)+1;


% i=i+1;%R48
% Rnames{i}='XOH + XCu_1p = XCu_2p + XOH_1m';
% k(:,i) = K_OH_Cu_1p;
% Gstr{i,1} = 'XOH'; Gstr{i,2} = 'XCu_1p';
% fXOH(i)=fXOH(i)-1; fXCu_1p(i)=fXCu_1p(i)-1; fXCu_2p(i)=fXCu_2p(i)+1;

i=i+1;%R50
Rnames{i}='XO2 + XCu_1p = XCu_2p + XO2_1m';
k(:,i) = K_O2_Cu_1p;
Gstr{i,1} = 'XO2'; Gstr{i,2} = 'XCu_1p';
fXO2(i)=fXO2(i)-1; fXCu_1p(i)=fXCu_1p(i)-1; fXCu_2p(i)=fXCu_2p(i)+1;fXO2_1m(i)=fXO2_1m(i)+1;

i=i+1;%R51
Rnames{i}='XH2O2 + XCu_1p = XCu_2p + XOH + XOH_1m';
k(:,i) = K_H2O2_Cu_1p;
Gstr{i,1} = 'XH2O2'; Gstr{i,2} = 'XCu_1p';
fXH2O2(i)=fXH2O2(i)-1; fXCu_1p(i)=fXCu_1p(i)-1; fXCu_2p(i)=fXCu_2p(i)+1;fXOH(i)=fXOH(i)+1;

i=i+1;%R52
Rnames{i}='XHO2 + XCu_1p = XCu_2p + XH2O2';
k(:,i) = K_HO2_Cu_1p;
Gstr{i,1} = 'XHO2'; Gstr{i,2} = 'XCu_1p';
fXHO2(i)=fXHO2(i)-1; fXCu_1p(i)=fXCu_1p(i)-1; fXCu_2p(i)=fXCu_2p(i)+1;fXH2O2(i)=fXH2O2(i)+1;

i=i+1;%R53
Rnames{i}='XO2_1m + XCu_1p = XCu_2p + XH2O2';
k(:,i) = K_O2_1m_Cu_1p;
Gstr{i,1} = 'XO2_1m'; Gstr{i,2} = 'XCu_1p';
fXO2_1m(i)=fXO2_1m(i)-1; fXCu_1p(i)=fXCu_1p(i)-1; fXCu_2p(i)=fXCu_2p(i)+1;fXH2O2(i)=fXH2O2(i)+1;

i=i+1;%R54
Rnames{i}='XHO2 + XCu_2p = XCu_1p + XO2';
k(:,i) = K_HO2_Cu_2p;
Gstr{i,1} = 'XHO2'; Gstr{i,2} = 'XCu_2p';
fXHO2(i)=fXHO2(i)-1; fXCu_2p(i)=fXCu_2p(i)-1; fXCu_1p(i)=fXCu_1p(i)+1;

i=i+1;%R55
Rnames{i}='XO2_1m + XCu_2p = XCu_1p + XO2';
k(:,i) = K_O2_1m_Cu_2p;
Gstr{i,1} = 'XO2_1m'; Gstr{i,2} = 'XCu_2p';
fXO2_1m(i)=fXO2_1m(i)-1; fXCu_2p(i)=fXCu_2p(i)-1; fXCu_1p(i)=fXCu_1p(i)+1;

i=i+1;%R87
Rnames{i}='XFe_3p + XCu_1p = XFe_2p + XCu_2p';
k(:,i) = K_Fe_3p_Cu_1p;
Gstr{i,1} = 'XFe_3p'; Gstr{i,2} = 'XCu_1p';
fXFe_3p(i)=fXFe_3p(i)-1; fXCu_1p(i)=fXCu_1p(i)-1; fXFe_2p(i)=fXFe_2p(i)+1; fXCu_2p(i)=fXCu_2p(i)+1;

i=i+1;%R88
Rnames{i}='XFe_OH_2p + XCu_1p = XFe_2p + XCu_2p + XOH_1m';
k(:,i) = K_Fe_OH_2p_Cu_1p;
Gstr{i,1} = 'XFe_OH_2p'; Gstr{i,2} = 'XCu_1p';
fXFe_OH_2p(i)=fXFe_OH_2p(i)-1; fXCu_1p(i)=fXCu_1p(i)-1; fXFe_2p(i)=fXFe_2p(i)+1; fXCu_2p(i)=fXCu_2p(i)+1;

i=i+1;%R93
Rnames{i}='XOH + XHO2 = H2O + XO2';
k(:,i) = K_OH_HO2;
Gstr{i,1} = 'XOH'; Gstr{i,2} = 'XHO2';
fXOH(i)=fXOH(i)-1; fXHO2(i)=fXHO2(i)-1; 

i=i+1;%R94
Rnames{i}='XOH + XO2_1m = XOH_1m + XO2';
k(:,i) = K_OH_O2_1m;
Gstr{i,1} = 'XOH'; Gstr{i,2} = 'XO2_1m';
fXOH(i)=fXOH(i)-1; fXO2_1m(i)=fXO2_1m(i)-1; fXOH_1m(i)=fXOH_1m(i)+1;

i=i+1;%R95
Rnames{i}='XOH + XH2O2 = XH2O + XHO2';
k(:,i) = K_OH_H2O2;
Gstr{i,1} = 'XOH'; Gstr{i,2} = 'XH2O2';
fXOH(i)=fXOH(i)-1; fXH2O2(i)=fXH2O2(i)-1; fXHO2(i)=fXHO2(i)+1;

i=i+1;%R99
Rnames{i}='XHO2 + XHO2 = XH2O2 + XO2';
k(:,i) = K_HO2_HO2;
Gstr{i,1} = 'XHO2'; Gstr{i,2} = 'XHO2';
fXHO2(i)=fXHO2(i)-2; fXH2O2(i)=fXH2O2(i)+1; 

i=i+1;%R100
Rnames{i}='XHO2 + XO2_1m = XH2O2 + XOH_1m';
k(:,i) = K_HO2_O2_1m;
Gstr{i,1} = 'XHO2'; Gstr{i,2} = 'XO2_1m';
fXHO2(i)=fXHO2(i)-1;fXO2_1m(i)=fXO2_1m(i)-1; fXH2O2(i)=fXH2O2(i)+1;

i=i+1;%R101
Rnames{i}='XO3 + XO2_1m = XOH + XOH_1m';
k(:,i) = K_O3_O2_1m;
Gstr{i,1} = 'XO3'; Gstr{i,2} = 'XO2_1m';
fXO3(i)=fXO3(i)-1;fXO2_1m(i)=fXO2_1m(i)-1; fXOH(i)=fXOH(i)+1; 

i=i+1;%R116
Rnames{i}='XFe_SO4_1p + XCu_1p = XFe_2p + XCu_2p + XSO4_2m';
k(:,i) = K_Fe_SO4_1p_Cu_1p;
Gstr{i,1} = 'XFe_SO4_1p'; Gstr{i,2} = 'XCu_1p';
fXFe_SO4_1p(i)=fXFe_SO4_1p(i)-1;fXCu_1p(i)=fXCu_1p(i)-1; fXFe_2p(i)=fXFe_2p(i)+1; fXSO4_2m(i)=fXSO4_2m(i)+1;fXCu_2p(i)=fXCu_2p(i)+1; 

% i=i+1;%R117
% Rnames{i}='XCuSO4 + XHO2 = XCu_1p + XHSO4m';
% k(:,i) = K_CuSO4_HO2;
% Gstr{i,1} = 'XCuSO4'; Gstr{i,2} = 'XHO2';
% fXCuSO4(i)=fXCuSO4(i)-1;fXHO2(i)=fXHO2(i)-1; fXCu_1p(i)=fXCu_1p(i)+1; fXHSO4_1m(i)=fXHSO4_1m(i)+1;
% 
% i=i+1;%R118
% Rnames{i}='XCuSO4 + XO2_1m = XCu_1p + XHSO4m';
% k(:,i) = K_CuSO4_O2_1m;
% Gstr{i,1} = 'XCuSO4'; Gstr{i,2} = 'XO2_1m';
% fXCuSO4(i)=fXCuSO4(i)-1;fXO2_1m(i)=fXO2_1m(i)-1; fXCu_1p(i)=fXCu_1p(i)+1; fXHSO4_1m(i)=fXHSO4_1m(i)+1;

%photolysis
i=i+1;%J1
Rnames{i}='XO3 = XH2O2 + XO2';
k(:,i) = JO3;
Gstr{i,1} = 'XO3';
fXO3(i)=fXO3(i)-1;fXH2O2(i)=fXH2O2(i)+1; 

%photolysis
i=i+1;%J2
Rnames{i}='XH2O2 = XOH + XOH';
k(:,i) = JH2O2;
Gstr{i,1} = 'XH2O2';
fXH2O2(i)=fXH2O2(i)-1;fXOH(i)=fXOH(i)+2; 

% %equlibrium
% i=i+1;% E1
% Rnames{i}='XH2O = XH_1p + XOH_1m';
% k(:,i) = K_H2O;
% Gstr{i,1} = 'XH2O';
% fXH_1p(i)=fXH_1p(i)+1; fXOH_1m(i)=fXOH_1m(i)+1; 
% 
% %equlibrium
% i=i+1;% E2
% Rnames{i}='XH_1p + XOH_1m = XH2O';
% k(:,i) = K_H_1p_OH_1m;
% Gstr{i,1} = 'XH_1p'; Gstr{i,2} = 'XOH_1m';
% fXH_1p(i)=fXH_1p(i)-1; fXOH_1m(i)=fXOH_1m(i)-1; 

%equlibrium
i=i+1;% E3
Rnames{i}='XHO2 = XH_1p + XO2_1m';
k(:,i) = K_HO2;
Gstr{i,1} = 'XHO2';
fXHO2(i)=fXHO2(i)-1; fXH_1p(i)=fXH_1p(i)+1; fXO2_1m(i)=fXO2_1m(i)+1; 

%equlibrium
i=i+1;% E4
Rnames{i}='XH_1p + XO2_1m = XHO2';
k(:,i) = K_H_1p_O2_1m;
Gstr{i,1} = 'XH_1p'; Gstr{i,2} = 'XO2_1m';
fXH_1p(i)=fXH_1p(i)-1; fXO2_1m(i)=fXO2_1m(i)-1; fXHO2(i)=fXHO2(i)+1; 

%equlibrium
i=i+1;% E5
Rnames{i}='XFe_3p = XFe_OH_2p + XH_1p ';
k(:,i) = K_Fe_3p;
Gstr{i,1} = 'XFe_3p';
fXFe_3p(i)=fXFe_3p(i)-1; fXH_1p(i)=fXH_1p(i)+1; fXFe_OH_2p(i)=fXFe_OH_2p(i)+1; 

%equlibrium
i=i+1;% E6
Rnames{i}='XFe_OH_2p + XH_1p = XFe_3p';
k(:,i) = K_Fe_OH_2p_H_1p;
Gstr{i,1} = 'XFe_OH_2p'; Gstr{i,2} = 'XH_1p';
fXH_1p(i)=fXH_1p(i)-1; fXFe_OH_2p(i)=fXFe_OH_2p(i)-1; fXFe_3p(i)=fXFe_3p(i)+1; 

%equlibrium
i=i+1;% E7
Rnames{i}='XFe_OH_2p = XFe_OH2_1p + XH_1p ';
k(:,i) = K_Fe_OH_2p;
Gstr{i,1} = 'XFe_OH_2p';
fXFe_OH_2p(i)=fXFe_OH_2p(i)-1; fXH_1p(i)=fXH_1p(i)+1; fXFe_OH2_1p(i)=fXFe_OH2_1p(i)+1; 

%equlibrium
i=i+1;% E8
Rnames{i}='XFe_OH2_1p + XH_1p = XFe_OH_2p';
k(:,i) = K_Fe_OH2_1p_H_1p;
Gstr{i,1} = 'XFe_OH2_1p'; Gstr{i,2} = 'XH_1p';
fXFe_OH2_1p(i)=fXFe_OH2_1p(i)-1; fXH_1p(i)=fXH_1p(i)-1; fXFe_OH_2p(i)=fXFe_OH_2p(i)+1;

%equlibrium
i=i+1;% E9
Rnames{i}='XFe_3p + XSO4_2m = XFe_SO4_1p ';
k(:,i) = K_Fe_3p_SO4_2m;
Gstr{i,1} = 'XFe_3p'; Gstr{i,2} = 'XSO4_2m';
fXFe_3p(i)=fXFe_3p(i)-1; fXSO4_2m(i)=fXSO4_2m(i)-1; fXFe_SO4_1p(i)=fXFe_SO4_1p(i)+1; 

%equlibrium
i=i+1;% E10
Rnames{i}='XFe_SO4_1p = XFe_3p + XSO4_2m';
k(:,i) = K_Fe_SO4_1p;
Gstr{i,1} = 'XFe_SO4_1p'; 
fXFe_SO4_1p(i)=fXFe_SO4_1p(i)-1; fXFe_3p(i)=fXFe_3p(i)+1; fXSO4_2m(i)=fXSO4_2m(i)+1; 

% %equlibrium
% i=i+1;% E11
% Rnames{i}='XH2SO4 = XHSO4_1m + XH_1p ';
% k(:,i) = K_H2SO4;
% Gstr{i,1} = 'XH2SO4'; 
% fXH2SO4(i)=fXH2SO4(i)-1; fXHSO4_1m(i)=fXHSO4_1m(i)+1; fXH_1p(i)=fXH_1p(i)+1; 
% 
% %equlibrium
% i=i+1;% E12
% Rnames{i}='XHSO4_1m + XH_1p = XH2SO4';
% k(:,i) = K_HSO4_1m_H_1p;
% Gstr{i,1} = 'XHSO4_1m'; Gstr{i,2} = 'XH_1p'; 
% fXHSO4_1m(i)=fXHSO4_1m(i)-1; fXH_1p(i)=fXH_1p(i)-1; fXH2SO4(i)=fXH2SO4(i)+1; 
% 
% %equlibrium
% i=i+1;% E13
% Rnames{i}='XHSO4_1m = XSO4_2m + XH_1p ';
% k(:,i) = K_HSO4_1m;
% Gstr{i,1} = 'XHSO4_1m'; 
% fXHSO4_1m(i)=fXHSO4_1m(i)-1; fXSO4_2m(i)=fXSO4_2m(i)+1; fXH_1p(i)=fXH_1p(i)+1; 
% 
% %equlibrium
% i=i+1;% E14
% Rnames{i}='XSO4_2m + XH_1p = XHSO4_1m';
% k(:,i) = K_SO4_2m_H_1p;
% Gstr{i,1} = 'XSO4_2m'; Gstr{i,2} = 'XH_1p'; 
% fXSO4_2m(i)=fXSO4_2m(i)-1; fXH_1p(i)=fXH_1p(i)-1; fXHSO4_1m(i)=fXHSO4_1m(i)+1; 

%HO2 het chem
i=i+1;% H1
Rnames{i}='GHO2 = XHO2';
k(:,i) = K_GHO2;
Gstr{i,1} = 'GHO2'; 
fGHO2(i)=fGHO2(i)-1; fXHO2(i)=fXHO2(i)+1; 

i=i+1;% H1
Rnames{i}='XHO2 = GHO2';
k(:,i) = K_XHO2;
Gstr{i,1} = 'XHO2'; 
fXHO2(i)=fXHO2(i)-1; fGHO2(i)=fGHO2(i)+1; 

% %H2O2 het chem
% i=i+1;% H3
% Rnames{i}='GH2O2 = XH2O2';
% k(:,i) = K_GH2O2;
% Gstr{i,1} = 'GH2O2'; 
% fGH2O2(i)=fGH2O2(i)-1; fXH2O2(i)=fX2HO2(i)+1; 
% 
% i=i+1;% H4
% Rnames{i}='XH2O2 = GH2O2';
% k(:,i) = K_XH2O2;
% Gstr{i,1} = 'XH2O2'; 
% fXH2O2(i)=fXH2O2(i)-1; fGH2O2(i)=fGH2O2(i)+1; 