function [totalArea,meanArea, maxLeafArea,numLeaves, centroids, individualArea, individualPerimeter,boxMaxLeaf, boxesAllLeaves] = leafArea(BW, bIndividualArea, bIndividualPerimeter, bMaxLeafBBox, bAllLeafBBoxes)
% calculate leaf area, numer of leaves in a given BW region
% Input: BW image, bIndividualArea (whether to output individual areas)
% Output: leaf meta info in the input BW image
% Author: Tao Hu, APPF Nov 2022
%------------------------------------------------------
properties = ["Area", "PixelIdxList"];
if bIndividualArea || bIndividualPerimeter
    properties = [properties, "Centroid"];
end

if bIndividualPerimeter
     properties = [properties, "Perimeter"];
end

 stats = regionprops(BW,properties);


numLeaves = numel([stats.Area]); % length of Area list is the number of leaves

if numLeaves < 1  % in case no leaf
    totalArea = 0;
    meanArea = 0;
    maxLeafArea = 0;
    boxMaxLeaf = zeros(1,5);
    boxesAllLeaves = zeros(1,5);
    return;
end

[maxLeafArea, maxIndex] = max([stats.Area]);
totalArea = sum([stats.Area]);
meanArea = totalArea/numLeaves;

if bIndividualArea || bIndividualPerimeter
    centroids = [stats.Centroid]; % Note centroids format: (x1,y1,x2,y2.....)    
else
    centroids = 0;
end

if bIndividualArea
    individualArea = [stats.Area];
else
    individualArea = 0;
end

if bIndividualPerimeter
    individualPerimeter = [stats.Perimeter];
else
    individualPerimeter = 0;
end

% show oriented box


if bMaxLeafBBox
    maxLeafBW = zeros(size(BW));
    maxLeafPixellist = stats(maxIndex).PixelIdxList;
    maxLeafBW(maxLeafPixellist) = 1; % maxLeafBW only has the max leaf
    boxMaxLeaf = getOrientedBox(maxLeafBW);
else
    boxMaxLeaf = [];
end

if bAllLeafBBoxes
    boxesAllLeaves = [];
    for i=1:numLeaves
        LeafBW = zeros(size(BW));
        LeafPixellist = stats(i).PixelIdxList;
        LeafBW(LeafPixellist) = 1; % maxLeafBW only has the max leaf
        box = getOrientedBox(LeafBW);
        boxesAllLeaves = [boxesAllLeaves;box];
    end
else
    boxesAllLeaves = [];
end

end
