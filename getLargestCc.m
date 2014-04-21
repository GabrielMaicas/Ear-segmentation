function iOut = getLargestCc(img)
% GETLARGESTCC  Returns largest connected-component in the input array.

% Getting connected-components structure, aborting if empty
CC = bwconncomp(img);
numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);
for i=1:length(numPixels)
	if i~=idx
        img(CC.PixelIdxList{i})=0;
    end;
end;
iOut=img;
