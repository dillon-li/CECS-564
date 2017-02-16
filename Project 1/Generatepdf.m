function [ N ] = Generatepdf( )
% Using folder of sample jpegs, generate a rough frequency distribution for
% jpg encoded byte data

filenames = dir('sample_images');
filenames = filenames(3:end);

for i = 1:size(filenames)
    f = [pwd '/sample_images/' filenames(i).name]; % filepath
    file = fopen(f, 'r');
    bytestream = fread(file);
    fclose(file);
    [N(i,:), edges] = histcounts(bytestream, 256, 'Normalization', 'probability');
end

N = mean(N); % mean of all probabilities




