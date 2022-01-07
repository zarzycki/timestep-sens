#!/bin/bash

ncl plot-hist_precip.ncl 'var="PRECC_MASKI"' 'namesuff="def"'
ncl plot-hist_precip.ncl 'var="PRECC_MASKI"' 'namesuff="sens"'

ncl plot-hist_precip.ncl 'var="PRECL_MASKI"' 'namesuff="def"'
ncl plot-hist_precip.ncl 'var="PRECL_MASKI"' 'namesuff="sens"'

ncl plot-hist_precip.ncl 'var="OMEGA500_MASKI"' 'namesuff="def"'
ncl plot-hist_precip.ncl 'var="OMEGA500_MASKI"' 'namesuff="sens"'
