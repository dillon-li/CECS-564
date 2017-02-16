function [ output_img ] = ShowJPG( data )
% Show jpeg image from binary data
% data is the byte stream of jpeg image data

outfile = 'new.jpg';
fid = fopen(outfile, 'w');
fwrite(fid,data,'uint8');
fclose(fid);

output_img = imread(outfile);
imshow(output_img);

end

