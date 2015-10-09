trebu.geno.df = read.csv(file = "trebu_geno.csv",header = T,stringsAsFactors = F, na.strings ="")

trebu.geno.df$CONS = gsub("_",replacement = "",trebu.geno.df$CONS)
#which(grepl(".",trebu.geno.df$CONS))  ### it does not work, I had to manually delete the "." in the csv file
#trebu.geno.df$CONS = gsub(".",replacement = "",trebu.geno.df$CONS)

#duplicated.trebu = c(filter(trebu.geno.df, GENOTYPE_NUMBER == 2)$SAMPLE_ID,trebu.geno.df$SAMPLE_ID[which(duplicated(trebu.geno.df$SAMPLE_ID))])

#duplicated.trebu = duplicated.trebu[-which(duplicated(duplicated.trebu))]

trebu.geno.df$SAMPLE_ID[which(duplicated(trebu.geno.df$SAMPLE_ID))]
## There are no duplicates in SAMPLE_ID


# #### duplicated with no geno 1 or 2
# 
# b = sapply(duplicated.trebu, function (x) {
#   a = filter(trebu.geno.df, SAMPLE_ID == x)
#   if (length(unique(a$GENOTYPE_NUMBER)) == 1) {
#     
#     as.character(x)
#     
#   } } )
# 
# unlist(b)
# # ZA257   ZA201   ZA166    ZA79     ZA8   ZA200     ZA5     ZA6   ZA309    3998 
# # "ZA257" "ZA201" "ZA166"  "ZA79"   "ZA8" "ZA200"   "ZA5"   "ZA6" "ZA309"  "3998"  
# 
# dupl.to.check = c("ZA257", "ZA201" ,"ZA166","ZA79","ZA8","ZA200","ZA5","ZA6","ZA309","3998" )
# 
# repo.all = read.csv("SM001_SM070_Repository.csv", header = T,
#                     stringsAsFactors = F, na.strings=c("","NA"))
# 
# 
# repo.all$Population = rep(NA,nrow(repo.all))
# repo.all$Uncertain.Sex = rep(NA,nrow(repo.all))
# 
# trebu.row = grepl("trebu",repo.all$WATER_NAME)
# repo.all$Population[trebu.row] = "trebu"
# repo.trebu = filter(repo.all, Population == "trebu")
# 
# repo.trebu.dup = filter(repo.trebu, SAMPLE_ID %in% dupl.to.check)
# 
# repo.trebu.dup = arrange(repo.trebu.dup, SAMPLE_ID)
# 
# write.table(repo.trebu.dup[,1:12],"repo.trebu.dup.csv", sep = ",", quote = F, row.names = F)
# 
# 
# first.all = 6
# 
# > duplicated.trebu
# [1] "2860" "6604" "8515" "6513" "6578" "6580" "6582" "6587" "6592" "6594" "4321" "4334" "4818" "2832"
# "2860"  "ZA257" "ZA201" "ZA166" "ZA79"  "ZA8"   "ZA200" "ZA5" "ZA6"   "ZA309" "3998" 
# 
# sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[1])[1],first.all:ncol(trebu.geno.df)] == 0)  #6
# [1] 192
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[1])[2],first.all:ncol(trebu.geno.df)] == 0) #7
# [1] 22
# 
# ##########
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[2])[1],first.all:ncol(trebu.geno.df)] == 0)  #201
# [1] 72
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[2])[2],first.all:ncol(trebu.geno.df)] == 0) #202
# [1] 40
# 
# 
# #####
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[3])[1],first.all:ncol(trebu.geno.df)] == 0)  #413
# [1] 58
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[3])[2],first.all:ncol(trebu.geno.df)] == 0) #414
# [1] 8
# 
# #####
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[4])[1],first.all:ncol(trebu.geno.df)] == 0)  #520
# [1] 144
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[4])[2],first.all:ncol(trebu.geno.df)] == 0) #521
# [1] 114
# 
# #####
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[5])[1],first.all:ncol(trebu.geno.df)] == 0)  #569
# [1] 92
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[5])[2],first.all:ncol(trebu.geno.df)] == 0) #570
# [1] 90
# 
# #####
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[6])[1],first.all:ncol(trebu.geno.df)] == 0)  #572
# [1] 132
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[6])[2],first.all:ncol(trebu.geno.df)] == 0) #573
# [1] 66
# 
# #####
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[7])[1],first.all:ncol(trebu.geno.df)] == 0)  #574
# [1] 110
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[7])[2],first.all:ncol(trebu.geno.df)] == 0) #575
# [1] 64
# 
# #####
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[8])[1],first.all:ncol(trebu.geno.df)] == 0)  #578
# [1] 66
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[8])[2],first.all:ncol(trebu.geno.df)] == 0) #579
# [1] 62
# 
# #####
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[9])[1],first.all:ncol(trebu.geno.df)] == 0)  #584
# [1] 120
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[9])[2],first.all:ncol(trebu.geno.df)] == 0) #585
# [1] 62
# 
# #####
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[10])[1],first.all:ncol(trebu.geno.df)] == 0)  #586
# [1] 160
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[10])[2],first.all:ncol(trebu.geno.df)] == 0) #587
# [1] 86
# 
# #####
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[11])[1],first.all:ncol(trebu.geno.df)] == 0)  #657
# [1] 188
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[11])[2],first.all:ncol(trebu.geno.df)] == 0) #658
# [1] 128
# 
# #####
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[12])[1],first.all:ncol(trebu.geno.df)] == 0)  #671
# [1] 188
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[12])[2],first.all:ncol(trebu.geno.df)] == 0) #672
# [1] 10
# 
# #####
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[13])[1],first.all:ncol(trebu.geno.df)] == 0)  #697
# [1] 76
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[13])[2],first.all:ncol(trebu.geno.df)] == 0) #698
# [1] 6
# 
# #####
# 
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[14])[1],first.all:ncol(trebu.geno.df)] == 0)  #1424
# [1] 58
# > sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[14])[2],first.all:ncol(trebu.geno.df)] == 0) #1425
# [1] 22
# 
# ##### "2860"  "ZA257" "ZA201" "ZA166" "ZA79"  "ZA8"   "ZA200" "ZA5" "ZA6"   "ZA309" "3998"
# 
# sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[15])[1],first.all:ncol(trebu.geno.df)] == 0)  #1424
# 
# sum(trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[15])[2],first.all:ncol(trebu.geno.df)] == 0) #1425
# 
# a = trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[15])[1],first.all:ncol(trebu.geno.df)]
# b = trebu.geno.df[which(trebu.geno.df$SAMPLE_ID == duplicated.trebu[15])[2],first.all:ncol(trebu.geno.df)]
# ###
# 
# dupl.to.del = c(6,201,413,520,569,572,574,578,584,586,657,671,697,1424)
# 
# trebu.geno.df = trebu.geno.df[-dupl.to.del,]
# 
# ##########

