library("ggplot2")

#need to source the function below

fig1 <- function(data_table){
  
  
  
  plot1 <- ggplot(data_table, 
                  aes(x = Position, y = LOD, 
                      
                      color = Pathogen)) + geom_line(size=0.5, Position = "identity")
  
  ## remove background
  plot1 <- plot1 + theme_bw()
  
  ## change axis value format
  plot1 <- plot1 + theme(axis.text.y = element_text(size = 8, colour = "black")) + theme(axis.text.x = element_text(size = 8, colour="black", angle = 90))
  
  ## change axis title font
  plot1 <- plot1 + theme (axis.title.y = element_text( colour= "black", size= 10)) + theme (axis.title.x = element_text( colour= "black", size= 10))
  
  ## seperate into different chromosomes
  plot1 <- plot1 + facet_grid(. ~ Group) + theme(strip.text.x = element_text ( size= 10))
  
  ## change the title of the legend
  plot1 <- plot1 + scale_colour_discrete(name = "Isolates")
  
  ## change legend title
  plot1 <- plot1 + theme ( legend.title= element_text ( size = 10,))
  
  return(plot1)
  
  
  
}


#Example dataset 


LOD <- runif(143, 0.0, 7.5)
Position <- seq(0, 142, by=1)
Group <- rep("Ch14", 143)
Pathogen <- rep("Py. irregulare", 143)

example_table <- data.frame(Group = Group, 
                            Position = Position,
                            LOD = LOD,
                            Pathogen = Pathogen)



#make a graph 

tiff("temp_4.tiff", width = 7, height = 4, units = 'in', res = 300)
fig1(example_table)# Make plot
dev.off()
