function A = quadAreaXY(pts)
% pts: 4x2 array, each row [x y]
% returns area in squared pixel units (or whatever units x,y are in)

% assumes pts are in the loop order

    % assert(size(pts,1) == 4 && size(pts,2) == 2, 'pts must be 4x2');
    % % Order points by angle around centroid (CCW)
    % c = mean(pts,1);
    % ang = atan2(pts(:,2)-c(2), pts(:,1)-c(1));
    % [~, idx] = sort(ang);
    % p = pts(idx, :);

    % Shoelace formula
    x = pts(:,1); y = pts(:,2);
    x2 = [x; x(1)];
    y2 = [y; y(1)];
    A = 0.5 * abs(sum(x2(1:end-1).*y2(2:end) - x2(2:end).*y2(1:end-1)));
end

% Example:
% pts = [10 10; 60 15; 55 55; 12 50];
% A = quadAreaXY(pts)
