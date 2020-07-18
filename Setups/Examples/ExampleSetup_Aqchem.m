% ExampleSetup_Chamber.m
% This example shows a model setup for simulation of
% a series of photochemical chamber experiments.
% Read comments in each section for a guided tour.
%
% 20151022 GMW

clear

%% METEOROLOGY
%{
Pressure, temperature, and either RH or H2O are required Met inputs.
We will assume them constant throughout the simulation,
  thus we need only specify a single (scalar) value for each.
We have also specified a text file containing a spectral actinic flux (wavelength and photons/cm^2/s),
  which will be used to calculate J-values. This particular spectrum was measured on a real
  chamber (thanks to John Crounse).
%}

Met = {...
%   names       values          
    'P'         1013                       ; %Pressure, mbar
    'T'         298                        ; %Temperature, K
    'RH'        10                         ; %Relative Humidity, percent
    'LFlux'     'ExampleLightFlux.txt'     ; %Text file for radiation spectrum
    'jcorr'     1                          ; %light attenuation factor
    };

%% CHEMICAL CONCENTRATIONS
%{
Imagine that we are simulating a series of three isoprene oxidation experiments, each with
  different NOx conditions. We fill the bag with isoprene, H2O2 (our HOx source), and NO2,
  then turn the lights on and let it run.
Let's assume that initial isoprene and H2O2 are the same for all three runs,
  so we can input them as scalars.
All HoldMe values are set to 0 so that concentrations will evolve.
If you'd rather use CH3ONO as your OH source, add it in below and comment out H2O2.
  Note that this will make more NOx.
%}

InitConc = {...
%   names       conc(M)           HoldMe
    'XH2O2'      7.4e-5                    1;%these numbers calculated below based on Henry's law equlibrium
    'XO2'        2.4e-4                    1;%these numbers calculated below based on Henry's law equlibrium
    'XO3'        3.3e-10                   1;%these numbers calculated below based on Henry's law equlibrium    
    'XHO2'       4.0e-9                    1;%gas-phase HO2, 10 ppt. 
    'XFe_2p'     5.831e-4                  0;
    'XFe_3p'     4.187e-4                  0;
    'XCu_2p'     2.0e-5                    0;
    'XCu_1p'     1.46e-9                   0;
    'XH_1p'      0.1                       1;
    'XOH_1m'     1.0e-13                   1;
    'XHSO4_1m'   0.2                       1;
    'XSO4_2m'    3.0                       1;
    };
       H2O2 = 1.0e-09; % atm
%        HO2 = 1.0e-11;  % atm
       O2 = 0.20;     % atm
       O3 = 3.e-08;   % atm
%set aqueuos Concentrations
Met1      = breakout(Met(:,2),Met(:,1));
InitConc1 = breakout(InitConc(:,2),InitConc(:,1));
TKCOEF = (298-Met1.T)./(298.*Met1.T);
HC25C_O2=1.2e-3; HCEOR_O2=1620;HCT_O2=HC25C_O2 .* exp(+TKCOEF.*HCEOR_O2);%O2
InitConc1.XO2 = HCT_O2.*O2;

HC25C_O3=1.1e-2; HCEOR_O3=2300;HCT_O3=HC25C_O3 .* exp(+TKCOEF.*HCEOR_O3);%O3
InitConc1.XO3 = HCT_O3.*O3;

HC25C_H2O2=7.4e4; HCEOR_H2O2=6615;HCT_H2O2=HC25C_H2O2 .* exp(+TKCOEF.*HCEOR_H2O2);%H2O2
InitConc1.XH2O2 = HCT_H2O2.*H2O2;

%% CHEMISTRY
%{
The ChemFiles input is a cell array of strings
 specifying functions and scripts for the chemical mechanism.
THE FIRST CELL is always a function for generic K-values.
THE SECOND CELL is always a function for J-values (photolysis frequencies).
All other inputs are scripts for mechanisms and sub-mechanisms.
Here we give an example using MCMv3.3.1.  Note that this mechanism was extracted from the MCM website for
the specific set of initial species included above (isoprene and inorganics).
%}

ChemFiles = {...
    'AqueousChem_K(Met)';...
    'AqueousChem_J(Met)';...
    'AqueousChem_allRxns';
    };

