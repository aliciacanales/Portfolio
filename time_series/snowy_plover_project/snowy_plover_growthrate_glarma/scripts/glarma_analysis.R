##..........................Glarma analysis on WSP in el nino years........................................

## Huntington beach and Malibu lagoon beach had non consistent trends. Going to run glarma on only those two populations

## Huntington beach
huntington_nino<- el_nino_yrs[5:16, ] %>% 
  select(-year)

updated_huntington <- cbind(huntington_beach, huntington_nino)

updated_huntington$intercept <- as.integer(1)

y <- updated_huntington$individuals

x.1 <- updated_huntington %>% 
  select(intercept, presence) ## explanatory variables the intercept and whether there was an elnino year

x.1<- as.matrix(x.1) ## matrix


x.0 <- updated_huntington %>% 
  select(intercept) ## making a null model

x.0 <- as.matrix(x.0)

## null model without elnino

huntington_mdl1 <- glarma(y, x.0, phiLags = c(2), type = 'Poi', method = 'FS',
                    residuals = 'Pearson', maxit = 100, grad = 1e-6) 

plot.glarma(huntington_mdl1)

## model with elnino
huntington_mdl2 <- glarma(y, x.1, phiLags = c(2), type = 'Poi', method = 'FS',
                    residuals = 'Pearson', maxit = 100, grad = 1e-6)

summary(huntington_mdl1) ## 201.6985 this is the null its better but not by much coefficient -0.22
summary(huntington_mdl2) ## 122.3194 coefficient -0.1697


## Malibu Beach

malibu_nino<- el_nino_yrs[4:16, ] %>% 
  select(-year)

updated_malibu <- cbind(malibu_lagoon, malibu_nino)

updated_malibu$intercept <- as.integer(1)

y <- updated_malibu$individuals

x.1 <- updated_malibu %>% 
  select(intercept, presence) ## explanatory variables the intercept and whether there was an elnino year
x.1<- as.matrix(x.1) ## matrix


x.0 <- updated_malibu %>% 
  select(intercept) ## making a null model

x.0 <- as.matrix(x.0)

## null model without elnino

malibu_mdl1 <- glarma(y, x.0, phiLags = c(1), type = 'Poi', method = 'FS',
                          residuals = 'Pearson', maxit = 100, grad = 1e-6) 

plot.glarma(malibu_mdl2)

## model with elnino
malibu_mdl2 <- glarma(y, x.1, phiLags = c(1), type = 'Poi', method = 'FS',
                          residuals = 'Pearson', maxit = 100, grad = 1e-6)

summary(malibu_mdl1) ## 211.5289 phi coefficient 0.07057
summary(malibu_mdl2) ## 198.3919 the better model phi coefficient -0.03154

##.........Plotting the two best fit models............

## huntington beach
huntington_modified <- huntington_beach %>% 
  mutate('est' = huntington_mdl2$fitted.values)

ggplot(huntington_modified, aes(x = year)) +
  geom_point(col = 'gray', aes(y = individuals), size = 3) +
  geom_point(col = 'black', aes(y = est), size = 3) +
  geom_line(col = 'black', aes(y = est)) +
  labs(x = 'Year', y = 'Individual WSP') +
  scale_x_continuous(breaks = c(seq(2005,2016, 1))) +
  annotate("rect", xmin = 2005, xmax =2005.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2006, xmax =2006.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2007, xmax =2007.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2010, xmax =2010.04, ymin = 0, ymax = 80, alpha = .75,fill = "red")+
  annotate("rect", xmin = 2014, xmax =2014.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2015, xmax =2015.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2016, xmax = 2016.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  ggtitle('GLARMA Model Results of WSP at Huntington Beach')+
  theme_minimal()


## Malibu
malibu_modified <- malibu_lagoon %>% 
  mutate('est' = malibu_mdl2$fitted.values)

ggplot(malibu_modified, aes(x = year)) +
  geom_point(col = 'gray', aes(y = individuals), size = 3) +
  geom_point(col = 'black', aes(y = est), size = 3) +
  geom_line(col = 'black', aes(y = est)) +
  labs(x = 'Year', y = 'Individual WSP') +
  scale_x_continuous(breaks = c(seq(2005,2016, 1))) +
  annotate("rect", xmin = 2005, xmax =2005.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2006, xmax =2006.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2007, xmax =2007.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2010, xmax =2010.04, ymin = 0, ymax = 80, alpha = .75,fill = "red")+
  annotate("rect", xmin = 2014, xmax =2014.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2015, xmax =2015.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2016, xmax = 2016.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  ggtitle('GLARMA Model Results of WSP at Malibu Lagoon')+
  theme_minimal()




