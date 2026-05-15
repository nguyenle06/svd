% =========================
% Frobenius error
% =========================
function err = calculate_frobenius_error(original, reconstructed)
    diff = original - reconstructed;
    err = sqrt(sum(diff(:).^2));
end

% =========================
% Data retention ratio
% =========================
function ratio = calculate_data_retention(shape, k)
    m = shape(1); n = shape(2);
    channels = 1;
    if numel(shape) == 3
        channels = shape(3);
    end
    ratio = (k * (m + n + 1) * channels) / (m * n * channels) * 100;
end