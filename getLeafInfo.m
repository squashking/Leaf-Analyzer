function getLeafInfo(imgDir)
% calculate leaf meta info (area, numer of leaves etc.) for all the images
% under a folder and save results to .csv file
% Input: Image folder directory
% Output: no. results saved to file
% Author: Tao Hu, APPF Nov 2022
%------------------------------------------------------

clear; close all;

imgDir = "img";
% get all files
fileList = dir(fullfile(imgDir, '*.jpg'));

for id = 1:numel(fileList)
    [pathstr,imgName,ext] = fileparts(fileList(id).name);
    fprintf('id =%d img =%s \n',id, imgName);


    RGB = imread(imgDir + "/" + fileList(id).name);
    [rows, columns, nChannel] = size(RGB); % for later use
    BW = im2bw(RGB,0.45);
    imwrite(BW,imgName+"_bw_frame.png");

    corners = detectFrame(BW); % frame corners (Y,X)

    % visualize vertices
    fig = figure;
    imshow(RGB);
    hold on
    plot( corners(:,2),corners(:,1),'yo','MarkerFaceColor','r',...
                                    'MarkerSize',12,'LineWidth',2);

    fig.Renderer = 'painters'; % render the points as vector, good for zoom-in
    exportgraphics(gcf,imgName+"_corners.eps");
    hold off

    cornersSorted = sortrows(corners,2); % order by x coordinates, small to big, the first 2 will be the left 2 vertices
        
    if cornersSorted(1,1) < cornersSorted(2,1) % compare y coordinates
        cornerTopLeft = cornersSorted(1,:);
        cornerBotLeft = cornersSorted(2,:);
    else        
        cornerTopLeft = cornersSorted(2,:);
        cornerBotLeft = cornersSorted(1,:);
    end

    if cornersSorted(3,1) < cornersSorted(4,1) % compare y coordinates
        cornerTopRight = cornersSorted(3,:);
        cornerBotRight = cornersSorted(4,:);
    else        
        cornerTopRight = cornersSorted(4,:);
        cornerBotRight = cornersSorted(3,:);
    end


    frameWidthInPixel = norm(cornerBotRight-cornerBotLeft);
    frameHeightInPixel = norm(cornerBotLeft - cornerTopLeft); 


    boxWidthInMeter = 0.159;
    boxHeightInMeter = 0.218;

    %scales in X and Y direction, how many meters per pixel
    scaleX = boxWidthInMeter/frameWidthInPixel;
    scaleY = boxHeightInMeter/frameHeightInPixel;
    pixelArea = scaleX*scaleY; % area per pixel

    %predefined grid positions in meters, wrt the upper left corner of the main
    %frame
    p1BBoxInMeter = [0.002 0.002 0.0795 0.0715];
    p2BBoxInMeter = [0.002 0.002+0.0715 0.0795 0.0715];
    p3BBoxInMeter = [0.002 0.002+0.0715*2 0.0795 0.0715];
    s1BBoxInMeter = [0.002+0.0795 0.002 0.0795 0.0715];
    s2BBoxInMeter = [0.002+0.0795 0.002+0.0715 0.0795 0.0715];
    s3BBoxInMeter = [0.002+0.0795 0.002+0.0715*2 0.0795 0.0715];
    
    topMiddle = (cornerTopLeft+cornerTopRight)/2;
    botMiddle = (cornerBotLeft+cornerBotRight)/2;
    
    polygonP1 = [cornerTopLeft;topMiddle; topMiddle+(botMiddle-topMiddle)/3;  cornerTopLeft+(cornerBotLeft-cornerTopLeft)/3];
    polygonMaskP1 = poly2mask(polygonP1(:,2),polygonP1(:,1),rows, columns);
    
    polygonP2 = [polygonP1(4,:);polygonP1(3,:); topMiddle+(botMiddle-topMiddle)*2/3; cornerTopLeft+(cornerBotLeft-cornerTopLeft)*2/3];
    polygonMaskP2 = poly2mask(polygonP2(:,2),polygonP2(:,1),rows, columns);

    polygonP3 = [polygonP2(4,:);polygonP2(3,:); botMiddle; cornerBotLeft];
    polygonMaskP3 = poly2mask(polygonP3(:,2),polygonP3(:,1),rows, columns);

    polygonS1 = [topMiddle;cornerTopRight; cornerTopRight+(cornerBotRight-cornerTopRight)/3;polygonP1(3,:)];
    polygonMaskS1 = poly2mask(polygonS1(:,2),polygonS1(:,1),rows, columns);

    polygonS2 = [polygonS1(4,:);polygonS1(3,:); cornerTopRight+(cornerBotRight-cornerTopRight)*2/3; polygonP2(3,:)];
    polygonMaskS2 = poly2mask(polygonS2(:,2),polygonS2(:,1),rows, columns);

    polygonS3 = [polygonS2(4,:);polygonS2(3,:); cornerBotRight; botMiddle];
    polygonMaskS3 = poly2mask(polygonS3(:,2),polygonS3(:,1),rows, columns);
   

    % Convert RGB image to chosen color space
    I = rgb2hsv(RGB);

    % Define thresholds for channel 1 based on histogram settings
    channel1Min = 0.217;
    channel1Max = 0.421;
    
    % Define thresholds for channel 2 based on histogram settings
    channel2Min = 0.329;
    channel2Max = 0.826;
    
    % Define thresholds for channel 3 based on histogram settings
    channel3Min = 0.065;
    channel3Max = 0.663;

    % Create mask based on chosen histogram thresholds
    sliderBW = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
        (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
        (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
    

    imwrite(sliderBW,imgName+"_bw_seg.png");

    % fill holes
    
    filledBW = imfill(sliderBW,"holes");
    imwrite(filledBW,imgName+"_bw_filled.png");

    % remove small non-leaf regions
    minLeafPixels = 100;
    CC = bwconncomp(filledBW); % connected components struct
    stats = regionprops(CC,"Area"); % region property
    idx = find([stats.Area] > minLeafPixels); % region with pixel number obove threshold. idx is region idx not pixel idx
    L = labelmatrix(CC);
    onlyLeafBW = ismember(L,idx); % BW with non-leaf region removed
    imwrite(onlyLeafBW,imgName+"_bw_onlyleaf.png");

    % generate RGB with leaf boundary
    boundaryRGB = RGB;
    boundary3D = zeros(size(RGB)); % initialize zero matrix
    boundary3D(:,:,1) = bwperim(onlyLeafBW); % make first channel to be the bw boundary
    boundaryRGB(logical(boundary3D)) = 255; % make the boundary red, must convert 0/1 to logical first
    imwrite(boundaryRGB,imgName+"_RGB_boundary.png");

    % generate RGB with only leaves
    maskedRGB = RGB;    
    maskedRGB(repmat(~onlyLeafBW,[1 1 3])) = 0; % Set background pixels where BW is false to zero.
    imwrite(maskedRGB,imgName+"_RGB_masked.png");


%     BWCroppedP1 = imcrop(onlyLeafBW,p1BBoxInPixel);
    BWCroppedP1 = onlyLeafBW & polygonMaskP1;
    [totalAreaP1,maxLeafAreaP1,numLeavesP1,oBBoxP1] = leafArea(BWCroppedP1);

%     imshow(BWCroppedP1); 

    BWCroppedP2 = onlyLeafBW & polygonMaskP2;
    [totalAreaP2,maxLeafAreaP2,numLeavesP2,oBBoxP2] = leafArea(BWCroppedP2);

    BWCroppedP3 = onlyLeafBW & polygonMaskP3;
    [totalAreaP3,maxLeafAreaP3,numLeavesP3,oBBoxP3] = leafArea(BWCroppedP3);

    BWCroppedS1 = onlyLeafBW & polygonMaskS1;
    [totalAreaS1,maxLeafAreaS1,numLeavesS1,oBBoxS1] = leafArea(BWCroppedS1);

    BWCroppedS2 = onlyLeafBW & polygonMaskS2;
    [totalAreaS2,maxLeafAreaS2,numLeavesS2,oBBoxS2] = leafArea(BWCroppedS2);

    BWCroppedS3 = onlyLeafBW & polygonMaskS3;
    [totalAreaS3,maxLeafAreaS3,numLeavesS3,oBBoxS3] = leafArea(BWCroppedS3);

   

    fprintf('numLeaves= %d, Total area=%d, Max area=%d\n',numLeavesP3, totalAreaP3, maxLeafAreaP3);

    % concatenate oriented bounding boxes
    oBBox = [];
    annotationText = {};
    if numLeavesP1 > 0
        oBBox = [oBBox; oBBoxP1];
    end
    if numLeavesP2 > 0
        oBBox = [oBBox; oBBoxP2];
    end
    if numLeavesP3 > 0
        oBBox = [oBBox; oBBoxP3];
    end
    if numLeavesS1 > 0
        oBBox = [oBBox; oBBoxS1];
    end
    if numLeavesS2 > 0
        oBBox = [oBBox; oBBoxS2];
    end
    if numLeavesS3 > 0
        oBBox = [oBBox; oBBoxS3];
    end

    inPixel = false;
    for iBox = 1:size(oBBox,1)
        if inPixel
            text = sprintf('L:%.0f W:%.0f',oBBox(iBox,3),oBBox(iBox,4));
        else
            text = sprintf('L:%.0f W:%.0f',oBBox(iBox,3)*scaleY*1000,oBBox(iBox,4)*scaleX*1000);
        end
        annotationText{end+1} = text;
    end

    % show oriented bounding boxes and annotations
    onlyLeafBWRGB = 255 * repmat(uint8(onlyLeafBW),1,1,3);
    annotationPosition = [oBBox(:,1) oBBox(:,2)];
    onlyLeafAnnotation = insertText(onlyLeafBWRGB,annotationPosition,annotationText,'AnchorPoint','center',FontSize=88,BoxOpacity=0.4,TextColor="red");
    

    imshow(onlyLeafAnnotation); 
    hold on;
    drawOrientedBox(oBBox, 'linewidth', 2, 'color', 'g');
    hold off;


    % extract text via OCR
    % first estimate the text area    
    if cornerTopRight(1) > cornerTopLeft(1) % topright corner is lower
        textRegionHeight = cornerTopRight(1);
    else
        textRegionHeight = cornerTopLeft(1);
    end
    textRegion = [cornerTopLeft(2), 1, cornerTopRight(2)-cornerTopLeft(2), textRegionHeight];   
    
    structOCR = ocr(BW,textRegion,'TextLayout', 'Word','CharacterSet','PID0123456789');
    if isempty(structOCR.WordBoundingBoxes) % in case no text is detected
        disp("No text detected in the image!");
        return;
    end

    % show recognized text, annotate, save
    imgAnnotate = insertObjectAnnotation(RGB,"rectangle",...
            structOCR.WordBoundingBoxes,structOCR.Words,LineWidth=5,FontSize=72);
    imwrite(imgAnnotate,imgName+"_ocr.png");

    textPlantID = strtrim(structOCR.Text); % trim white spaces



    PlantID = {textPlantID};
    ImageID = {imgName};
    P1Area = round([totalAreaP1*pixelArea*1000000]);    
    P1Num = numLeavesP1;
    P1MaxLeafArea = round([maxLeafAreaP1*pixelArea*1000000]);
    P1MaxLeafLength = round([oBBoxP1(3)*scaleY*1000]);

    P2Area = round([totalAreaP2*pixelArea*1000000]);
    P2Num = numLeavesP2;
    P2MaxLeafArea = round([maxLeafAreaP2*pixelArea*1000000]);
    P2MaxLeafLength = round([oBBoxP2(3)*scaleY*1000]);

    P3Area = round([totalAreaP3*pixelArea*1000000]);
    P3Num = numLeavesP3;
    P3MaxLeafArea = round([maxLeafAreaP3*pixelArea*1000000]);
    P3MaxLeafLength = round([oBBoxP3(3)*scaleY*1000]);

    S1Area = round([totalAreaS1*pixelArea*1000000]);
    S1Num = numLeavesS1;
    S1MaxLeafArea = round([maxLeafAreaS1*pixelArea*1000000]);
    S1MaxLeafLength = round([oBBoxS1(3)*scaleY*1000]);

    S2Area = round([totalAreaS2*pixelArea*1000000]);
    S2Num = numLeavesS2;
    S2MaxLeafArea = round([maxLeafAreaS2*pixelArea*1000000]);
    S2MaxLeafLength = round([oBBoxS2(3)*scaleY*1000]);

    S3Area = round([totalAreaS3*pixelArea*1000000]);
    S3Num = numLeavesS3;
    S3MaxLeafArea = round([maxLeafAreaS3*pixelArea*1000000]);
    S3MaxLeafLength = round([oBBoxS3(3)*scaleY*1000]);
    

    T = table(PlantID,ImageID,P1Area,P1Num,P1MaxLeafArea,P1MaxLeafLength,P2Area,P2Num,P2MaxLeafArea,P2MaxLeafLength,P3Area,P3Num,P3MaxLeafArea,P3MaxLeafLength,S1Area,S1Num,S1MaxLeafArea,S1MaxLeafLength,S2Area,S2Num,S2MaxLeafArea,S2MaxLeafLength,S3Area,S3Num,S3MaxLeafArea,S3MaxLeafLength);
    writetable(T,'leaf_info.xls','WriteRowNames',true,'WriteMode','Append');


end % image file loop ends
end % function ends