%% DILUTION CONCENTRATIONS
% We are not diluting the chamber air, so this input is irrelevant (but still necessary).

BkgdConc = {...
%   names           values
    'DEFAULT'       0;   %0 for all zeros, 1 to use InitConc
    };



%% OPTIONS
%{
"Verbose" can be set from 0-3; this just affects the level of detail printed to the command
  window regarding model progress.
"EndPointsOnly" is set to 0 because we want output to include all concentrations along each model step.
"LinkSteps" is set to 0 because each step is fully independent.
"IntTime" is the integration time for each step. Let's pretend each experiment lasts 3 hours.
"SavePath" will store the output in the default "Runs" folder under the base F0AM directory
"GoParallel" can be utilized since each step is independent (assuming you have the parallel computing toolbox)
%}

ModelOptions.Verbose       = 1;
ModelOptions.EndPointsOnly = 0;
ModelOptions.LinkSteps     = 0;
ModelOptions.IntTime       = 3*36000;
ModelOptions.SavePath      = 'aqExampleOutput.mat';
ModelOptions.GoParallel    = 0;

%% MODEL RUN
% Now we call the model.
% Output will be saved in the "SavePath" above and will also be written to the structure S.
% Let's also throw away the inputs (don't worry, they are saved in the output structure).

S = F0AM_aqModelCore(Met,InitConc,ChemFiles,BkgdConc,ModelOptions);
% clear Met InitConc ChemFiles BkgdConc ModelOptions

%% PLOTTING
% Now, a few examples of how to look at the model output.

% First, let's separate each of the steps since they each represent a different experiment.
% "SplitRun" will make three new structures, S1, S2 and S3, corresponding to each of the
% three steps with different initial NO2 (0.1, 1 and 10 ppbv).

SplitRun(S,'step')

% Next, let's look at some time series for our fav molecules.
% Note that you can also do this yourself with the model output structures,
%   e.g. plot(S1.Time,S1.Conc.C5H8)
% The UWCM-provided functions are just more convenient for comparing multiple simulations.
% Look at the documentation for each function to get an idea of available options.

Splot = {S1};
lnames = {'low'};
PlotConc('XOH',Splot,'lnames',lnames)
PlotConc('XFe_2p',Splot,'unit','percc')
PlotConc('XFe_3p',Splot,'unit','pptv')

% PlotConcGroup(S3.Cnames(S3.iRO2),S3,5,'ptype','fill','unit','ppb','name','RO_2')

% Now, let's dig in and look at the chemistry.

PlotRates('XOH',S1,4,'ptype','fill','unit','ppt_h','sumEq',1);

% pts2avg = S1.Time>1800 & S1.Time<3600; %average 2nd 30 minutes
% PlotRatesAvg('HCHO',S1,5,'ptype','hbar','unit','ppb_h','pts2avg',pts2avg)
% 
% Inorg = {'Inorganic';'CO';'H2';'O3';'HO2';'H2O2'};
% Reactants = {Inorg; 'NO2'; 'C5H8'; 'HCHO'; 'MVK'; 'MACR'};
% PlotReactivity('OH',S3,Reactants,'ptype','line');
% 
% %finally, let's look at the total yield of HPALDs in the low-NOx case
% yieldWindow = [500 1000]; %time window, seconds
% PlotYield(S1,'C5H8',{'C5HPALD1','C5HPALD2'},yieldWindow);
% 
% %% EVENTS
% % Finally, let's say you continue the second experiment for longer, but with more lights.
% 
% [InitConc,Met] = Run2Init(S2,length(S2.Time)); %get initialization values
% 
% %increase jcorr x10
% loc = ismember(Met(:,1),'jcorr');
% Met{loc,2} = 10;
% 
% ModelOptions.IntTime = 3600;
% ModelOptions.SavePath  = 'ChamberExampleHighLightsOutput.mat';
% 
% S2b = F0AM_ModelCore(Met,InitConc,ChemFiles,BkgdConc,ModelOptions);
% 
% S2b.Time = S2b.Time+S2.Time(end);
% figure
% PlotConc('C5H8',{S2,S2b})