library(dplyr)

trebu.df = read.csv("trebu_2014_complete.csv",header=T, # read dataset of the population from csv
                  stringsAsFactors = FALSE,na.strings ="")

trebu.match.df = read.csv(file = "trebu.matches.csv",header = T,stringsAsFactors = F, na.strings ="")

trebu.match.df.red  = filter(trebu.match.df, No..Alleles > 95)

#### assign the sample names

trebu.match.df.red$Sample1 = rep(0,nrow(trebu.match.df.red))
trebu.match.df.red$Sample2 = rep(0,nrow(trebu.match.df.red))


for (i in 1:nrow(trebu.match.df.red)) {
  
  sam1 = which(trebu.geno.df$CONS == trebu.match.df.red$Sample.1[i])
  sam2 = which(trebu.geno.df$CONS == trebu.match.df.red$Sample.2[i])
  
  trebu.match.df.red$Sample1[i] =  trebu.geno.df$SAMPLE_ID[sam1]
  trebu.match.df.red$Sample2[i] =  trebu.geno.df$SAMPLE_ID[sam2]
  
  rm(sam1)
  rm(sam2)
  
}

# I want to move the marks starting with Y or T to Sample2 (Y are very often the too smalls and T were the samples from 2003)

zsam1 = which(grepl("T",trebu.match.df.red$Sample1) == T)
zsam2 = which(grepl("Y",trebu.match.df.red$Sample1) == T)

zsam = c(zsam1,zsam2)

for (i in 1:length(zsam)) {
  
  prov = trebu.match.df.red$Sample2[zsam[i]]
  trebu.match.df.red$Sample2[zsam[i]] = trebu.match.df.red$Sample1[zsam[i]]
  trebu.match.df.red$Sample1[zsam[i]] = prov
  
  
}

trebu.match.df.red$cont = 1:(nrow(trebu.match.df.red))


### there are some spaces in the Fin field

trebu.df$Fin = gsub("[ ]","",trebu.df$Fin )

