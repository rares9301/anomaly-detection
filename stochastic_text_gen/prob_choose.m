## DO NOT MODIFY!
function retval = prob_choose (weights, wset)
    % normalize weight vector
    probabilities = weights / sum(weights);

    % random 0-1
    randNum = rand();

    % probabilitate cumulata
    cumulativeProb = 0;

    % iterate through normalized 
    for i = 1:length(probabilities)
        % number in range?
        if randNum >= cumulativeProb && randNum < cumulativeProb + probabilities(i)
            randomNumber = i;
            retval = wset{randomNumber}
            return;
        end
        % update probability
        cumulativeProb = cumulativeProb + probabilities(i);
    end
    retval = wset{length(probabilities)}
endfunction
