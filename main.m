% need N values
N = [];

% Plot outputs for integral approximations

figure()
plot(N, midpoint(N), 'b');
hold on
plot(N, trapezoid(N), 'r');
plot(N, simpsons(N), 'g');
plot(N, monte_carlo(N), 'k');
xlabel('Values of N');
ylabel('Approximation Value');

% Plot errors?