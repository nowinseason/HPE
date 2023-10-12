library("data.table")

df <- fread("5days.csv")
colnames(df)

df$VideoCompletes_scale=scale(df$VideoCompletes)
df$SocialLikes_scale=scale(df$SocialLikes)
df$SocialShares_scale=scale(df$SocialShares)

model <- lm(CTR ~
              VideoCompletes
            + SocialLikes
            + SocialShares
            , data = df)


summary(model)

model2 <- lm(CTR ~
              VideoCompletes_scale
            + SocialLikes_scale
            + SocialShares_scale
            , data = df)


summary(model2)


model3 <- lm(exp(CTR) ~
              VideoCompletes
            + SocialLikes
            + SocialShares
            , data = df)


summary(model3)

model4 <- lm(exp(CTR) ~
               VideoCompletes_scale
             + SocialLikes_scale
             + SocialShares_scale
             , data = df)


summary(model4)













summary(model)
confint(model)
