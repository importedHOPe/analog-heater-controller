# Simulink Model

The `thermostate.slx` model implements the current thermal simulation and hysteresis-based heater control.

## Model structure

The model is organised into separate functional blocks for:

- **Thermostat:** switches the heater using the 45 °C and 50 °C thresholds.
- **Heat input:** calculates the heat supplied by the heater.
- **Heat loss:** estimates thermal losses using the overall coefficient `UA`.
- **Water temperature:** calculates net heat flow and integrates the temperature derivative.
- **Energy accounting:** integrates electrical power and calculates energy consumption, average power, duty cycle, and equivalent heater ON time.

## Files

- `thermostate.slx` — Simulink model.
- `../heater_parameters.m` — MATLAB script defining the model parameters.

## Model limitations

The current model uses a first-order lumped thermal representation with a single water-temperature state. Its heat-loss coefficient and heat-transfer efficiency are assumed parameters. Boiling, evaporation, spatial temperature gradients, and experimental validation are not yet included.

See the [root README](../README.md) for the project overview, governing equation, baseline results, software requirements, and planned work.
