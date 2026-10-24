
%% Heater and water parameters
P_heater = 1500;     % Heater power (W)
m_water  = 2;        % Water mass (kg)
cp       = 4180;     % Specific heat capacity (J/kg/K)
eta      = 1.0;      % Assumed heat-transfer efficiency

%% Environmental conditions
T_initial = 25;      % Initial water temperature (deg C)
T_ambient = 25;      % Ambient temperature (deg C)
UA        = 5;       % Assumed heat-loss coefficient (W/K)

%% Thermostat thresholds
T_low  = 45;         % Heater ON threshold (deg C)
T_high = 50;         % Heater OFF threshold (deg C)

%% Simulation settings
t_stop = 1800;       % Simulation duration (s)
