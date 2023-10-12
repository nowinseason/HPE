
#install.packages('stargazer')

library("data.table")
library("plm")
library("stargazer")


list.files('Output')
df <-fread('Output/return2_30days.csv')
df2 <-fread('Output/return2_30_adv_days.csv')
colnames(df)
colnames(df2)
df2$AudienceType<-factor(df2$AudienceType)
df2$AdDigitalChannel<-factor(df2$AdDigitalChannel)
pvar(df)
model1 <- lm(conversion ~
              VideoCompletes
            + SocialLikes
            + SocialShares
            + CTR
            , data = df)

fixed <- plm(conversion ~
              VideoCompletes
            + SocialLikes
            + SocialShares
            , data = df2,
            index=c('AdDigitalChannel','AudienceType'),
            effect = "individual",
            model = "within")
fixed2 <- plm(conversion ~
               VideoCompletes
             + SocialLikes
             + SocialShares
             +CTR
             , data = df2,
             index=c('AdDigitalChannel','AudienceType'),
             effect = "individual",
             model = "within")

random <- plm(conversion ~
               VideoCompletes
             + SocialLikes
             + SocialShares
             , data = df2,
             index=c('AdDigitalChannel','AudienceType'),
             effect = "individual",
             model = "random",
             random.method = 'walhus')


stargazer(model1, fixed,fixed2, random, 
          type="text")

