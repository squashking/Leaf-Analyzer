function [bbox, pts] = getTextBoundingBox(img, pointBottomLeft, pointBottomRight, textHeight)
%GETTEXTBOUNDINGBOX Compute an axis-aligned bounding box for a text region.
%
% The text region is defined by two bottom points and a height. The top edge
% is parallel to the bottom edge and textHeight pixels "above" it (smaller y).
%
% Inputs
%   img              : 2D image (HxW) (only size is used)
%   pointBottomLeft  : [x y]
%   pointBottomRight : [x y]
%   textHeight       : scalar (pixels)
%
% Outputs
%   bbox : [x y w h] clamped to image borders (x,y are top-left, 1-based)
%   pts  : 4x2 points [pBL; pBR; pTR; pTL] (unclamped), useful for debugging

    % --- Validate ---
    if nargin < 4
        error('Usage: bbox = getTextBoundingBox(img, pBL, pBR, textHeight)');
    end
    if isempty(img)
        error('img must be a 2D image.');
    end
    if numel(pointBottomLeft) ~= 2 || numel(pointBottomRight) ~= 2
        error('pointBottomLeft and pointBottomRight must be 1x2 vectors [x y].');
    end
    if ~isscalar(textHeight) || textHeight <= 0
        error('textHeight must be a positive scalar.');
    end

    [H, W] = size(img);

    pBL = double(pointBottomLeft(:).');
    pBR = double(pointBottomRight(:).');

    % --- Compute "upward" perpendicular offset (image coords: y increases downward) ---
    v = pBR - pBL;
    vnorm = hypot(v(1), v(2));
    if vnorm < 1e-9
        % Degenerate: bottom points coincide -> return 1x1 bbox at that point (clamped)
        x = min(max(round(pBL(1)), 1), W);
        y = min(max(round(pBL(2)), 1), H);
        bbox = [x, y, 1, 1];
        pts  = [pBL; pBR; pBR; pBL];
        return;
    end

    % Two perpendicular candidates
    n1 = [-v(2),  v(1)];
    n2 = [ v(2), -v(1)];

    % Choose the one that goes "above" (smaller y => negative y component)
    if n1(2) < n2(2)
        n = n1;
    else
        n = n2;
    end
    if n(2) >= 0
        n = -n;
    end

    n = n / hypot(n(1), n(2));           % unit normal
    offset = n * double(textHeight);

    pTL = pBL + offset;
    pTR = pBR + offset;

    pts = [pBL; pBR; pTR; pTL];

    % --- Axis-aligned bbox of the 4 points ---
    xmin = min(pts(:,1));
    xmax = max(pts(:,1));
    ymin = min(pts(:,2));
    ymax = max(pts(:,2));

    % --- Clamp to image borders (1-based, inclusive pixels) ---
    xmin = max(1, floor(xmin));
    ymin = max(1, floor(ymin));
    xmax = min(W, ceil(xmax));
    ymax = min(H, ceil(ymax));

    if xmax < xmin || ymax < ymin
        bbox = []; % completely outside (should be rare if bottoms are valid)
        return;
    end

    bbox = [xmin, ymin, xmax - xmin + 1, ymax - ymin + 1]; % [x y w h]
end
