# Current Simulink model

## Signal flow
1. Thermostat Relay generates `u` (1 = ON, 0 = OFF).
2. Heater rating and efficiency produce heat input.
3. Water temperature minus ambient temperature produces the temperature difference.
4. `UA` estimates heat loss.
5. Net heat flow is multiplied by `1/(m_water * cp_water)` and integrated to obtain `T_W`.
6. Electrical power is integrated separately to obtain electrical energy.

## Equations
\[
Q_{in}=\eta P_h u
\]
\[
Q_{loss}=UA(T_w-T_a)
\]
\[
\frac{dT_w}{dt}=\frac{Q_{in}-Q_{loss}}{m_w c_p}
\]
\[
E_{elec}(t)=\int_0^t P_h u(\tau)\,d\tau
\]

For constant heater rating, equivalent ON time is `E_elec/P_h`; average power is `E_elec/t_stop`; duty cycle is `100 E_elec/(P_h t_stop)`.

## Baseline screenshot values
The scope shows warm-up from 25 °C and cycling between 45 °C and 50 °C. The Results subsystem shows 3.99e5 J, 0.1108 kWh, 221.7 W average, 14.78% duty cycle, and 266 s equivalent ON time. These are displayed simulated values and should be verified against the saved model.
