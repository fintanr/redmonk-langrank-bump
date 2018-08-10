#
# Generate a bump chart for the RedMonk Language Rankings, as of Jan 2018.
#
# See https://redmonk.com/sogrady/2018/03/07/language-rankings-1-18/
# and https://redmonk.com/fryan/2018/03/15/redmonk-language-rankings-over-time/
#
# Fintan Ryan (@fintanr), March 14th 2018.
# 

library(ggplot2)
library(ggrepel)

df <- read.csv("rmonk-lang-rankings-2018.csv") 

df$Date <- as.Date(df$Date, format='%m-%d-%Y', origin="1970-01-01")
df$Rank <- as.numeric(as.character(df$Rank))

df_latest <- df[which(df$Date == "2018-06-30"),]
df_first <- df[which(df$Date == "2012-09-30"),]

pal1 = c("#c57c3c", "#e392c2", "#a5e7a8", "#bea3ea", "#d7e298", "#81a4e3", "#a6b16a", "#a7baf2", "#e4c587", "#5ab6e6",
         "#d6a16d", "#62d9f3", "#eb9189", "#3ec1c8", "#e1a6b6", "#7fe3c5", "#e5b4e2", "#8bba83", "#cd5136", "#84bb9c",
         "#e1ceeb", "#72b7b0", "#cd9e8c", "#93e7e2", "#ecc0b1", "#7bb1c6", "#d8e8c5", "#acbadd", "#b2b593", "#acd8eb")

g1 <- ggplot(data=df, aes(x=Date, y=Rank)) + geom_line(aes(colour=Language), size=1.5) 
g1 <- g1 + geom_point(shape = 21, stroke = 2, size=3, fill = "white", aes(colour=Language)) 
g1 <- g1 + geom_label_repel(data = df_first, aes(label=Language), size=2.1, fontface = "bold", color='#2f2f2f')
g1 <- g1 + geom_label(data = df_latest, aes(x=Date, y = Rank, label=Language), size=2.1, fontface = "bold", color='#2f2f2f', hjust=.1) 
g1 <- g1 + scale_y_reverse(lim=c(20,1), breaks = scales::pretty_breaks(n = 20)) 
g1 <- g1 + ggtitle('RedMonk Language Rankings\nSep 2012 - June 2018') 
g1 <- g1 +  xlab(NULL) + ylab("Language Rank") 
g1 <- g1 + theme_minimal() + theme_bw() + scale_colour_manual(values=pal1) 
g1 <- g1 +  theme(panel.background = element_rect(fill = '#ffffff'),
        plot.title = element_text(size=14), legend.title=element_blank(),
        axis.text = element_text(size=11), axis.title=element_text(size=11), 
        panel.border = element_blank(), legend.position='none', 
        panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank(),
        axis.ticks.x=element_blank(), axis.ticks.y=element_blank())
g1 <- g1 + theme(plot.title = element_text(hjust = 0.5), plot.caption=element_text(hjust = 0))
g1 <- g1 + theme(legend.text = element_text(size=8), axis.text.x = element_text(angle=50, hjust=1))

# the more eagled eyed will spot we actually exported in RStudio & did some
# manual edits on labels for clojure & matlab. But for a starting point this
# is fine

ggsave("rmonk-lang-rang.png", g1)

