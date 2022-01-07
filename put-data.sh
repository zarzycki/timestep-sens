#!/bin/bash

mkdir -p ./DATA/pdf-freq/
rm ./DATA/pdf-freq/*

cp -v ./freq-hist/OUT_tau900_OMEGA500_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_dtime450tau1800_PRECL_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_dtime1800_PRECC_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_tau3600_lowdmpdz2_PRECL_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_tau900_PRECL_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_tau3600_lowdmpdz2_OMEGA500_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_tau3600_PRECL_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_dtime900_OMEGA500_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_dtime900_PRECC_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_dtime450tau1800_OMEGA500_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_tau900_PRECC_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_tau3600_lowdmpdz2_PRECC_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_tau3600_PRECC_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_dtime1800_OMEGA500_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_dtime900_PRECL_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_tau3600_OMEGA500_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_dtime450tau1800_PRECC_MASKI.nc ./DATA/pdf-freq/
cp -v ./freq-hist/OUT_dtime1800_PRECL_MASKI.nc ./DATA/pdf-freq/

cd ./DATA/pdf-freq/
rename -v 's/tau3600_lowdmpdz2/dtime450_lowdmpdz/' *.nc
rename -v 's/tau3600/dtime450/' *.nc
rename -v 's/tau900/dtime450_tau900/' *.nc
cd ../..




mkdir -p ./DATA/cymep/netcdf/
rm ./DATA/cymep/netcdf/*

cp -v ./density/netcdf-files/netcdf_NATL_tau_configs.nc ./DATA/cymep/netcdf/cymep_NATL_tc.nc
cp -v ./density/netcdf-files/netcdf_NATL_tau_seed_configs.nc ./DATA/cymep/netcdf/cymep_NATL_seeds.nc





mkdir -p ./DATA/spectra/
rm ./DATA/spectra/*

cp -v ./spectrum-analysis/spectrum_VORT850_MASKI_F_dtime1800.nc ./DATA/spectra/
cp -v ./spectrum-analysis/spectrum_VORT850_MASKI_F_tau900.nc ./DATA/spectra/
cp -v ./spectrum-analysis/spectrum_VORT850_MASKI_F_dtime900.nc ./DATA/spectra/
cp -v ./spectrum-analysis/spectrum_VORT850_MASKI_F_tau3600.nc ./DATA/spectra/
cp -v ./spectrum-analysis/spectrum_VORT850_MASKI_F_tau3600_lowdmpdz2.nc ./DATA/spectra/

cd ./DATA/spectra/
rename -v 's/tau3600_lowdmpdz2/dtime450_lowdmpdz/' *.nc
rename -v 's/tau3600/dtime450/' *.nc
rename -v 's/tau900/dtime450_tau900/' *.nc
cd ../..






mkdir -p ./DATA/MPI-GPI/
rm ./DATA/MPI-GPI/*

cp -v ./MPI_GPI/GPI_tau900.nc_AVG.nc ./DATA/MPI-GPI/
cp -v ./MPI_GPI/GPI_dtime900.nc_AVG.nc ./DATA/MPI-GPI/
cp -v ./MPI_GPI/GPI_tau3600.nc_AVG.nc ./DATA/MPI-GPI/
cp -v ./MPI_GPI/GPI_dtime1800.nc_AVG.nc ./DATA/MPI-GPI/
cp -v ./MPI_GPI/GPI_tau3600_lowdmpdz2.nc_AVG.nc ./DATA/MPI-GPI/

cd ./DATA/MPI-GPI/
rename -v 's/tau3600_lowdmpdz2/dtime450_lowdmpdz/' *.nc
rename -v 's/tau3600/dtime450/' *.nc
rename -v 's/tau900/dtime450_tau900/' *.nc
cd ../..





mkdir -p ./DATA/cymep/csv
rm ./DATA/cymep/csv/*

CYMEPDIR=/Users/cmz5202/Software/cymep/

cp -v ${CYMEPDIR}/cymep/csv-files/*tau_configs_NATL*csv ./DATA/cymep/csv
cp -v ${CYMEPDIR}/cymep/csv-files/*tau_seed_configs_NATL*csv ./DATA/cymep/csv

cd ./DATA/cymep/csv
rename -v 's/tau_configs_NATL/NATL_tc/' *.csv
rename -v 's/tau_seed_configs_NATL/NATL_seeds/' *.csv
cd ../../..





mkdir -p ./DATA/trajs/
rm ./DATA/trajs/*

cp -v /Users/cmz5202/Software/OLD-coastal/ncl/trajs/ibtracs-1980-2019-GLOB.v4.txt ./DATA/trajs/
cp -v /Users/cmz5202/Software/OLD-coastal/ncl/trajs/trajectories.txt.CHEY.VR28.NATL.REF.CAM5.4CLM5.0.dtime1800 ./DATA/trajs/
cp -v /Users/cmz5202/Software/OLD-coastal/ncl/trajs/trajectories.txt.CHEY.VR28.NATL.REF.CAM5.4CLM5.0.dtime900 ./DATA/trajs/
cp -v /Users/cmz5202/Software/OLD-coastal/ncl/trajs/trajectories.txt.CHEY.VR28.NATL.REF.CAM5.4CLM5.0.tau3600 ./DATA/trajs/
cp -v /Users/cmz5202/Software/OLD-coastal/ncl/trajs/trajectories.txt.CHEY.VR28.NATL.REF.CAM5.4CLM5.0.tau900 ./DATA/trajs/
cp -v /Users/cmz5202/Software/OLD-coastal/ncl/trajs/trajectories.txt.CHEY.VR28.NATL.REF.CAM5.4CLM5.0.tau3600_lowdmpdz2 ./DATA/trajs/
cp -v /Users/cmz5202/Software/OLD-coastal/cymep/trajs/seeds.txt.lovort.CHEY.VR28.NATL.REF.CAM5.4CLM5.0.dtime900 ./DATA/trajs/
cp -v /Users/cmz5202/Software/OLD-coastal/cymep/trajs/seeds.txt.lovort.CHEY.VR28.NATL.REF.CAM5.4CLM5.0.dtime1800 ./DATA/trajs/
cp -v /Users/cmz5202/Software/OLD-coastal/cymep/trajs/seeds.txt.lovort.CHEY.VR28.NATL.REF.CAM5.4CLM5.0.tau3600 ./DATA/trajs/
cp -v /Users/cmz5202/Software/OLD-coastal/cymep/trajs/seeds.txt.lovort.CHEY.VR28.NATL.REF.CAM5.4CLM5.0.tau3600_lowdmpdz2 ./DATA/trajs/
cp -v /Users/cmz5202/Software/OLD-coastal/cymep/trajs/seeds.txt.lovort.CHEY.VR28.NATL.REF.CAM5.4CLM5.0.tau900 ./DATA/trajs/

cd ./DATA/trajs/
rename -v 's/tau3600_lowdmpdz2/dtime450_lowdmpdz/' *
rename -v 's/tau3600/dtime450/' *
rename -v 's/tau900/dtime450_tau900/' *
cd ../..