% =========================
% Compress single channel
% =========================
function reconstructed = compress_channel_svd(channel, k)
    [U, S, V] = svd(channel, 'econ');
    reconstructed = U(:,1:k) * S(1:k,1:k) * V(:,1:k)';
end

% =========================
% Compress image
% =========================
function reconstructed_img = compress_image_svd(image, k)
    if ndims(image) == 3
        r = compress_channel_svd(image(:,:,1), k);
        g = compress_channel_svd(image(:,:,2), k);
        b = compress_channel_svd(image(:,:,3), k);
        reconstructed_img = cat(3, r, g, b);
    else
        reconstructed_img = compress_channel_svd(image, k);
    end
    reconstructed_img = min(max(reconstructed_img, 0), 1);
end