trebu.df = arrange(trebu.df, Mark,Year,Month)

### change colname to Adip

colnames(trebu.df)[which(colnames(trebu.df) == "Fin")] = "Adip"

matching.list.trebu = vector("list", nrow( trebu.match.df.red))


for (i in 1:nrow( trebu.match.df.red)) {
  
  matching.list.trebu[[i]]$id1 =  subset(trebu.df, Mark ==
                                         as.character(trebu.match.df.red$Sample1[i]) |
                                         Adip == as.character(trebu.match.df.red$Sample1[i]))
  
  #grepl(as.character( trebu.match.df.red$Sample1[i]),Adip))
  
  matching.list.trebu[[i]]$id2 =  subset(trebu.df, Mark ==
                                         as.character( trebu.match.df.red$Sample2[i]) |
                                         Adip == as.character(trebu.match.df.red$Sample2[i]))
  
  #grepl(as.character( trebu.match.df.red$Sample2[i]),Adip))
  
}


write.table(trebu.match.df.red,file = "trebu.match.df.red.csv",quote = F, sep = ',',row.names = F) 


Sampletot = with(trebu.match.df.red, c(Sample1, Sample2))

sort(table(Sampletot))


#####

# trebu.geno.df = read.csv(file = "trebugeno.csv",header = T,stringsAsFactors = F, na.strings ="")
# trebu.geno.df$CONS = gsub("_",replacement = "",trebu.geno.df$CONS)
##### import repo

### Needed corrections for mistakes in reading tubes
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "3998")[1]] = "4998"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA166")[1]] = "ZA66"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA257")[2]] = "ZA237"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA309")[2]] = "ZA306"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA79")[1]] = "ZA179"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA989")] = "ZA181"  ### needs to be changed in the repo
# 
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "16918")] = "16418" ### needs to be changed in the repo
#### assign sex

repo.all = read.csv("SM001_SM070_Repository.csv", header = T,
                    stringsAsFactors = F, na.strings=c("","NA"))

repo.all$Population = rep(NA,nrow(repo.all))
repo.all$Uncertain.Sex = rep(NA,nrow(repo.all))

huda.row = grepl("Huda",repo.all$WATER_NAME)
repo.all$Population[huda.row] = "Huda"
lipo.row = grepl("Lipo",repo.all$WATER_NAME)
repo.all$Population[lipo.row] = "Lipo"
uppidri.row = grepl("Upper",repo.all$WATER_NAME)
repo.all$Population[uppidri.row] = "UIdri"
zadla.row = grepl("Zadla",repo.all$WATER_NAME)
repo.all$Population[zadla.row] = "Zadla"
trebu.row = grepl("Trebu",repo.all$WATER_NAME)
repo.all$Population[trebu.row] = "Trebu"
trebu.row = grepl("trebu",repo.all$WATER_NAME)
repo.all$Population[trebu.row] = "trebu"
loidri.row = grepl("Lower",repo.all$WATER_NAME)
repo.all$Population[loidri.row] = "LIdri"
stu.row = grepl("Stu",repo.all$WATER_NAME)
repo.all$Population[stu.row] = "Stu"
sve.row = grepl("Sve",repo.all$WATER_NAME)
repo.all$Population[sve.row] = "Sve"

repo.all$Uncertain.Sex[grepl("uncertain",repo.all$SAMPLE_COMMENTS)] = "Y"

repo.trebu = filter(repo.all, Population == "Trebu" )


# ### ZA200, ZA201, ZA5, ZA6, ZA8 come in two copies, I call them a and b
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA200")[1]] = "ZA200a"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA200")[2]] = "ZA200b"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA201")[1]] = "ZA201a"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA201")[2]] = "ZA201b"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA5")[1]] = "ZA5a"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA5")[2]] = "ZA5b"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA6")[1]] = "ZA6a"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA6")[2]] = "ZA6b"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA8")[1]] = "ZA8a"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA8")[2]] = "ZA8b"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ML000")] = "Z4C00"
# 
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "ZA200")[1]] = "ZA200a"
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "ZA200")[2]] = "ZA200b"
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "ZA201")[1]] = "ZA201a"
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "ZA201")[2]] = "ZA201b"
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "ZA5")[1]] = "ZA5a"
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "ZA5")[2]] = "ZA5b"
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "ZA6")[1]] = "ZA6a"
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "ZA6")[2]] = "ZA6b"
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "ZA8")[1]] = "ZA8a"
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "ZA8")[2]] = "ZA8b"
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "ML000")] = "Z4C00"
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "ZA989")] = "ZA181"  ### needs to be changed in the repo
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "16918")] = "16418" ### needs to be changed in the repo
# repo.trebu$SAMPLE_ID[which(repo.trebu$SAMPLE_ID == "Z0201")] = "ZA201"
# which(!trebu.geno.df$SAMPLE_ID %in% repo.trebu$SAMPLE_ID)

