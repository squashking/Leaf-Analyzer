function hcube = parseHdrFile(fullHeaderFileName)

% This function reads a header file of a hyperspectral image and return a data cube object.
% It is able to read PSI images and standard HSI images.
% Input: fullFileName ---- header file 
% Output: hcube ---- data cube object
% Author: Tao Hu, APPF, Australia
% Date: 13-04-2023

[pathstr,imgName,ext] = fileparts(fullHeaderFileName);

% Open the text file for reading
fid = fopen(fullHeaderFileName, 'r');

% Read each line of the file and store it as a field in a struct

words = strsplit(fgetl(fid)); % first line

if(extractBefore(words{1}, 3) == "BY") % extract the first 2 charcters to see if it's PSI hdr format

    structMeta.byte_order = words{2};

    words = strsplit(fgetl(fid)); % 2nd line
    structMeta.layout = words{2};
    
    words = strsplit(fgetl(fid)); % 3rd line
    structMeta.nrows = str2num(words{2});
    
    words = strsplit(fgetl(fid)); % 4th line
    structMeta.ncols = str2num(words{2});
    
    words = strsplit(fgetl(fid)); % 5th line
    structMeta.nbands = str2num(words{2});
    
    words = strsplit(fgetl(fid)); % next line
    structMeta.nbits = str2num(words{2});
    
    words = strsplit(fgetl(fid)); % next line
    structMeta.bandrowbytes = str2num(words{2});
    
    words = strsplit(fgetl(fid)); % next line
    structMeta.totalrowbytes = str2num(words{2});
    
    words = strsplit(fgetl(fid)); % next line
    structMeta.bandgapbytes = str2num(words{2});
    
    words = strsplit(fgetl(fid)); % next line
    structMeta.chromatic_correction = words{2};
    
    words = strsplit(fgetl(fid)); % next line
    structMeta.start_wavelength = str2double(words{2});
    
    words = strsplit(fgetl(fid)); % next line
    structMeta.end_wavelength = str2double(words{2});
    
    words = strsplit(fgetl(fid)); % next line
    structMeta.integration_time = str2num(words{2});
    
    fgetl(fid); % "WAVELENGTHS"
    structMeta.wavelengths = zeros(structMeta.nbands, 1);
    for i = 1:structMeta.nbands
        structMeta.wavelengths(i) = str2double(fgetl(fid));
    end

    hcubeData = multibandread(fullfile(pathstr,imgName+".bil"),[structMeta.nrows structMeta.ncols structMeta.nbands],'uint16',0,'bil','ieee-le');
            
    s.Height = structMeta.nrows;
    s.Width = structMeta.ncols;
    s.Bands = structMeta.nbands;
    s.DataType = 'uint16';
    s.Interleave = "bil";
    s.ByteOrder = "ieee-le";
    hcube = hypercube(hcubeData,structMeta.wavelengths,s);
    fclose(fid);

else % standard hdr file format
    % Close the file
    fclose(fid);

    info = enviinfo(fullfile(pathstr,imgName+".hdr"));
    hcubeData = multibandread(fullfile(pathstr,imgName+".bil"),[info.Height info.Width info.Bands],info.DataType,0,'bil','ieee-le');

    %%%% normalization
%     hcubeData = double(hcubeData); 
%     hcubeData = hcubeData - mean(hcubeData(2050:2150,:,:),'omitnan');
% %     for iband = 1:info.Bands
% %         for irow = 1:info.Height
% %             hcubeData(irow,:,iband) = (hcubeData(irow,:,iband) - ...
% %                 mean(hcubeData(irow,:,iband),'omitnan'))./std(hcubeData(irow,:,iband),'omitnan');
% %         end
% %     end
% % 
    s.Height = info.Height;
    s.Width = info.Width;
    s.Bands = info.Bands;
    s.DataType = info.DataType;
    s.Interleave = "bil";
    s.ByteOrder = "ieee-le";
    s.RasterFormat = "ENVI"; % must add this, otherwise it will not work properly.
    hcube = hypercube(hcubeData,info.Wavelength,s);
        
% % Matlab hypercube function only accepts .dat file, so make a link to the .bil file as a workaround
%     if isunix || ismac
%     system(sprintf('ln -s "%s" "%s"', fullfile(pathstr,imgName+".bil"), fullfile(pathstr,imgName+".dat")));
%     elseif ispc
%         system(sprintf('mklink "%s" "%s"', fullfile(pathstr,imgName+".dat"), fullfile(pathstr,imgName+".bil")));
%     end
%     hcube = hypercube(fullfile(pathstr,imgName+".dat"),fullHeaderFileName);%fullfile(pathstr,imgName+".dat"),

end



end