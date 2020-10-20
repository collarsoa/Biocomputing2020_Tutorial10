#####Owen Collars and Theo Reed Biocomputing2020_Tutorial10

##### Problem 1 Analysis of Sports Data
#load the data
game_stats<-read.table("UWvMSU_1-22-13.txt", header = TRUE, stringsAsFactors = FALSE)

#create empty vectors that are the length of time points for each team, will be used
UW_score_overtime<-c()
cumulative_UW_score<-c()
UW_score_timepoint<-c()
MSU_score_overtime<-c()
cumulative_MSU_score<-c()
MSU_score_timepoint<-c()


#iterate through the data frame, and add each point earned in the order it was earned to the empty vectors
for(i in 1:nrow(game_stats)){
  if(game_stats$team[i]=='UW'){
    UW_score_overtime<-append(UW_score_overtime, game_stats$score[i])
    UW_score_timepoint<-append(UW_score_timepoint, game_stats$time[i])
  }else{
    MSU_score_overtime<-append(MSU_score_overtime, game_stats$score[i])
    MSU_score_timepoint<-append(MSU_score_timepoint, game_stats$time[i])
  }
}

#create vectors with the cumulative sum of each team's score
cumulative_UW_score<-append(cumulative_UW_score, cumsum(UW_score_overtime))
cumulative_MSU_score<-append(cumulative_MSU_score, cumsum(MSU_score_overtime))

#create a data frame for each team's score and the timepoint that they earned that score. I don't end up using these to make the plot, but the assignment wanted data frames. So here they are.
MSU_data<-data.frame(cumulative_MSU_score, MSU_score_timepoint)
UW_data<-data.frame(cumulative_UW_score, UW_score_timepoint)

#plot the two data frames on the same graph, green is the line for MSU and blue is the line for UW
plot(MSU_score_timepoint, cumulative_MSU_score, "l", col="green")+lines(UW_score_timepoint, cumulative_UW_score, col="blue")







