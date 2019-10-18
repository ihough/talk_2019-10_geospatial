library(spData)
library(mapview)

# Mapview vector data
world
names(world)
mapview(world, zcol = "pop")

# Mapview
# Get t2m data from
# https://tinyurl.com/yycn5zse


t2m <- raster::brick("data/era5_t2m.tif")
t2m
mapview(t2m$era5_t2m.1)

p <- mapview(world)
mapview(t2m$era5_t2m.1, map = p)

library(rasterVis)
par(mar = c(1, 1, 1, 1))
rasterVis::levelplot(t2m)

rasterVis::levelplot(t2m, layers = 1)


library(tmap)
data("World")

tm_shape(world) +
  tm_polygons("pop")


tmap_mode("view")
tm_shape(World) +
  tm_polygons("HPI")



data(World, metro, rivers, land)

tmap_mode("plot")
## tmap mode set to plotting
tm_shape(land) +
  tm_raster("elevation", palette = terrain.colors(10)) +
  tm_shape(World) +
  tm_borders("white", lwd = .5) +
  tm_text("iso_a3", size = "AREA") +
  tm_shape(metro) +
  tm_symbols(col = "red", size = "pop2020", scale = .5) +
  tm_legend(show = FALSE)

tmap_mode("view")
tm_shape(land) +
  tm_raster("elevation", palette = terrain.colors(10)) +
  tm_shape(World) +
  tm_borders("white", lwd = .5) +
  tm_text("iso_a3", size = "AREA") +
  tm_shape(metro) +
  tm_symbols(col = "red", size = "pop2020", scale = .5) +
  tm_legend(show = FALSE)

tmap_mode("view")
tm_shape(World) +
  tm_polygons(c("HPI", "economy")) +
  tm_facets(sync = TRUE, ncol = 2)
