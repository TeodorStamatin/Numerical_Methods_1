function [path] = heuristic_greedy(start_position, probabilities, Adj)

    n = length(probabilities);

    path = [start_position];
    
    while true

        current_position = path(end);

        if current_position == n - 1
            break;
        end

        heuristic_values = zeros(1, n);
        
        for i = 1:n
            if Adj(current_position, i)
                if i == n
                    heuristic_values(i) = probabilities(i);
                elseif i == n - 1
                    heuristic_values(i) = probabilities(i);
                else
                    heuristic_values(i) = probabilities(i) + probabilities(n) * (n - i - 1);
                end
            end
        end

        [~, index] = max(heuristic_values);

        path = [path, index];
end
    