repo.trebu$SAMPLE_ID[which(!repo.trebu$SAMPLE_ID %in% trebu.geno.df$SAMPLE_ID)]


# match(trebu.geno.df$SAMPLE_ID,repo.trebu$SAMPLE_ID)

for (i in 1:nrow(trebu.geno.df)) {
  
  if (!is.na(trebu.geno.df$SAMPLE_ID[i])) {
    pos.row = which(repo.trebu$SAMPLE_ID == trebu.geno.df$SAMPLE_ID[i])
    #trebu.geno.df$SEX[i] = repo.trebu$SEX[pos.row]
    trebu.geno.df$SAMPLE_COMMENTS[i] = repo.trebu$SAMPLE_COMMENTS[pos.row]
  }
  
}

# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ML000")] = "Z4C00"
# ### ZA200, ZA201, ZA5, ZA6, ZA8 come in two copies, I call them a and b
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA200")[1]] = "ZA200a"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA200")[2]] = "ZA200b"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA201")[1]] = "ZA201a"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA201")[2]] = "ZA201b"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA5")[1]] = "ZA5a"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA5")[2]] = "ZA5b"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA6")[1]] = "ZA6a"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA6")[2]] = "ZA6b"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA8")[1]] = "ZA8a"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA8")[2]] = "ZA8b"

#first.gen = 6  # column of the first allele in the geno file
pos.loci = which(grepl("Sma", colnames(trebu.geno.df)))

trebu.geno.df.red = trebu.geno.df
ncol.trebu.geno.df = ncol(trebu.geno.df.red)


### create new datafile with matches
data.match = trebu.match.df.red
### create new columns 
data.match$Sample3 = rep(NA,nrow(data.match)) ## Sample 3 matching 1 and 2
data.match$Sample4 = rep(NA,nrow(data.match)) ## Sample  matching 1, 2 and 3
data.match$Type.S.1 = rep(NA,nrow(data.match)) ## number of type loci (Alleles) for Sample 1
data.match$Type.S.2 = rep(NA,nrow(data.match))
data.match$Type.S.3 = rep(NA,nrow(data.match))
data.match$Type.S.4 = rep(NA,nrow(data.match))
data.match$Sex.S.1 = rep(NA,nrow(data.match))  # sex of sample 1
data.match$Sex.S.2 = rep(NA,nrow(data.match)) # sex of sample 2
data.match$Sex.S.3 = rep(NA,nrow(data.match)) # sex of sample 3
data.match$Sex.S.4 = rep(NA,nrow(data.match)) # sex of sample 4
data.match$heteroz.1 = rep(NA,nrow(data.match))  # heteroz of sample 1
data.match$heteroz.2 = rep(NA,nrow(data.match))
data.match$Sampletokeep = rep(NA,nrow(data.match))  ### common Mark/tag for the matching samples
data.match$Locitokeep = rep(NA,nrow(data.match)) ### genotype to be kept for the matching samples

#### find matching samples 3 and 4
for (i in 1:nrow(data.match)) {
  sampl.df = data.match[i,]
  ## partial dataset with Sample1 and Sample 2 in the dataset
  sampl1.df = filter(data.match, Sample1 %in% c(Sample1[i],Sample2[i]) | Sample2 %in% c(Sample1[i],Sample2[i]))
  if (nrow(sampl1.df)>1) {
    uniq.v = unique(c(sampl1.df$Sample1, sampl1.df$Sample2))
    exc.v = uniq.v[!uniq.v %in% c(sampl.df$Sample1, sampl.df$Sample2)]
    if (length(exc.v)>0) {
      if (length(exc.v)==1) {
        data.match$Sample3[i] = exc.v  
        print(data.match$Sample3[i])
      } else {
        data.match$Sample3[i] = exc.v[1]
        data.match$Sample4[i] = exc.v[2]
        
      }
    }
  }
}

