bathy-plotting
==============

Several matlab scripts to visualize bathymetry from bathymetry data files (xyz).

For plotting LA area bathymetry, the main script to use is plotBathyLA.m

For usage, run
```
>> help plotBathyLA
```
Data can be retrieved from SCCOOS at http://www.sccoos.org/data/bathy/data/la.zip

---
For plotting bathymetry from EcoMapper log files, use the matlab scripts in scripts/ecomapper/
```
>> help map_bathymetry_from_ecomapper
```
or
```
>> help map_interpolated_bathymetry_from_ecomapper
```

These scripts are pretty general, but make some assumptions on file/folder naming. Default arguments probably need changing for your usage. They also assume you have a geoTIFF of the location at hand (which you would need anyway for the standard EcoMapper control software).

---
