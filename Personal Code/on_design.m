function [state,component,design, input, performance] = on_design(T,A0,pitotal,alpha,beta,Pto,h_PR,year)

state = {'Station','Relative Pressure', ' Temperature (K)', 'Fuel to air ratio','Mass Flow (kg/s)','Cp (J/kg-K)', 'Gamma', 'Enthalpy (J/kg)', 'Entropy (J/kg-K)','Gas Constant (m^2/s^2*K)','Relative Density(kg/m^3)','Relative Volume(s*m^3??)'};
state(2:22,1) = {'0';'o0';'o2';'o13';'o2.5';'o3';'o3.1';'o4';'o4.1';'o4.4';'o4.5';'o5';'o6';'o6A';'o7';'o9';'9';'beta';'eptot';'ep1';'ep2'};
component = {'Component','Pressure Ratio','Polytropic Efficieny','Enthalpy Ratio', 'Mechanical/Combustion Efficiency'};
component(2:17,1) = {'Ram Recovery';'Inlet(Ideal,Actual)';'Fan';'LP Compressor';'HP Compressor';'Main Burner';'Coolant Mixer 1';'HP Turbine';'HP Takeoff';'Coolant Mixer 2';'LP Turbine';'LP Takeoff';'Mixer';'Afterburner';'Nozzle';'Overall'};
design = {'Parameter','Value'};
design(2:8,1) = {'alpha';'beta';'epsilon1';'epsilon2';'PtoL';'PtoH';'h_PR'};
inputs = {'Parameter','Value'};
inputs(2:8,1) = {'Altitude (m)','Mach Number','F/mdot','Mass Flow Rate (kg/s)','SFC (kg/s/N)','Max Burner Temp (K)','Po9/P9'};



Po9_Po0 = pitotal;
pi_f  = 3; % Use equations later, but rn we dont have anything for a super high bypass engine (alpha > 10)
pi_d = 1; %Function of year
Po19_Po0 = pi_f*pi_d;


alt = inputs{2,2};
M0 = inputs{3,2};
[T0, ~, ~, rho] = atmosisa(0);
state(2,3) = {T0};
state(2,4) = {0};
[state] = unFAIR3(state,2);
[~,~,T0,~,~,cp0,gamma0,~,~] = state{2,:};
R0 = cp0 - cp0/gamma0;
a0 = sqrt(R0*gamma0*T0); %[m/s]

To0 = T0*(1+((M0^2)*((gamma0-1)/2))); %find total temperature using isentropic


while v_error > .001
    M0 = v0/a0;
    mdot0 = rho*v0*A0;
    mdot9 = mdot0/(1+alpha);
    mdot19 = mdot0 - mdot9;
    

end



F = mdot19*v19 +mdot9*v9 - mdot0*v0;

T_Max
A0
pitotal
Pto
year

outputArg1 = inputArg1;
outputArg2 = inputArg2;
end

