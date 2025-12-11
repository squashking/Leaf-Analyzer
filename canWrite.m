% check if a file is writable, in Windows if a file is open by another
% application, it's not writable
% if file not exist, it will check if the directory is writable
% return true if writable
function [res] = canWrite(fileName)

    if isfile(fileName) % file exists

        fileID = fopen(fileName, 'a');    
        % Check if the file was opened successfully
        if fileID == -1
            res = false;
        else
            res = true;
            % Close the file immediately if successfully opened
            fclose(fileID);
        end
        
        

%         [~,attributes] = fileattrib(fileName);    
%         % Check if the file is writable
%         if ~attributes.UserWrite
%             res = false;
%         else
%             res = true;
%         end

    else % file not exist, check if directory is writeable
        pathstr = fileparts(fileName); % only extract the directory
        [~,attributes] = fileattrib(pathstr);
        
        % Check if the directory is writable
        if ~attributes.UserWrite
            res = false;
        else
            res = true;
        end
    end
    

end