#### heterozigosity -- uses function heter.f
source("heter.r")
for (i in 1:nrow(data.match)) {
  
  loci.1.v = as.numeric(filter(trebu.geno.df.red, SAMPLE_ID == data.match$Sample1[i])[1,pos.loci])
  loci.2.v = as.numeric(filter(trebu.geno.df.red, SAMPLE_ID == data.match$Sample2[i])[1,pos.loci])
  loci.3.v = as.numeric(filter(trebu.geno.df.red, SAMPLE_ID == data.match$Sample3[i])[1,pos.loci])
  loci.4.v = as.numeric(filter(trebu.geno.df.red, SAMPLE_ID == data.match$Sample4[i])[1,pos.loci])
  
  if(length(loci.1.v)>0){
    
    data.match$Type.S.1[i] = sum(loci.1.v!=0)
    data.match$Sex.S.1[i] = filter(trebu.geno.df.red, SAMPLE_ID == data.match$Sample1[i])$SEX[1]
    data.match$heteroz.1[i] = heter.f(loci.1.v) 
  }
  
  if(length(loci.2.v)>0){
    
    data.match$Type.S.2[i] = sum(loci.2.v!=0)
    data.match$Sex.S.2[i] = filter(trebu.geno.df.red, SAMPLE_ID == data.match$Sample2[i])$SEX[1]
    data.match$heteroz.2[i] = heter.f(loci.2.v) 
  }
  
  if(length(loci.3.v)>0){
    
    data.match$Type.S.3[i] = sum(loci.3.v!=0)
    data.match$Sex.S.3[i] = filter(trebu.geno.df.red, SAMPLE_ID == data.match$Sample3[i])$SEX[1]
  }
  
  if(length(loci.4.v)>0){
    
    data.match$Type.S.4[i] = sum(loci.4.v!=0)
    data.match$Sex.S.4[i] = filter(trebu.geno.df.red, SAMPLE_ID == data.match$Sample4[i])$SEX[1]
  }
  
  loci.all.v = c(data.match$Type.S.1[i],data.match$Type.S.2[i],data.match$Type.S.3[i],data.match$Type.S.4[i])
  samesam.v = with(data.match[i,], c(Sample1, Sample2, Sample3, Sample4))
  ## of the same samples, I keep that with more loci typed
  data.match$Locitokeep[i] = samesam.v[which(loci.all.v == max(loci.all.v,na.rm = T))][1]
  
}

#write.table(data.match,file = "data.match.csv", quote = F, sep = ',',row.names = F) 


#### Correct the wrong 
### ZA989 should ZA181
### ML000 should be Z4C00
# data.match$Sample2[which(data.match$Sample2 == "ZA989")] = "ZA181"
# data.match$Sample2[which(data.match$Sample2 == "ML000")] = "Z4C00"
# 
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ZA989")] = "ZA181"
# trebu.geno.df$SAMPLE_ID[which(trebu.geno.df$SAMPLE_ID == "ML000")] = "Z4C00"

#### add a cohort column
data.match$Cohort = rep(NA, nrow(data.match))

# ##########  uniform the a,b,1,2  -- certain samples were in tubes with a and b, same samples I then use the same names
# data.match$Sample1[which(data.match$Sample1 == "4797a")] = "4797" 
# data.match$Sample2[which(data.match$Sample1 == "4797b")] = "4797" 
# 
# data.match$Sample1[which(data.match$Sample1 == "2866-1")] = "2866"
# 
# data.match$Sample1[which(data.match$Sample1 == "560-1")] = "560"
# data.match$Sample2[which(data.match$Sample1 == "560-1")] = "560"
# data.match$Sample3[which(data.match$Sample1 == "560-1")] = "560"
# data.match$Sample1[which(data.match$Sample1 == "560-2")] = "560"
# data.match$Sample2[which(data.match$Sample1 == "560-2")] = "560"
# data.match$Sample3[which(data.match$Sample1 == "560-2")] = "560"
# 
# data.match$Sample1[which(data.match$Sample1 == "3083-1")] = "3083"
# data.match$Sample2[which(data.match$Sample1 == "3083-1")] = "3083"
# 
# data.match$Sample1[which(data.match$Sample1 == "2936-1")] = "2936"
# data.match$Sample2[which(data.match$Sample1 == "2936-1")] = "2936"
# 
# data.match$Sample1[which(data.match$Sample1 == "4683a")] = "4683" 
# data.match$Sample2[which(data.match$Sample1 == "4683b")] = "4683"
# 
# data.match$Sample1[which(data.match$Sample1 == "4535A")] = "4535" 
# data.match$Sample2[which(data.match$Sample2 == "4535B")] = "4535"
# 
# data.match$Sample1[which(data.match$Sample1 == "ML000")] = "Z4C00"
# 
# 
# data.match$Sample1[with(data.match,grepl("2866",Sample2))] = "2866"
# data.match$Sample1[with(data.match,grepl("2866",Sample2))] = "2866"
# data.match$Sample3[with(data.match,grepl("2866",Sample3))] = "2866"



