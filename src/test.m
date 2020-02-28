thrust_c_params = [1.5; 2.5];
kp = 6; kd = 1.75;
phy_c_params = [kp; kd];
theta_c_params = [kp; kd];
psy_c_params = [kp; kd];
controllers = construct_controllers(thrust_c_params, phy_c_params, theta_c_params, psy_c_params);

x = [0; 0; 0];
xdot = [0; 0; 0];
theta = deg2rad([10; 10; 10]);
thetadot = deg2rad([0; 0; 5]);
init_state = struct('x', x, 'xdot', xdot, 'theta', theta, 'thetadot', thetadot);

desired_z = 10;
desired_zdot = 10;
desired_theta = deg2rad([0; 0; 20]);
desired_thetadot = deg2rad([0; 0; 0]);
desired_state = struct('z', desired_z, 'zdot', desired_zdot, 'theta', desired_theta, 'thetadot', desired_thetadot);

plot_data(simulate(controllers, desired_state, init_state, 0, 10, 0.001));