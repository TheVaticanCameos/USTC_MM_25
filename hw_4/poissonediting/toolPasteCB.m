function toolPasteCB(varargin)

hpolys = evalin('base', 'hpolys');

roi = hpolys(1).Position();
targetPosition = roi + ceil(hpolys(2).Position - roi);

im1 = evalin('base', 'im1');
im2 = evalin('base', 'im2');
himg = evalin('base', 'himg');

imdst = blendImagePoisson(im1, im2, roi, targetPosition);
set(himg, 'CData', imdst);
