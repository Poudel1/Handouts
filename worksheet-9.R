## Importing vector data

library(sf)
library(rgdal)

shp <- 'data/cb_2016_us_county_5m'
counties <- st_read(shp, stringsAsFactors = FALSE)
class(shp)
class (counties)

## Bounding box



library(dplyr)
st_crs(counties)
counties_md <- filter(counties, STATEFP == '24')
names (counties)
plot(counties_md$geometry)

## Grid

grid_md <- st_make_grid(counties_md, n = 4)
st_bbox(grid_md)
... <- ...(counties_md, ...)


## Plot layers
plot(grid_md)
plot(counties_md$geometry, add=T)
plot(counties_md[, "ALAND"])
plot(...)
plot(...)

## Create geometry

sesync <- st_sfc(
  st_point(c(-76.503394, 38.976546)),
  crs = 4326)
class(sesync)
st_crs(counties_md)
sesync <- ...(
    ...(c(-76.503394, 38.976546)),
        ...)

counties_md <- st_transform(counties_md, crs = st_crs(sesync))
plot(counties_md$geometry)
overlay	<- st_within(sesync, counties_md)
counties_sesync <- counties_md[overlay[[1]], 'geometry']
plot(counties_sesync, col = "red", add = TRUE)
plot(sesync, col = 'red', pch = 40, add = TRUE)
plot(counties_md [sesync, ]$geometry)
plot(counties_md [sesync, ]$geometry, col ="red")

index_selected <-overlay[[1]]
counties_md[overlay[[1]],]
plot(county_sesync$geometry)
plot(sesync, pch=100, col="red", add=T)


plot(sesync, col = "red", pch = 20, add = TRUE)

counties_md <- ...(counties_md, ...)
plot(...)
plot(..., col = "green", pch = 20, add = ...)

## Exercise 1

...

## Coordinate transforms

shp <- 'data/huc250k'
huc <- st_read(shp)
plot(huc)
plot(huc$geometry)

prj <- '+proj=aea +lat_1=29.5 +lat_2=45.5 +lat_0=23 +lon_0=-96 +x_0=0 +y_0=0 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs'

counties_md<-st_transform(counties_md, crs=prj)
st_crs(counties_md)
huc<- st_transform(huc, crs=prj)
sesync <-st_transform(sesync, crs=prj)
plot (huc, border='red', add=TRUE)
plot(sesync, col="red", pch=20, add =TRUE)

state_md <- st_union(counties_md)
plot(state_md)
huc_md <- st_intersection(huc, state_md)
plot (huc_md, border="red", col=NA, add=TRUE)

bubble_md <- st_buffer(state_md, 5000)
plot(state_md)
plot(bubble_md, lty = 'dotted', add = TRUE)


counties_md <- st_transform(counties_md, ...)
huc <- ...
sesync <- ...
plot(counties_md$geometry)
plot(..., border = 'blue', add = TRUE)
plot(..., col = 'green', pch = 20, add = TRUE)

## Geometric operations on vector layers

state_md <- ...
plot(...)

huc_md <- ...
plot(..., border = 'blue', col = NA, add = TRUE)

## Exercise 2

...

## Working with raster data

library(...)
nlcd <- raster(...)

## Crop

... <- matrix(..., ...)
nlcd <- crop(..., ...)
plot(nlcd)
plot(...)

## Raster data attributes

lc_types <- nlcd@data@attributes[[1]]$Land.Cover.Class

## Raster math

pasture <- mask(nlcd, nlcd == 81, maskvalue = FALSE)
plot(pasture)

nlcd_agg <- ...(nlcd, ..., ...)
...
plot(nlcd_agg)

## Exercise 3

library(raster)
nlcd <- raster("data/nlcd_agg.grd")
class(nlcd)
plot(nlcd)

extent <- matrix(st_bbox(huc_md), nrow=2)
nlcd <- crop(nlcd, extent)
plot(nlcd)
plot(huc_md, col = NA, add = TRUE)
extent
plot(state_md, add=T)

lc_types <- nlcd@data@attributes[[1]]$Land.Cover.Class
lc_types
...

## Mixing rasters and vectors: prelude

sesync <- as(..., "Spatial")
huc_md <- as(..., "Spatial")
counties_md <- ...

## Mixing rasters and vectors

plot(nlcd)
plot(sesync, col = 'green', pch = 16, cex = 2, ...)

sesync_lc <- ...(nlcd, sesync)

county_nlcd <- ...

modal_lc <- extract(...)
... <- lc_types[modal_lc + 1]