## There are a number of Adip with the same label. I assign (randomly a _1, _2, etc. to each of them)
dupl.str = c("Y2248", "Y2530", "Y2531","Y2532","Y2533","Y2534")



trebu.df$Comment = rep(NA,nrow(trebu.df))

trebu.df$Comment[which(grepl("dead",trebu.df$Adip))] = "dead"

trebu.df$Adip = gsub("dead","",trebu.df$Adip)

for (i in 1:length(dupl.str)) {
  
  row.str = which(trebu.df$Adip == dupl.str[i])
  
  trebu.df$Adip[row.str] = paste(trebu.df$Adip[row.str],1:length(row.str),sep="_")
  
  
}

########  for the matching samples I use a common tag and it is the one for which we have Mark and
## and among those the one with minimum length -- otherwise I use Adip

for (i in 1:nrow(data.match)) {
  sampl.df = data.match[i,]
  
  tag.sampl.v = with(sampl.df, c(Sample1, Sample2, Sample3, Sample4))
  tag.sampl.v = tag.sampl.v[!is.na(tag.sampl.v)]
  
  #sampl.trebu.df = filter(trebu.df, Mark %in% tag.sampl.v | Adip %in% tag.sampl.v)
  sampl.trebu.df = filter(trebu.df, Mark %in% tag.sampl.v | Adip %in% tag.sampl.v)
  
  if (nrow(sampl.trebu.df) > 0) {
    data.match$Cohort[i] = sampl.trebu.df$Cohort[which(sampl.trebu.df$Length == min(sampl.trebu.df$Length))[1]] ### need to add [1] for ties
    sampl.trebu.df1 = filter(sampl.trebu.df, !is.na(Mark))
    if (nrow(sampl.trebu.df1) > 0) {
      data.match$Sampletokeep[i] =  sampl.trebu.df1$Mark[which(sampl.trebu.df1$Length == min(sampl.trebu.df1$Length))[1]] ### need to add [1] for ties
      
    } else {data.match$Sampletokeep[i] == sampl.trebu.df1$Mark[1]}
    
    
  }
  
  
  
}

### this column was done by hand in excel by comparing all the matchin samples
## and checking whether according to the database the matching was possible 
Match_YN.v = read.csv("Match_YN.csv", header = T, stringsAsFactors = F)
### Join the data.frames
data.match= cbind.data.frame(data.match,Match_YN.v) 

###  keep only the greatest Type.S
#trebu.geno.df.red 
a4797a.pos = which(trebu.geno.df.red$SAMPLE_ID == "4797a")  ## delete
a4797b.pos = which(trebu.geno.df.red$SAMPLE_ID == "4797b") ## keep
a501a.pos = which(trebu.geno.df.red$SAMPLE_ID == "560-1") ## keep
a501b.pos = which(trebu.geno.df.red$SAMPLE_ID == "560-2") ## delete
a501c.pos = which(trebu.geno.df.red$SAMPLE_ID == "560-3") ## delete
a3083a.pos = which(trebu.geno.df.red$SAMPLE_ID == "3083-1") ## delete
a3083b.pos = which(trebu.geno.df.red$SAMPLE_ID == "3083-2") ## keep
a2936a.pos = which(trebu.geno.df.red$SAMPLE_ID == "2936-1") ## delete
a2936b.pos = which(trebu.geno.df.red$SAMPLE_ID == "2936-2") ## keep
a4683a.pos = which(trebu.geno.df.red$SAMPLE_ID == "4683a") ## delete
a4683b.pos = which(trebu.geno.df.red$SAMPLE_ID == "4683b") ## keep
a2866a.pos = which(trebu.geno.df.red$SAMPLE_ID == "2866-1") ## keep 
a2866b.pos = which(trebu.geno.df.red$SAMPLE_ID == "2866-2") ## delete
a4535a.pos = which(trebu.geno.df.red$SAMPLE_ID == "4535A") ## keep 
a4535b.pos = which(trebu.geno.df.red$SAMPLE_ID == "4535B") # delete

