## DO NOT MODIFY!
function retval = prob_choose (weights, wset)
    % Normalize the weight vector
    probabilities = weights / sum(weights);

    % Generate a random number between 0 and 1
    randNum = rand();

    % Initialize cumulative probability
    cumulativeProb = 0;

    % Iterate over elements of the normalized weight vector
    for i = 1:length(probabilities)
        % Check if the random number falls into the range
        if randNum >= cumulativeProb && randNum < cumulativeProb + probabilities(i)
            randomNumber = i;
            retval = wset{randomNumber}
            return;
        end
        % Update cumulative probability
        cumulativeProb = cumulativeProb + probabilities(i);
    end
    retval = wset{length(probabilities)}
endfunction
