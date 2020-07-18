function K = AqueousChem_K(Met)

struct2var(Met)

nk = 38; %number of rate constants
krx = nan(length(T),nk);
Knames = cell(nk,1);

TK=T;

%% Aqueous treatment       
       ATM2DYN = 1.02e6;  % atm to dyne/cm2, 1 dyn = 1 g⋅cm/s2 = 10−5 kg⋅m/s2 = 10−5 N
       DGHO2 = 0.247;     % cm2/s (gas phase diff)
       GAMHO2 = 1.0 ;     % gamma(HO2)
       RCONST = 8.314e7;  % erg/mol/K (=dyn*cm/mol/K)
       VAIR = (8.*RCONST*TK/3.1416/29.)^0.5;%mean molecular speed of X in the gas phase
       
       massCu=1.47e-16          %g
%      here unit is molality, moles per kilogram water
       wetvolume = 8.65e-16     %cm3 to L
       RADIUS = (wetvolume.*1.e3.*3./4./3.1416).^(1.0/3.0) % cm (wet aerosol)
       
%     HC25C(1)=1.2e-3; HCEOR(1)=1620;HCT(1)=HC25C(1) * exp(+TKCOEF*HCEOR(1));%O2
%     HC25C(2)=1.1e-2; HCEOR(2)=2300;HCT(2)=HC25C(2) * exp(+TKCOEF*HCEOR(2));%O3
%     HC25C(3)=9.0e3; HCEOR(3)=0; HCT(3)=HC25C(3) * exp(+TKCOEF*HCEOR(3));%OH
%     HC25C(4)=2.0e3; HCEOR(4)=6600;HCT(4)=HC25C(4) * exp(+TKCOEF*HCEOR(4));%HO2
%     HC25C(5)=7.4e4; HCEOR(5)=6615;HCT(5)=HC25C(5) * exp(+TKCOEF*HCEOR(5));%H2O2
%     
%        DSURF = 1./(RADIUS/DGHO2 + 4./(VAIR*GAMHO2))%1/(cm/cm2/s)=cm/s
%        FLXIN = 3.0 * DSURF * GHO2 * ATM2DYN / RADIUS%Reaction rate/particle volume
%        FLXOC = 3.0 * DSURF * ATM2DYN / (RADIUS * HCT(4))
    
    
%        XO2 = HCT(1) * O2
%        XO3 = HCT(2) * O3
%        XHO2 = HCT(4) * HO2
%        XH2O2 = HCT(5) * H2O2
%        XO2m = YO2m * XHO2
%        XHO2m = YHO2m * XH2O2
 
i=1; %R1
Knames{i}   = 'K_H2O2_Fe_2p';
RK25C(i)= 70;RKEOR(i) = 5050; TKCOEF = (298-TK)./(298.*TK);
krx(:,i)    = RK25C(i) * exp(-TKCOEF*RKEOR(i));

% i=i+1;%R2   
% Knames{i}   = 'K_H2O2_FeO_2p';
% RK25C(i)= 9.5e3;RKEOR(i) = 2800; TKCOEF = (298-TK)./(298.*TK);
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

% i=i+1;%R3   
% Knames{i}   = 'K_H2O2_Fe_OH_1p';
% RK25C(i)= 1.9e6;RKEOR(i) = 6200; TKCOEF = (298-TK)./(298.*TK);
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R4   
Knames{i}   = 'K_H2O2_Fe_3p';
RK25C(i)= 2.0e-3;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R5   
Knames{i}   = 'K_H2O2_Fe_OH_2p';
RK25C(i)= 2.0e-3;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R6   
Knames{i}   = 'K_H2O2_Fe_OH2_1p';
RK25C(i)= 2.0e-3;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R7
%Songmiao add XH_1p to the calculation, which seems incorrect.
Knames{i}   = 'K_O2_1m_Fe_2p';
RK25C(i)= 1.0e7;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R8   
Knames{i}   = 'K_O2_1m_Fe_3p';
RK25C(i)= 1.5e8;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R9   
Knames{i}   = 'K_O2_1m_Fe_OH_2p';
RK25C(i)= 1.5e8;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R10   
Knames{i}   = 'K_O2_1m_Fe_OH2_1p';
RK25C(i)= 1.5e8;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R11   
Knames{i}   = 'K_HO2_Fe_2p';
RK25C(i)= 1.2e6;RKEOR(i) = 5050; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

