pro plot_profile,image,wx=wx,wy=wy,points=points,_extra=_extra
;+
;  You can use,
;  Result = PROFIL(Image, XX, YY)  for a profile
;  or
;  plot_image,image & tvprofile,image to see colunm and row profiles
;-
window,20,xsize=wx,ysize=wy
plot,total(image,2)/(size(image))[2],position=[0.3,0.1,0.62,.3],/xst,YTICKFORMAT="(A1)"
AXIS, YAXIS=1,  /SAVE

plot,total(image,1)/(size(image))[1],findgen((size(image))[2]),position=[0.05,0.3,0.3,.9],/noerase,/yst,XTICKFORMAT="(A1)"
AXIS, XAXIS=1,  /SAVE


result=histogram(image)
bins=findgen(n_elements(result))+min(image)
plot,bins,result,psym=10,position=[0.71,0.1,0.99,0.38],/xst,/noerase

;plot_hist,image,position=[0.71,0.1,0.99,0.38],/xst,/noerase


xyouts,0.07,0.2,'Mean = '+string(mean(image)),/normal
xyouts,0.07,0.17,'Max  = '+string(max(image)),/normal
xyouts,0.07,0.14,'Min  = '+string(min(image)),/normal


plot_image,image,_extra=_extra,position=[0.3,0.3,0.62,0.9],XTICKFORMAT="(A1)",YTICKFORMAT="(A1)",/noerase
if n_elements(points) ne 0 then plots,points[0,*],points[1,*],psym=3
print,'*******************************************'
print,'*****  CLICK THE FIRST POINT **************'
cursor,x1,y1,/up 
plots,x1,y1,psym=4
print,'*******************************************'
print,'*****  CLICK THE SECOND POINT *************'
cursor,x2,y2,/up 
print,'*******************************************'
plots,x2,y2,psym=4
profile,x1,x2,y1,y2,.5,.5,xx,yy,dd 
plots,xx,yy 
;help,image
;Result = PROFIL(Image, XX, YY)
plot,dd,image[xx,yy],position=[0.68,0.7,0.99,.9],/noerase,/xst
xyouts,0.7,0.6,'Mean = '+string(mean(image[xx,yy])),/normal
xyouts,0.7,0.57,'Max  = '+string(max(image[xx,yy])),/normal
xyouts,0.7,0.54,'Min  = '+string(min(image[xx,yy])),/normal

end
