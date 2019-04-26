function misses = misses(classes, missesMatrix)
    total = sum(sum(missesMatrix))
    A = ones(classes);
    cancelMatrix = tril(A,-1) + tril(A,-1)';
    misses = sum(sum(missesMatrix.*cancelMatrix))