% i=i+1;%R12   
% Knames{i}   = 'K_HO2_FeO_2p';
% RK25C(i)= 2.0e6;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R13   
Knames{i}   = 'K_HO2_Fe_OH_2p';
RK25C(i)= 1.3e5;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R14   
Knames{i}   = 'K_OH_Fe_2p';
RK25C(i)= 4.6e8;RKEOR(i) = 1100; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

% i=i+1;%R15   
% Knames{i}   = 'K_OH_FeO_2p';
% RK25C(i)= 1.0e7;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

% i=i+1;%R16   
% Knames{i}   = 'K_O3_Fe_2p';
% RK25C(i)= 8.2e5;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));
% 
% i=i+1;%R17   
% Knames{i}   = 'K_FeO_2p';
% RK25C(i)= 1.3e-2;RKEOR(i) = 4100; TKCOEF = (298-TK)./(298.*TK);
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));
% 
% i=i+1;%R18   
% Knames{i}   = 'K_Fe_2p_FeO_2p';
% RK25C(i)= 7.2e4;RKEOR(i) = 842; TKCOEF = (298-TK)./(298.*TK);
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R33   
Knames{i}   = 'K_O2_1m_Fe_SO4_1p';
RK25C(i)= 1.5e8;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R34   
Knames{i}   = 'K_HO2_Fe_SO4_1p';
RK25C(i)= 1.0e3;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

% i=i+1;%R48   
% Knames{i}   = 'K_OH_Cu_1p';
% RK25C(i)= 3.0e9;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R50   
Knames{i}   = 'K_O2_Cu_1p';
RK25C(i)= 4.6e5;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R51   
Knames{i}   = 'K_H2O2_Cu_1p';
RK25C(i)= 7.0e3;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R52   
Knames{i}   = 'K_HO2_Cu_1p';
RK25C(i)= 3.5e9;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R53  
Knames{i}   = 'K_O2_1m_Cu_1p';
RK25C(i)= 9.4e9;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R54   
Knames{i}   = 'K_HO2_Cu_2p';
RK25C(i)= 1.0e8;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R55   
Knames{i}   = 'K_O2_1m_Cu_2p';
RK25C(i)= 8.0e9;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R87   
Knames{i}   = 'K_Fe_3p_Cu_1p';
RK25C(i)= 1.3e7;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R88   
Knames{i}   = 'K_Fe_OH_2p_Cu_1p';
RK25C(i)= 3.0e7;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R93   
Knames{i}   = 'K_OH_HO2';
RK25C(i)= 7.0e9;RKEOR(i) = 1500; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R94   
Knames{i}   = 'K_OH_O2_1m';
RK25C(i)= 1.0e10;RKEOR(i) = 1500; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R95   
Knames{i}   = 'K_OH_H2O2';
RK25C(i)= 2.7e7;RKEOR(i) = 1700; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R99   
Knames{i}   = 'K_HO2_HO2';
RK25C(i)= 8.6e5;RKEOR(i) = 2350; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R100   
Knames{i}   = 'K_HO2_O2_1m';
RK25C(i)= 1.0e8;RKEOR(i) = 1500; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R101   
Knames{i}   = 'K_O3_O2_1m';
RK25C(i)= 1.5e9;RKEOR(i) = 1500; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%R116   
Knames{i}   = 'K_Fe_SO4_1p_Cu_1p';
RK25C(i)= 1.8e6;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

% i=i+1;%R117   
% Knames{i}   = 'K_CuSO4_HO2';
% RK25C(i)= 1.0e7;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));
% 
% i=i+1;%R118   
% Knames{i}   = 'K_CuSO4_O2_1m';
% RK25C(i)= 8.0e8;RKEOR(i) = 0.0; TKCOEF = (298-TK)./(298.*TK);
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

