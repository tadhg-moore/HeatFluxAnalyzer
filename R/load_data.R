##Load in LakeHeatFluxAnalyzer data
# Author: Tadhg Moore
# Date: 2019-08-08

#setwd("C:\\Users\\mooret\\Desktop\\Git\\HeatFluxAnalyzer")

#Load in data
airt <- rLakeAnalyzer::load.ts('Data/Esthwaite.airT')
rh <- rLakeAnalyzer::load.ts('Data/Esthwaite.rh')
sw <- rLakeAnalyzer::load.ts('Data/Esthwaite.sw')
wnd <- rLakeAnalyzer::load.ts('Data/Esthwaite.wnd')
wtr <- rLakeAnalyzer::load.ts('Data/Esthwaite.wtr')

#Merge all datasets together
dat <- Reduce(function(x, y) merge(x, y, all=TRUE), list(airt, rh, sw, wnd, wtr))

#Melt for plotting with ggplot2
mlt <- reshape2::melt(dat, id.vars = 'datetime')

#Plot each as a line plot and create facets for each of the variables
library(ggplot2)
p1 <- ggplot(mlt, aes(datetime, value))+
  geom_line()+
  facet_wrap(~variable, nrow = 4, ncol = 4, scales = 'free_y')+
  theme_bw(base_size = 12)
p1