trebu.geno.df.red$SAMPLE_ID[a4797a.pos] = "4797"
trebu.geno.df.red$SAMPLE_ID[a501a.pos] = "501"
trebu.geno.df.red$SAMPLE_ID[a3083b.pos] = "3083"
trebu.geno.df.red$SAMPLE_ID[a2936b.pos] = "2936"
trebu.geno.df.red$SAMPLE_ID[a4683b.pos] = "4683"
trebu.geno.df.red$SAMPLE_ID[a2866a.pos] = "2866"
trebu.geno.df.red$SAMPLE_ID[a4535a.pos] = "4535"

trebu.geno.df.red = trebu.geno.df.red[-c(a4797b.pos,a501b.pos,a501c.pos,
                               a3083a.pos,a2936a.pos,a4683a.pos,a2866b.pos,a4535b.pos),]

excl.v = which(!trebu.geno.df.red$SAMPLE_ID %in% c(trebu.df$Mark, trebu.df$Adip))
trebu.geno.df.red$SAMPLE_ID[excl.v]
# [1] "ZA9_1"   "ZA9_2"   "ZA87"    "Z100(3)" "ZA318"
##  "ZA9" there were 2 fins in the tubes
## ZA87 is ZA87 DEAD
## Z100(3) I guess is one of 3 fins
## ZA318 is ZA318 DEAD

#### match cohort to year of birth
coh.v = c("P","C96","C97","C98","C99","C00","C01","C02","C03","C04","C05","C06","C07","C08","C09","C10","C11","C12","C13","C14",NA)
yob.v = c(1995:2014,NA)
coh.match.df = data.frame(Cohort = coh.v, yob = yob.v,stringsAsFactors = F)

## assign year of birth from Cohort
data.match$yob = sapply(data.match$Cohort, function (j) {
  coh.match.df$yob[which(coh.match.df$Cohort == j)]
})

### assign yob to fish in trebu.df

## there is one cohort with NA, it is a C03

trebu.df$Cohort[is.na(trebu.df$Cohort)] = "C03"

yob.v = sapply(trebu.df$Cohort, function (j) {
  coh.match.df$yob[as.numeric(which(coh.match.df$Cohort == j))]
})

#### assign the correct one to those in data.matched in trebu.df


trebu.df$yob = yob.v
trebu.df$yob_cor = trebu.df$yob
trebu.df$Cohort_cor = trebu.df$Cohort
trebu.df$Age_cor = trebu.df$Age

for (i in 1:nrow(data.match)) {
  
  if (data.match$Match.Y.N[i] == "Y") {
    
    samesam.v = with(data.match[i,], c(Sample1, Sample2, Sample3, Sample4))
    samesam.v = samesam.v[!is.na(samesam.v)]
    same.row = which(trebu.df$Mark %in% samesam.v | trebu.df$Adip %in% samesam.v) 
    trebu.df$Cohort_cor[same.row] = data.match$Cohort[i]
    trebu.df$yob_cor[same.row] = data.match$yob[i]
    trebu.df$Age_cor[same.row] = trebu.df$Year[same.row] - trebu.df$yob_cor[same.row]
    
  }
  
}



##### prepare the geno dataset for franz

## keep only one the matching samples (Loci to keep)

trebu.geno.df.red.franz = trebu.geno.df.red

for (i in 1:nrow(data.match)) {
  #print(i)
  samesam.v = with(data.match[i,], c(Sample1, Sample2, Sample3, Sample4))
  samesam.v = samesam.v[!is.na(samesam.v)]
  samesam.v = samesam.v[-which(samesam.v == data.match$Locitokeep[i])]
  #print(samesam.v)
  if (length(which(trebu.geno.df.red.franz$SAMPLE_ID %in% samesam.v))>0){
    trebu.geno.df.red.franz = trebu.geno.df.red.franz[-which(trebu.geno.df.red.franz$SAMPLE_ID %in% samesam.v),]
    #print(nrow(trebu.geno.df.red.franz))
  }
}

### give to that sample the Sampletokeep

for (i in 1:nrow(data.match)) {
  #print(i)
  samesam.v = with(data.match[i,], c(Sample1, Sample2, Sample3, Sample4))
  samesam.v = samesam.v[!is.na(samesam.v)]
  #print(samesam.v)
  if (length(which(trebu.geno.df.red.franz$SAMPLE_ID %in% samesam.v))>0){
    trebu.geno.df.red.franz$SAMPLE_ID[which(trebu.geno.df.red.franz$SAMPLE_ID %in% samesam.v)] = data.match$Sampletokeep[i]
    #print(nrow(trebu.geno.df.red.franz))
  }
}

