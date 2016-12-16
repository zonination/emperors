# Load Libraries, declare constants, Set working directory
# setwd("")
library(ggplot2)
library(lubridate)
dynstring = c("Julio-Claudian","Flavian","Nerva-Antonine","Severan","Gordian","Constantinian","Valentinian","Theodosian")

# Load data. Note that certain cells will need formatting for
# compatibility with ISO-8601 and R.
emperors <- read.csv("emperors.csv")
emperors$birth<-ymd(emperors$birth)
emperors$death<-ymd(emperors$death)
emperors$reign.start<-ymd(emperors$reign.start)
emperors$reign.end<-ymd(emperors$reign.end)
emperors$birth[1]<-emperors$birth[1] - 2*years(62)              # Inverting date sign. See emperors$notes[1]
emperors$reign.start[1]<-emperors$reign.start[1] - 2*years(26)  # Inverting date sign. See emperors$notes[1]
emperors$birth[2]<-emperors$birth[2] - 2*years(41)              # Inverting date sign. See emperors$notes[2]
emperors$birth[4]<-emperors$birth[4] - 2*years(9)               # Inverting date sign. See emperors$notes[4]
emperors$birth[6]<-emperors$birth[6] - 2*years(2)               # Inverting date sign. See emperors$notes[6]
# Ordering our factors so that our emperors appear in order
emperors$name     <-factor(emperors$name,
                           levels=emperors[rev(order(emperors$index)),"name"])
emperors$dynasty  <-factor(emperors$dynasty,
                           levels=dynstring)

# Plot the roman emperors' Reigns and Livespans
ggplot(emperors,aes(x=name))+
  geom_linerange(aes(ymin=birth,ymax=death),size=4,color="steelblue1")+
  geom_linerange(aes(ymin=reign.start,ymax=reign.end),size=2,color="black")+
  coord_flip()+
  labs(title="Roman Emperors",
       subtitle="Lifespans and Reigns",
       
       x="",y="Year",
       caption="* Theodosian\ncreated by /u/zonination")+
  facet_grid(dynasty~., scales="free_y",space="free_y")+
  theme_bw()
ggsave("Lifespan.png",width=24,height=14,units="in",dpi=100)

# Temporarily reverse levels for dynasty names
emperors$dynasty  <-factor(emperors$dynasty,
                           levels=rev(dynstring))

# Plot their deaths
ggplot(emperors,aes(x=dynasty))+
  geom_bar(stat="count",aes(fill=cause),color="black")+
  coord_flip()+
  theme_bw()

ggplot(emperors,aes(x=dynasty))+
  geom_bar(stat="count",aes(fill=killer),color="black")+
  coord_flip()+
  theme_bw()