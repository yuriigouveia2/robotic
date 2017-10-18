function grid = IBOG()

filepath = fullfile('laser.png');
image = imread(filepath);

grayimage = rgb2gray(image);
bwimage = grayimage < 0.5;

grid = robotics.BinaryOccupancyGrid(bwimage);

show(grid)
end