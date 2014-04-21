%%Automatic ear segmentation

for i=1:20%Every image
    
    img = imread(sprintf('src/%d.bmp',i));
    %Quito posibles bordes en los bordes de la imagen
    img=im2double(img(30:end-30,30:end-30));
  
    img=imadjust(img);
    
    tophatElem=strel('disk',41);%Structural element for top-hap
   
    filtered=imtophat(img,tophatElem);%Top hat
    
    level = graythresh(filtered);%Thresholding
    thresholded = im2bw(filtered, level);
    
    figure;
    
    extra=getLargestCc(thresholded);%Get largest connected component
    
    %img=extra + (1-extra).*img;
    
    imagesc(img);colormap gray;
    
    params=find_rect_params(extra);
    r=rectangle('Position',params,'Curvature',[0,0],'EdgeColor',[0,1,0],'LineWidth',5);
end;
