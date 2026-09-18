function [corners] = detectFrame(BW)
% detect the main frame in the image.
% input is RGB image
% output is bounding box of the biggest region
%------------------------------------------------------


% Detect rectangle region (inside the line)
%BW = imclearborder(~BW);
BW = imfill(~BW,"holes"); % fill holes to make the frame the biggest region 
% imwrite(BW,"frame.png");
BW = bwareafilt(BW,1); % return the biggest region

% imwrite(BW,"biggestregion.png");

[I,J]=find(BW>max(BW(:))/2);
IJ=[I,J];  
[~,idx]=min(IJ*[1 1; -1 -1; 1 -1; -1 1].');
corners=IJ(idx,:);

% % visualize vertices
% imshow(BW)
% hold on
% plot( corners(:,2),corners(:,1),'yo','MarkerFaceColor','r',...
%                                 'MarkerSize',12,'LineWidth',2);
% hold off

% % Calculate bounding box
% s = regionprops(BW,'BoundingBox');
% boundingBox = s.BoundingBox;
% % Crop the image
% %Icropped = imcrop(RGB,s.BoundingBox);
% % Show the result
% % figure
% % imshow(Icropped)

end
