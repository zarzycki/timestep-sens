ncfile="netcdf-files/netcdf_NATL_tau_seed_configs.nc"
f = addfile(ncfile,"r")

out_type="pdf"
out_dir="./fig/spatial/"
system("mkdir -p "+out_dir)

basinstr=tostring(f@strbasin)
models = chartostring(f->model_names)
fullfilename=tostring(f@csvfilename)

; split CSV file extension off
namesplit = get_file_suffix(fullfilename,0)
filename = namesplit@fBase

nfiles=3

wks = gsn_open_wks(out_type,out_dir+"/seeds."+basinstr+"_"+filename)

spapltvars="fullgen"
toPlot=f->$spapltvars$

permonth=f->pm_count
seeds_per_year = dim_sum_Wrap(permonth)

printVarSummary(toPlot)
print(models+" "+seeds_per_year)

letterstr=(/"a.","b.","c."/)

plot = new(nfiles,"graphic")

do jj = 0,nfiles-1

   thisVar = toPlot(jj,:,:)
   
    res                       = True     ; plot mods desired
    
    if (jj .ne. 0) then
      ;colorMap1="NCV_blu_red"
      ;colorMap1="BlueWhiteOrangeRed"
      ;colorMap1=read_colormap_file("./functions/seaborn_bluetored2.rgb")
      colorMap1=read_colormap_file("NCV_blu_red")
      ; currently a hack to make middle 30 colors = white so that the +/- small contours = white
      colorMap1(111:141,0:2)=1.0
      ncontlev=20
      thisVar = thisVar - toPlot(0,:,:)
      res@cnMinLevelValF        = -1.5
      res@cnMaxLevelValF        = 1.5
      res@lbLabelStride = 4
    else
      thisVar = where(thisVar.gt.0.,thisVar,thisVar@_FillValue)
      ;colorMap1 = read_colormap_file("WhiteBlueGreenYellowRed")
      colorMap1 = read_colormap_file("../colormaps/inferno.rgb")
      print(colorMap1)
      colorMap1 = colorMap1(::-1,:)
      ncontlev = 18
      res@cnMinLevelValF        = 0.
      res@cnMaxLevelValF        = 3.0
      res@lbLabelStride = 3
    end if
    
    res@lbLabelFontHeightF =0.022

    res@gsnDraw = False
    res@gsnFrame = False
    res@gsnAddCyclic          = False    
    res@cnFillOn              = True     ; turn on color fill
    res@cnFillMode            = "RasterFill"       ; Raster Mode
    res@cnLinesOn             = False    ; turn of contour lines
    res@cnLineLabelsOn  = False

    res@gsnCenterString       = ""

    res@mpMinLatF             = 2.
    res@mpMaxLatF             = 60.
    res@mpMinLonF             = 260.
    res@mpMaxLonF             = 347.

    res@mpCenterLonF          = (res@mpMinLonF + res@mpMaxLonF)/2
    res@cnLevelSelectionMode  = "ManualLevels"

    res@cnLevelSpacingF       = (res@cnMaxLevelValF - res@cnMinLevelValF) / tofloat(ncontlev)
    res@cnFillPalette=colorMap1


    res@lbLabelBarOn        = True           ; turn off individual cb's

if (models(jj) .eq. "dtime900") then
  thisindex=1
elseif (models(jj) .eq. "dtime450") then
  thisindex=2
  ;strtoann=
elseif (models(jj) .eq. "dtime1800") then
  thisindex=0
  ;strtoann=
else
  exit
end if



    plot(thisindex) = gsn_csm_contour_map_ce(wks,thisVar,res)

 txres               = True                            
 txres@txFontHeightF = 0.05             ; Set the font height
 txres@amJust="TopRight"
 
 label = sprintf("%3.1f", seeds_per_year(jj))
 text = gsn_add_text(wks,plot(thisindex),label,344.,57.,txres)
 
    delete(res)
    delete(colorMap1)

end do

    resP=True
    ;resP@txString           = "Annual TC track density, all storms"
    resP@amJust           = "TopLeft"
    resP@gsnPanelFigureStringsFontHeightF = 0.015
    resP@gsnPanelFigureStrings=(/"a.) dt~B~1800~N~ - dt~B~900~N~","b.) dt~B~900~N~","c.) dt~B~450~N~ - dt~B~900~N~"/)

      gsn_panel(wks,plot,(/1,5/),resP)
