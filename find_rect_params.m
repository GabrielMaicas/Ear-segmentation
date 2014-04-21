%Finds x,t,w,h to draw a rectange
function params=find_rect_params(img)

[row col]=find(img);

x=min(col);
y=min(row);
w=max(col)-x;
h=max(row)-y;
params=[x,y,w,h];

end