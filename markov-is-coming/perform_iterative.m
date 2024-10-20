function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)

    x = x0;

    err = Inf;

    steps = 0;
    
    while err > tol && steps < max_steps

        x_prev = x;

        x = G * x + c;

        err = norm(x - x_prev);

        steps = steps + 1;

    end
end
    