library(sf)
library(ggplot2)
library(colorspace)
library(ggspatial)
library(magrittr)
library(dplyr)

#prepare the data---------------------------------------------------------
setwd("/Users/magdalenthot/Desktop/R")
kansas <- st_read('GU_CountyOrEquivalent.shp')
towns <- read.csv('Ghost_Town_Data.csv')
railroad <- st_read('Railroads.shp')
merge.data <- merge(kansas, towns, by = "county_nam")

# plot data----------------------------------------------------------------
kansas_plot <- ggplot(data = merge.data) +
    geom_sf(color = "#245953", aes(fill = Number_of_towns)) +
    geom_sf(data = railroad, color=alpha("black",0.6)) +
  
    ggtitle('Ghost Towns and Abandoned Railroads in Kansas') +
  
    labs(fill='Number of Ghost Towns in Each County',   
         caption = "Data sources: USGS, Kansas Open Data, Wikipedia \n The analysis found that Rooks, Lincoln, Osborne and Smith counties have the most ghost towns",
         subtitle = "Railroads played a large role in Kansas' settlement. When railroads were established, \n towns developed alongside them. They became important economically. \n However, when railroads became defunct, oftentimes, so did the towns around them.") +
    theme_void() +
  
    guides(fill = guide_colorbar(title.position = "top")) +
    theme(legend.position = "bottom") +
    theme(text = element_text(family = "Helvetica-Bold",
                              color = "#245953", size = 15)) +
  theme(plot.title = element_text(hjust = 0.5)) +
  
  #Legend styling
  scale_fill_continuous_sequential(palette = "Dark Mint") +
  theme(legend.key.width = unit(1.6, "cm")) +
  theme(legend.text = element_text(size = 7)) +
  theme(legend.title = element_text(size = 9.5)) +
  theme(legend.title = element_text(family = "Helvetica")) +
  theme(legend.title = element_text(hjust = 0.5)) +
  
  #Subtitle styling
  theme(plot.subtitle = element_text(hjust = 0.5)) +    
  theme(plot.subtitle = element_text(size = 10)) +      
  theme(plot.subtitle = element_text(family = "Helvetica")) +
  theme(plot.subtitle = element_text(color = "black")) +
  
  #Caption Styling
  theme(plot.caption = element_text(hjust = 0.5)) + 
  theme(plot.caption = element_text( family = "Helvetica")) +
  theme(plot.caption = element_text(size = 8)) +
  theme(plot.caption = element_text( colour = "black")) +
  
  theme( plot.background = element_rect(fill = "white"))


 ggsave("kansas.png", kansas_plot, height = 5, width = 7, dpi = 320)
 


