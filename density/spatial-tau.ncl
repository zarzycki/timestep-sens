lettercount=0
spapltvarsstr=(/"fulldens","fullpres","fullwind","fullgen","fullpace","fullace","fulltcd", "fulltrackbias","fullgenbias","fullacebias","fullpacebias"/)
spapltmincontour=(/0. ,870. ,0. ,0. ,0. ,0., 0.,-10.,-1.0,-5.,-5./)  ; use this for NATL
spapltmaxcontour=(/18.,1000.,80.,1.4 ,5. ,5., 3., 10., 1.0, 5., 5./)    
letterstr=(/"a.","b.","c.","d.","e.","f.","g.","h.","i.","j.","k.","l."/)

; ========================================================================

ncdf = addfile("./netcdf-files/netcdf_NATL_tau_configs.nc" ,"r")  ; open output netCDF file
modelnames = tostring(ncdf->model_names)
basin=1
basinstr="NATL"
filename="tau_configs"

plotArr=(/0,1,2,3/)
;plotArr=(/0,3,4,5/)

print(ncdf->model_names(plotArr,:))

  
  
nfiles=dimsizes(modelnames)
nfiles=4
; ========================================================================

; do plotting
do bb = 0,dimsizes(spapltvarsstr)-1
  thisDir="./fig/spatial/"
  system("mkdir -p "+thisDir)
  wks = gsn_open_wks("pdf",thisDir+"/"+tostring(spapltvarsstr(bb))+"."+basinstr+"_"+filename)
  plot = new(nfiles,"graphic")
  lnid = plot

  toPlot=ncdf->$spapltvarsstr(bb)$
  if (spapltvarsstr(bb) .eq. "fulltrackbias" .or. spapltvarsstr(bb) .eq. "fullgenbias" .or. spapltvarsstr(bb) .eq. "fullacebias" .or. spapltvarsstr(bb) .eq. "fullpacebias") then
    ;colorMap1="NCV_blu_red"
    ;colorMap1="BlueWhiteOrangeRed"
    ;colorMap1=read_colormap_file("./functions/seaborn_bluetored2.rgb")
    colorMap1=read_colormap_file("NCV_blu_red")
    ; currently a hack to make middle 30 colors = white so that the +/- small contours = white
    colorMap1(111:141,0:2)=1.0
    ncontlev=20
    configs_pretty=(/"-","e.) dt~B~1800~N~ - IBTrACS","f.) dt~B~900~N~ - IBTrACS","g.) dt~B~450~N~ - IBTrACS"/)
  else
    toPlot = where(toPlot.gt.0.,toPlot,toPlot@_FillValue)
    ;colorMap1="WhiteBlueGreenYellowRed"
    colorMap1 = read_colormap_file("../colormaps/inferno.rgb")
    colorMap1 = colorMap1(::-1,:)
    ncontlev = 10
    configs_pretty=(/"a.) IBTrACS","b.) dt~B~1800~N~","c.) dt~B~900~N~","d.) dt~B~450~N~"/)
  end if
  res                       = True     ; plot mods desired
  res@gsnDraw = False
  res@gsnFrame = False
  res@gsnAddCyclic          = False    
  res@cnFillOn              = True     ; turn on color fill
  res@cnFillMode            = "RasterFill"       ; Raster Mode
  res@cnLinesOn             = False    ; turn of contour lines
  res@cnLineLabelsOn  = False

  res@gsnCenterString       = ""
  if (dimsizes(basin) .eq. 1 .and. basin .eq. 1) then
    res@mpMinLatF             = 2.
    res@mpMaxLatF             = 60.
    res@mpMinLonF             = 260.
    res@mpMaxLonF             = 347.
  else
    res@mpMinLatF             = -60.
    res@mpMaxLatF             = 60.
    res@mpMinLonF             = 0.
    res@mpMaxLonF             = 360.
  end if
  res@mpCenterLonF          = (res@mpMinLonF + res@mpMaxLonF)/2
  res@cnLevelSelectionMode  = "ManualLevels"
  res@cnMinLevelValF        = spapltmincontour(bb)
  res@cnMaxLevelValF        = spapltmaxcontour(bb)
  res@cnLevelSpacingF       = (res@cnMaxLevelValF - res@cnMinLevelValF) / tofloat(ncontlev)
  res@cnFillPalette=colorMap1


  res@lbLabelStride = 2
  res@lbLabelBarOn        = False           ; turn off individual cb's

  lnres=True
  lnres@gsLineThicknessF = 4.0
  lnminlat=10.
  lnmaxlat=25.
  lnminlon=-60.
  lnmaxlon=-20.


  do zz = 0,nfiles-1
      plot(zz) = gsn_csm_contour_map_ce(wks,toPlot(plotArr(zz),:,:),res)
      lnid(zz) = gsn_add_polyline(wks,plot(zz),(/lnmaxlon,lnmaxlon,lnminlon,lnminlon,lnmaxlon/),(/lnminlat,lnmaxlat,lnmaxlat,lnminlat,lnminlat/),lnres)
  end do



  resP=True
  ;resP@txString           = "Annual TC track density, all storms"
  resP@amJust           = "TopLeft"
  resP@gsnPanelFigureStringsFontHeightF = 0.015
  resP@gsnPanelFigureStrings=configs_pretty

  resP@gsnPanelLabelBar    = True                ; add common colorbar
  resP@lbLabelFontHeightF  = 0.012               ; make labels smaller

  gsn_panel(wks,plot,(/4,1/),resP)

  delete(res)
  delete(colorMap1)
  delete(plot)
  delete(toPlot)
  delete(wks)
end do