% i=i+1;%E1  
% Knames{i}   = 'K_H2O';
% RK25C(i)= 2.34e-5;RKEOR(i) = 6800; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003 ????????????, to be found out
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));
% 
% i=i+1;%E2  
% Knames{i}   = 'K_H_1p_OH_1m';
% RK25C(i)= 1.3e11;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003 ????????????
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

% i=i+1;%E1  
% Knames{i}   = 'K_H2O';
% RK25C(i)= 1.3e-3;RKEOR(i) = 6800; TKCOEF = (298-TK)./(298.*TK);%use the rate from Graedel 1981
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));
% 
% i=i+1;%E2  
% Knames{i}   = 'K_H_1p_OH_1m';
% RK25C(i)= 1.3e11;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003 ????????????
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%E3  
Knames{i}   = 'K_HO2';
RK25C(i)= 8.0e5;RKEOR(i) = 6800; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%E4  
Knames{i}   = 'K_H_1p_O2_1m';
RK25C(i)= 5.0e10;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003 ????????????
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%E5  
Knames{i}   = 'K_Fe_3p';
RK25C(i)= 4.7e4;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%E6  
Knames{i}   = 'K_Fe_OH_2p_H_1p';
RK25C(i)= 4.3e8;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003 ????????????
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%E7  
Knames{i}   = 'K_Fe_OH_2p';
RK25C(i)= 1.1e3;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%E8  
Knames{i}   = 'K_Fe_OH2_1p_H_1p';
RK25C(i)= 8.0e9;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003 ????????????
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%E9  
Knames{i}   = 'K_Fe_3p_SO4_2m';
RK25C(i)= 3.2e3;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%E10  
Knames{i}   = 'K_Fe_SO4_1p';
RK25C(i)= 1.8e5;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003 ????????????
krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

% i=i+1;%E11  
% Knames{i}   = 'K_H2SO4';
% RK25C(i)= 5.0e13;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));
% 
% i=i+1;%E12  
% Knames{i}   = 'K_HSO4_1m_H_1p';
% RK25C(i)= 5.0e10;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003 
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

% i=i+1;%E13  
% Knames{i}   = 'K_HSO4_1m';
% RK25C(i)= 1.02e9;RKEOR(i) = -2700; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));
% 
% i=i+1;%E14  
% Knames{i}   = 'K_SO4_2m_H_1p';
% RK25C(i)= 1.0e11;RKEOR(i) = 0; TKCOEF = (298-TK)./(298.*TK);%Ervens 2003 
% krx(:,i) = RK25C(i) * exp(-TKCOEF*RKEOR(i));

i=i+1;%H1  
Knames{i}   = 'K_GHO2';%watch unit
DSURF_HO2 = 1./(RADIUS/DGHO2 + 4./(VAIR*GAMHO2));%1/(cm/cm2/s)=cm/s
HC25C_HO2=2.0e3; HCEOR_HO2=6600; HCT_HO2=HC25C_HO2 .* exp(+TKCOEF.*HCEOR_HO2);%HO2
krx(:,i) = DSURF_HO2.*4.*3.1416.*RADIUS.^2.*HCT_HO2;%rate=DSURF*surface_area_per_volume_air, so the unit is cm3/s/cm3= s-1.
%k*GHO2 would have the unit of 1/s*molecules/cm3=molecules/cm3/s or
%1/s*atm=atm/s
%in order to calculate XHO2 produced in aqueous phase, this can be
%calculated as k*GHO2*HCT_HO2, so the rate becomes M/s.

i=i+1;%H2  
Knames{i}   = 'K_XHO2';%watch unit
%Henry's law constant has unit of M/atm.
krx(:,i) = DSURF_HO2.*4.*3.1416.*RADIUS.^2;%rate=DSURF*surface_area_per_volume_air, so the unit is cm3/s/cm3= s-1.
%k*XHO2 will give M/s 

% accumulate
K = struct;
for i=1:length(Knames)
    K.(Knames{i}) = krx(:,i);
end
