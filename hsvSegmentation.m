function [maskedRGBImage,BW] = hsvSegmentation(RGB, HMin, HMax, SMin, SMax, VMin, VMax)
%createMask  Threshold RGB image using auto-generated code from colorThresholder app.
%  [BW,MASKEDRGBIMAGE] = createMask(RGB) thresholds image RGB using
%  auto-generated code from the colorThresholder app. The colorspace and
%  range for each channel of the colorspace were set within the app. The
%  segmentation mask is returned in BW, and a composite of the mask and
%  original RGB images is returned in maskedRGBImage.

%------------------------------------------------------


% Convert RGB image to chosen color space
I = rgb2hsv(RGB);


% Create mask based on chosen histogram thresholds
if HMin < HMax
    sliderBW = ( (I(:,:,1) >= HMin) & (I(:,:,1) <= HMax) ) & ...
        (I(:,:,2) >= SMin ) & (I(:,:,2) <= SMax) & ...
        (I(:,:,3) >= VMin ) & (I(:,:,3) <= VMax);
else % when HMin > HMax, there are 2 parts for H Channel. Note that H is a circle
    sliderBW = ( (I(:,:,1) >= HMin) | (I(:,:,1) <= HMax) ) & ...
        (I(:,:,2) >= SMin ) & (I(:,:,2) <= SMax) & ...
        (I(:,:,3) >= VMin ) & (I(:,:,3) <= VMax);
end

BW = sliderBW;

% Initialize output masked image based on input image.
maskedRGBImage = RGB;

% Set background pixels where BW is false to zero.
maskedRGBImage(repmat(~BW,[1 1 3])) = 0;

end
