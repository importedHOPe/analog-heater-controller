# Analog Heater Controller

A microcontroller-free thermostat concept for automating an immersion water heater using analog electronics, supported by a MATLAB/Simulink thermal model.

> **Status:** Early-stage simulation baseline. Results are simulated, not experimentally validated.

## Motivation
This project explores temperature-based switching to reduce unnecessary heating when an immersion heater is left powered longer than intended. It is an educational prototype/model, not a certified safety device.

## Current simulation baseline
- Initial water temperature: 25 °C
- Thermostat thresholds: ON below 45 °C; OFF above 50 °C
- Duration: 1,800 s (30 min)
- Modelled heater rating: 1,500 W
- Simulated electrical energy: 0.1108 kWh
- Simulated average electrical power: 221.7 W
- Simulated heater ON time: 266 s (14.78% of duration)

See [`results/current-baseline.csv`](results/current-baseline.csv). These values are transcribed from the current Simulink screenshots and should be checked against the saved model before being treated as a reproducible benchmark.

## Model
The current first-order lumped model is:

<p align="center">
  <img src="https://latex.codecogs.com/svg.image?\dpi{150}\color{White}m_w%20c_p%20\frac{dT_w}{dt}%20=%20\eta%20P_h%20u%20-%20UA(T_w-T_a)" alt="Thermal energy balance equation" />
</p>

where `m_w` is water mass, `cp` is water specific heat, `Tw` is water temperature, `Ta` is ambient temperature, `Ph` is heater electrical power, `u` is heater state (0/1), `eta` is the assumed heat-transfer fraction, and `UA` is the overall heat-loss coefficient.

Top-level functional sections:
1. Thermostat hysteresis relay
2. Heater heat input (`η × heater power × u`)
3. Heat-loss estimate (`UA × temperature difference`)
4. Net heat flow, gain `1/(m_water × cp_water)`, and temperature integrator
5. Electrical energy integrator and result conversions


## Software Requirements

- **MATLAB:** 26.1.0.3312084 (R2026a) Update 4
- **Simulink:** Version 26.1 (R2026a)
- **Operating system:** Windows 11

### Running the Model

1. Open the project folder in MATLAB.
2. Run `heater_parameters.m` to initialise the model parameters.
3. Open `simulink/thermostate.slx`.
4. Run the simulation with a stop time of 1800 seconds.
5. Compare the temperature and heater-state scopes with the documented baseline results.


## Repository layout
- `heater_parameters.m`: defines the MATLAB workspace parameters
- `simulink/`: manually organised Simulink model (`.slx`)
- `docs/`: equations, assumptions, safety notes
- `results/`: recorded simulation results
- `images/`: clean block-diagram screenshots and plots
  
## Reproduce
Open the `.slx` model in a compatible MATLAB/Simulink release, confirm parameters and stop time, then run. Exact reproducibility requires the actual model and its parameter values; screenshots alone are insufficient.

## Planned work
- [ ] Add the actual `.slx` model and MATLAB/Simulink version.
- [ ] Add clean diagram and plot exports.
- [ ] Document all parameters and justify `UA` and `η`.
- [ ] Add continuous-ON baseline using the same thermal plant.
- [ ] Run sensitivity analysis for uncertain parameters.
- [ ] Add boiling/evaporation only after validating the current model.
- [ ] Document the analog sensor/comparator/latch/relay circuit.
- [ ] Add hardware measurements only after safe, instrumented validation.

## Safety
Mains-powered immersion heaters near water can cause fatal electric shock, burns, fire, or equipment damage. This project is not a certified controller. Never leave a prototype unattended or bypass built-in protection. A physical mains implementation requires qualified review, proper isolation/enclosure, rated switching and overcurrent protection, and independent over-temperature and dry-run protection.

## License
See [MIT License](LICENSE). This license does not grant rights to MATLAB/Simulink or third-party software.
