install.packages("igraph")
library(igraph)
library(datasets)
g <- graph(c(1,2,2,3,3,4,4,1,1,4,1,4,4,1))

plot(g,
     vertex.color = "green",
     vertex.size = 40,
     edge.color = "Red")


data = read.csv("C:\\Users\\milindsawant\\Downloads\\networkdata.csv" , header = T)
head(data)

y <- data.frame(data$first , data$second)

net <- graph.data.frame(y)

plot(net,
     vertex.color = rainbow(32),
     vertex.label.cex = 0.8,
     edge.arrow.size = 0.1,
     edge.color = "maroon",
     vertex.size = V(net)*0.5+1,
     layout = layout.kamada.kawai)

V(net)
set.seed(222)

hs <- hub_score(net)$vector
as <- authority_score(net)$vector

set.seed(123)

par(mfrow = c(1,2))
plot(net,
     vertex.color = rainbow(52),
     vertex.label.cex = 0.8,
     edge.arrow.size = 0.1,
     edge.color = "maroon",
     vertex.size = hs*30,
     main = 'Hubs',
     layout = layout.kamada.kawai)

plot(net,
     vertex.color = rainbow(32),
     vertex.label.cex = 0.8,
     edge.arrow.size = 0.1,
     edge.color = "maroon",
     main = 'Authority',
      vertex.size = as*30,
     layout = layout.kamada.kawai)


rm(list = ls()) 

# Clear packages
p_unload(all)  # Remove all add-ons

# Clear console
cat("\014")  # ctrl+L

dev.off()
