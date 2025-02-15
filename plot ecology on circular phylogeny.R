library(ggplot2)
library(RColorBrewer)
library(ggtree)
library(colorspace)
divecol<-c(sequential_hcl(6, palette = "Purple-Blue",rev = T)[2:6])


#count number of orders present in the full phylogenetic tree
orderdf<-avgdf %>% count(Order)

#make a phylogeny with each unique order present
g2<-avgdf[!duplicated(avgdf$Order),]#orders only
g2order<-arrange(g2,Order)#sort to match order df
g2order$n<-orderdf$n#attach number of species in order
str(g2order$Binomial)
g2order$full<-paste0(g2order$Order," (",as.character(g2order$n),")")
g2order$Order<-as.character(g2order$Order)

#fig sampling and grouping
mypal <- colorRampPalette(brewer.pal(6, "Blues"))
mypal2 <- colorRampPalette(brewer.pal(6, "YlOrRd"))


#make clade labels
A<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Passeriformes"])
B<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Charadriiformes"])
C<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Falconiformes"])
D<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Accipitriformes"])
E<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Bucerotiformes"])
F<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Gruiformes"])
G<--findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Anseriformes"])
H<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Galliformes"])
I<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Pelecaniformes"])
J<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Procellariiformes"])
K<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Sphenisciformes"])
L<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Suliformes"])
M<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Psittaciformes"])
N<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Columbiformes"])
O<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Strigiformes"])
P<-findMRCA(birdtreels,avgdf$Binomial[avgdf$Order=="Anseriformes"])


