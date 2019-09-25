numberOfImages = 1986;
numberOfResults = 3780;
myFolder = 'B:\Mini Project\parthan\Test';
allResults = zeros(numberOfResults,numberOfImages);
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1 : numberOfImages
 
  baseFileName = jpegFiles(k).name;
  fullFileName = fullfile(myFolder, baseFileName);
  imageArray = imread(fullFileName);
  a=size(imageArray);
  thisImagesResults = getHOGDescriptor(imageArray);
 
  allResults(:,k) = thisImagesResults;
end
xlswrite('inptest.xlsx', allResults);