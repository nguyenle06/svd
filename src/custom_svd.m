% =========================
% Custom svd function
% =========================
function [U, S, V] = custom_svd(A)
    [m, n] = size(A);

    % Step 1: Compute A^T * A
    C = transpose(A) * A;

    % Step 2: Eigenvalues decomposition of C
    % V: eigenvectors
    % D: eigenvalues
    [V, D] = eig(C);

    % Step 3: Singular values 
    % Formula: \sigma_i = sqrt(|\lambda_i|)
    singular = sqrt(abs(diag(D))); 

    % Step 4: Sort singular values in descending order
    [singular, idx] = sort(singular, 'descend'); 
    V = V(:, idx);

    % Step 5: Sigma matrix (singular values on the diagonal)
    S = zeros(m, n);
    k = min(m, n);
    S(1:k, 1:k) = diag(singular(1:k));

    % Step 6: Compute U
    % Formula: u_i = (1/\sigma_i) * A * v_i
    U = zeros(m, m);
    for i = 1:n
        if singular(i) > 1e-10 % Avoid division by zero
            U(:, i) = (1/singular(i)) * A * V(:, i);
        end
    end

    % Step 7: Complete orthonormal basis (QR decomposition - make U from almost orthogonal to fully orthogonal)
    [U, ~] = qr(U);

    % Step 8: Recompute V from U after QR decomposition to stay consistent
    % Formula: v_i = (1/sigma_i) * A^T * u_i
    for i = 1:k
        if singular(i) > 1e-10
            V(:, i) = A' * U(:, i) / singular(i);
        end
    end
end