#plot
p<-ggtree(birdtreels, layout = "circular", open.angle = 150) %<+% avgdf + ###########, layout = "circular"
  #geom_tiplab(aes(label = Binomial2), linesize = 0.1, offset = 4) + #circular
  #geom_text(aes(label = node))+
  #xlim(NA, 150) + 
  #ylim(NA,140) +
  #geom_tippoint(aes(color = Category), size = 5, shape = 15) +
  #geom_tippoint(aes(x = x+2.5,color = plungedistinct), size = 5, shape = 15) +
  #geom_tippoint(aes(x = x+5, color = as.factor(divescore)), size = 5, shape = 15) +
  scale_color_manual(values = c(mypal(5),"black","grey","green","blue"))+
  geom_cladelabel(A, "Passeriformes", offset=25, barsize=2, align = T, angle=0,offset.text=15, fontsize=3)+
  geom_cladelabel(B, "Charadriiformes", offset=25, barsize=2, align = T, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(C, "Falconiformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(D, "Accipitriformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(E, "Bucerotiformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(F, "Gruiformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(G, "Anseriformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(H, "Galliformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(I, "Pelecaniformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(J, "Procellariiformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(K, "Sphenisciformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(L, "Suliformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(M, "Psittaciformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  #geom_cladelabel(119, "Struthioniformes", offset=0, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(N, "Columbiformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(O, "Strigiformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  geom_cladelabel(P, "Anseriformes", offset=25, barsize=2, angle=0, offset.text=15,   fontsize=3)+
  
  #geom_tiplab2(aes(size = 1, label = Binomialsinge), align = TRUE, geom = "text", angle = 0, offset=15, linetype = "dotted")+
  
  geom_strip("Phaethon_rubricauda", "Phaethon_rubricauda", offset=16, offset.text=15, hjust=0, fontsize=3,
             label="Phaethontifomres")+
  geom_strip(g2order$Binomial[9], g2order$Binomial[9], offset=16, offset.text=15, hjust=0, fontsize=3,
             label=g2order$full[9])+
  geom_strip(g2order$Binomial[20], g2order$Binomial[20], offset=16, offset.text=15, hjust=0, fontsize=3,
             label=g2order$full[20])+
  geom_strip(g2order$Binomial[7], g2order$Binomial[7], offset=16, offset.text=15, hjust=0, fontsize=3,
             label=g2order$full[7])+
  geom_strip(g2order$Binomial[3], g2order$Binomial[3], offset=16, offset.text=15, hjust=0, fontsize=3,
             label=g2order$full[3])+
  geom_strip(g2order$Binomial[15], g2order$Binomial[15], offset=16, offset.text=15, hjust=0, fontsize=3,
             label=g2order$full[15])+
  geom_strip(g2order$Binomial[10], g2order$Binomial[10], offset=16, offset.text=15, hjust=0, fontsize=3,
             label=g2order$full[10])+
  geom_strip(g2order$Binomial[19], g2order$Binomial[19], offset=16, offset.text=15, hjust=0, fontsize=3,
             label=g2order$full[19])+
  geom_strip(g2order$Binomial[25], g2order$Binomial[25], offset=16, offset.text=15, hjust=0, fontsize=3,
             label=g2order$full[25])+
  geom_strip(g2order$Binomial[13], g2order$Binomial[13], offset=16, offset.text=15, hjust=0, fontsize=3,
             label=g2order$full[13])+
  geom_strip(g2order$Binomial[5], g2order$Binomial[5], offset=16, offset.text=15, hjust=0, fontsize=3,
             label=g2order$full[5])
p
###########ESSENTIAL step to change row names forheatmap#############
rownames(avgdf)<-avgdf$Binomial

# The palette with black:
cbbPalette <- c(	"#FFFFFF","#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

BLUE<-c("#d0d1e6",
        "#a6bddb",
        "#74a9cf",
        "#2b8cbe",
        "#045a8d")

#add heatmap to circular phylogeny
k<-gheatmap(p,avgdf[,c("plungedistinct","divescore")], #"Category",
            width = 0.25, offset = 0,
            color = "black",
            #colnames = FALSE,
            colnames_position = "top",
            colnames_angle = 0,
            colnames_offset_x = 0,
            colnames_offset_y = 0)+
  scale_fill_manual(values = c(divecol,"#000000", "#E69F00","#FFFFFF", "#56B4E9"), na.value = "#FFFFFF")
k

#open up the circle
l<-open_tree(k,30) 
l

ggsave("D:/Analysis_plots/ecolcircle.pdf", width=10, height=10)


#############plot heatmap showing sampling of all auditory traits (supplemental materials)#####333
avgdf$Binomial2<-avgdf$Binomial

avgdf$Binomial3<-gsub("_"," ",avgdf$Binomial2)


library(ggtext)
a<-ggtree(birdtreels) %<+% avgdf + ###########, layout = "circular"
  geom_tiplab(aes(label= Binomial3), linesize = 0.01, offset = 30)+
  #geom_tiplab(aes(label=paste0('italic(', Binomial2,')')), 
  #          parse=TRUE, linesize = 0.01, offset = 30)+
  #geom_text(aes(label = node))+
  xlim(NA, 160) + 
  ylim(NA,140) 
a  



avgdf$IACN<-ifelse(avgdf$IAC_detail=="",0,1)
avgdf$IBPN<-ifelse(avgdf$IBP_detail=="",0,1)
names(avgdf)

sampled<-avgdf[,c("Head.mass..g.",
                  "TMtotalarea"  ,        
                  "FPtotalarea"  , 
                  "dis_coltip_TMcentroid",
                  "meanTMangle"  , 
                  "Umbo_distancetoTMplane",
                  "CAtotalarea"  ,                          
                  "RWtotalarea"  ,   
                  "totalEClength",
                  "Columella.length.mm"   ,                 
                  "Columella.volume.mm3" ,         
                  "Behind.TM"  ,
                  "IACN","IBPN"  )]/avgdf[,c("Head.mass..g.",
                                             "TMtotalarea"  ,        
                                             "FPtotalarea"  , 
                                             "dis_coltip_TMcentroid",
                                             "meanTMangle"  , 
                                             "Umbo_distancetoTMplane",
                                             "CAtotalarea"  ,                          
                                             "RWtotalarea"  ,   
                                             "totalEClength",
                                             "Columella.length.mm"   ,                 
                                             "Columella.volume.mm3" ,         
                                             "Behind.TM"  ,
                                             "IACN","IBPN"   )]
colnames(sampled)
colnames(sampled)<-seq(1:length(colnames(sampled)))
#current sampling
k2<-gheatmap(a,sampled, 
             width = 0.4, offset = 0,
             color = "black",
             low = "white",  high = "blue",
             colnames = T,
             colnames_position = "top",
             colnames_angle = 0,
             colnames_offset_x = 0,
             colnames_offset_y = 5)
k2
