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