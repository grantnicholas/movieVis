%Movievis 
%grantnicholas
%Make a program to get an idea of what the "average" look of a video file
%is. For example, certain movies have a recurring theme of colors that are
%really interesting. 

movObj = VideoReader('sample_iTunes.mov');
lastFrame = read(movObj, inf);
vidHeight = movObj.Height;
vidWidth = movObj.Width;
numFrames = movObj.NumberofFrames;

average= zeros(vidHeight,vidWidth,3);
for i = 1:numFrames;
    Frame = read(movObj, i);  %Comment out this line to skip the movie and make processing faster
    image(Frame)
    for j = 1:vidHeight
        for k = 1:vidWidth
            for l = 1:3
                average(j,k,l) = double(average(j,k,l))+double(Frame(j,k,l));
            end
        end
    end
    pause(.001);              %Comment out this line to skip the movie and make processing faster
end
average = uint8(average/numFrames);
image(average);

