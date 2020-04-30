
% need N values
N = [10, 20, 50, 100, 200, 500, 1000, 2000, 3000, 4000];

mpt = midpoint(N);
tpd = trapezoid(N);
sps = simpsons(N);
mtc = monte_carlo(N); 
mptE = FindErrors(mpt);
tpdE = FindErrors(tpd);
spsE = FindErrors(sps);
mtcE = FindErrors(mtc);

% Plot outputs for integral approximations 

% All on one graph, entire interval  
title = 'Approximation - All Methods'; 
plotOverInterval(mpt, tpd, sps, mtc, title, 0, 4000, N, 'Approximation Value');

% All on one graph, from 10 to 200 
title = 'Approximation - All Methods - from 10 to 200';
plotOverInterval(mpt, tpd, sps, mtc, title, 10, 200, N, 'Approximation Value');

% All on one graph, from 10 to 100 
title = 'Approximation - All Methods - from 10 to 100';
plotOverInterval(mpt, tpd, sps, mtc, title, 10, 100, N, 'Approximation Value');

% Plot results, separate subplots, all in one figure 
title = 'Approximation - All Methods';
plotSubplots(mpt, tpd, sps, mtc, title, N);

% Plot errors - all on one graph 
title = 'Error - All Methods';
plotOverInterval(mptE, tpdE, spsE, mtcE, title, 0, 4000, N, 'Error');

% Plot errors, each method in separate subplot
title = 'Error - All Methods';
plotSubplots(mptE, tpdE, spsE, mtcE, title, N);


function error = FindErrors(approxSol)
    f = @(x) 2 + sin((2*sqrt(x)));
    exact = integral(f, 1, 6);
    error = zeros(size(approxSol));
    for i=1:length(approxSol)
        error(i) = abs(approxSol(i) - exact);
    end
end

function plotOverInterval(mpt, tpd, sps, mtc, t, a, b, N, label)
    figure()
    plot(N, mpt, 'b'); % blue 
    hold on
    plot(N, tpd, 'r');
    hold on
    plot(N, sps, 'g');
    hold on
    plot(N, mtc, 'k'); % black
    hold off
    title(t);
    xlabel('Values of N');
    ylabel(label);
    legend('Midpoint', 'Trapezoid', 'Simpsons', 'Monte Carlo');
    xlim([a b]);
end

function plotSubplots(mpt, tpd, sps, mtc, t, N)
    figure()
    sgtitle(t);
    subplot(2, 2, 1);
    plot(N, mpt, 'b');
    title('Midpoint');
    subplot(2, 2, 2);
    plot(N, tpd, 'b');
    title('Trapezoid');
    subplot(2, 2, 3);
    plot(N, sps, 'b');
    title('Simpsons');
    subplot(2, 2, 4);
    plot(N, mtc, 'b');
    title('Monte Carlo');
end