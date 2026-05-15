% =========================
% Frobenius error
% =========================
function err = calculate_frobenius_error(original, reconstructed)
diff = original - reconstructed;
err = sqrt(sum(diff(:).^2));
end