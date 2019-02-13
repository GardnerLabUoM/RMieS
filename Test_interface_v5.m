%% Loading the data etc

clear; 
close all; 
clc

load Simulated_Sept

ZRaw = Sc_Spectra.d(1,:);   % This runs the algorithm for just 1 spectrum but there are more 
WN = str2num(Q.v);  %#ok<ST2NM>
clear Q Sc_Spectra Spectra n

%% Correction options

correction_options = [ ...
    0    ;      % 1. Desired resolution, (0 keeps original resolution)
    1000 ;      % 2. Lower wavenumber range (min value is 1000)
    2300 ;      % 3. Upper wavenumber range (max value is 2300)
    10   ;      % 4. Number of iterations
    2    ;      % 5. Mie theory option (smooth or RMieS)
    7    ;      % 6. Number of principal components used (7 default)
    2    ;      % 7. Lower range for scattering particle diameter / um
    8    ;      % 8. Upper range for scattering particle diameter / um
    1.1  ;      % 9. Lower range for average refractive index
    1.5  ;      % 10. Upper range for average refractive index
    10   ;      % 11. Number of values for each scattering parameter (a,b,d) default 10
    1    ;      % 12. Gram-Schmidt Process option, 0 = no, 1 = yes. (1 recommended)
    1   ];      % 13. Which reference spectrum, 1 = Matrigel, 2 = Simulated Spectrum

%% The actual correction
[WN_corr,ZCorr_m,history] = RMieS_EMSC_v5(WN, ZRaw, correction_options);

%% Plotting results
plot( WN_corr , ZCorr_m )