## assign year of birth

trebu.geno.df.red.franz$yob = rep(NA,nrow(trebu.geno.df.red.franz))
trebu.geno.df.red.franz$Cohort = rep(NA,nrow(trebu.geno.df.red.franz))
trebu.geno.df.red.franz$last.year = rep(NA,nrow(trebu.geno.df.red.franz))

for (i in 1:nrow(trebu.geno.df.red.franz)) {
  #print(i)
  
  if (length(which(trebu.geno.df.red.franz$SAMPLE_ID[i] %in% c(trebu.df$Mark, trebu.df$Adip)))>0 & !is.na(trebu.geno.df.red.franz$SAMPLE_ID[i])){
    trebu.geno.df.red.franz$yob[i] = filter(trebu.df, Mark == trebu.geno.df.red.franz$SAMPLE_ID[i] | Adip == trebu.geno.df.red.franz$SAMPLE_ID[i])$yob_cor[1]
    trebu.geno.df.red.franz$Cohort[i] = filter(trebu.df, Mark == trebu.geno.df.red.franz$SAMPLE_ID[i] | Adip == trebu.geno.df.red.franz$SAMPLE_ID[i])$Cohort_cor[1]
    trebu.geno.df.red.franz$last.year[i] = max(filter(trebu.df, 
                                                 Mark == trebu.geno.df.red.franz$SAMPLE_ID[i] | Adip == trebu.geno.df.red.franz$SAMPLE_ID[i])$Year,na.rm = T)
    #print(nrow(trebu.geno.df.red.franz))
  }
}

# trebu.geno.df.red.franz$SAMPLE_ID[which(trebu.geno.df.red.franz$SAMPLE_ID == "ZA989")] = "ZA181"
# trebu.geno.df.red.franz$SAMPLE_ID[which(trebu.geno.df.red.franz$SAMPLE_ID == "ML000")] = "Z4C00"
# 
# trebu.geno.df.red.franz$SAMPLE_ID[which(trebu.geno.df.red.franz$SAMPLE_ID == "16918")] = "16418"

##filter(trebu.geno.df.red.franz,is.na(yob))[,1:5]
data.match$Sex.mismatch = rep(NA, nrow(data.match))
## Sexes not matching
for (i in 1:nrow(data.match)) {
  #print(i)
  sex.v = with(data.match[i,], c(Sex.S.1, Sex.S.2, Sex.S.3, Sex.S.4))
  sex.v = sex.v[!is.na(sex.v)]
  #print(samesam.v)
  if (length(sex.v)>0){
    data.match$Sex.mismatch[i] = length(unique(sex.v))
    #print(nrow(trebu.geno.df.red.franz))
  }
}

sex.mismatch.df = filter(data.match, Sex.mismatch > 1)
write.table(sex.mismatch.df, "sex.mismatch.csv", quote = F, row.names = F, sep = ",")

##### Assign sample to keep to trebu.df$Mark_cor



trebu.df$Adip[which(trebu.df$Adip == "DEAD")] = NA
trebu.df$Adip[which(grepl("ZA87", trebu.df$Adip))] = "ZA87"
trebu.df$Adip[which(grepl("ZA318", trebu.df$Adip))] = "ZA318"
trebu.df$Adip[which(grepl("Z100", trebu.df$Adip))][3] = "Z100(3)"

trebu.df$Mark_cor = rep(NA, nrow(trebu.df))
trebu.df$Mark_cor = ifelse(is.na(trebu.df$Adip), trebu.df$Mark, trebu.df$Adip)

# [1] "ZA9_1"   "ZA9_2"   "ZA87"    "Z100(3)" "ZA318"
##  "ZA9" there were 2 fins in the tubes
## ZA87 is ZA87 DEAD
## Z100(3) I guess is one of 3 fins
## ZA318 is ZA318 DEAD

for (i in 1:nrow(data.match)) {
  #print(i)
  samesam.v = with(data.match[i,], c(Sample1, Sample2, Sample3, Sample4))
  samesam.v = samesam.v[!is.na(samesam.v)]
  #print(samesam.v)
  if (length(which(trebu.df$Mark_cor %in% samesam.v))>0){
    trebu.df$Mark_cor[which(trebu.df$Mark_cor %in% samesam.v)] = data.match$Sampletokeep[i]
    #print(nrow(trebu.geno.df.red.franz))
  }
}

trebu.df = arrange(trebu.df, Mark_cor, Year)
