library("data.table")
df=fread('Data/data_preprocessed.csv')

colnames(df)

df$CampaignID=factor(df$CampaignID)
df$CampaignGoalCode=factor(df$CampaignGoalCode)
df$AdDigitalChannel=factor(df$AdDigitalChannel)
df$Adchannelpartner=factor(df$Adchannelpartner)
df$AdContentType=factor(df$AdContentType)
df$AdDevice=factor(df$AdDevice)
df$AudienceType=factor(df$AudienceType)

logistic_model = glm(CTR ~ CampaignID
                     + CampaignGoalCode
                     + AdDigitalChannel
                     + Adchannelpartner
                     + AdContentType
                     + AdDevice
                     + AudienceType, 
                      data = df, 
                      family = binomial(link="logit")) 
summary(logistic_model)

new_df=data.table(logistic_model$fitted.values)
colnames(new_df)='CTR_pred'

write.csv(new_df,'Output/CTR_pred.csv',row.names=FALSE)
