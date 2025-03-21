%   Copyright 2025, Renjie Chen @ USTC


%% read image
im = imread('peppers.png');

%% draw 2 copies of the image
fig=figure('Units', 'pixel', 'Position', [100,100,1000,700], 'toolbar', 'none');
subplot(121); imshow(im); title({'Input image'});
subplot(122); himg = imshow(im*0); title({'Resized Image', 'Use the blue button to resize the input image'});
hToolResize = uipushtool('CData', reshape(repmat([0 0 1], 100, 1), [10 10 3]), 'TooltipString', 'apply seam carving method to resize image', ...
                        'ClickedCallback', @(~, ~) set(himg, 'cdata', seam_carve_image(im, size(im,1:2)-[0 300])));

%% TODO: implement function: searm_carve_image
% check the title above the image for how to use the user-interface to resize the input image
function im = seam_carve_image(im, sz)

    % im = imresize(im, sz);

    costfunction = @(im) sum( imfilter(im, [.5 1 .5; 1 -6 1; .5 1 .5]).^2, 3 );

    k = size(im,2) - sz(2);
    for i = 1:k
        G = costfunction(im);
        %% find a seam in G

        %% remove seam from im
    end

end