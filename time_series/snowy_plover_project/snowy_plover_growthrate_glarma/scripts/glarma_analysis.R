## Glarma analysis on WSP in el nino years
## Huntington beach and Malibu lagoon beach had non consistent trends. Going to run glarma on only those two populations

## Huntington beach
# Selecting data for Huntington Beach during El Nino years
huntington_nino <- el_nino_yrs[5:17, ] %>% 
  select(-year)

# Combining Huntington Beach data with El Nino years data
updated_huntington <- cbind(huntington_beach, huntington_nino)

# Adding an intercept column
updated_huntington$intercept <- as.integer(1)

# Defining response variable y
y <- updated_huntington$individuals

# Defining explanatory variables for the model
x.1 <- updated_huntington %>% 
  select(intercept, presence) ## explanatory variables the intercept and whether there was an elnino year

# Converting explanatory variables to matrix
x.1 <- as.matrix(x.1)

# Defining null model without El Nino
x.0 <- updated_huntington %>% 
  select(intercept) ## making a null model
x.0 <- as.matrix(x.0)

## null model without elnino
# Fitting the null model using glarma function
huntington_mdl1 <- glarma(y, x.0, phiLags = c(2), type = 'Poi', method = 'FS',
                          residuals = 'Pearson', maxit = 100, grad = 1e-6) 

# Plotting the null model
plot.glarma(huntington_mdl1)

## Model with El Nino
# Fitting the model with El Nino using glarma function
huntington_mdl2 <- glarma(y, x.1, phiLags = c(2), type = 'Poi', method = 'FS',
                          residuals = 'Pearson', maxit = 100, grad = 1e-6)

# Summarizing the null model
summary(huntington_mdl1) ## AIC 201.6985 its better but not by much. coefficient -0.22

# Summarizing the model with El Nino
summary(huntington_mdl2) ## AIC 122.3194 coefficient -0.1697


## Malibu Beach
# Selecting data for Malibu Lagoon during El Nino years
malibu_nino <- el_nino_yrs[4:17, ] %>% 
  select(-year)

# Combining Malibu Lagoon data with El Nino years data
updated_malibu <- cbind(malibu_lagoon, malibu_nino)

# Adding an intercept column
updated_malibu$intercept <- as.integer(1)

# Defining response variable y for Malibu Lagoon
y <- updated_malibu$individuals

# Defining explanatory variables for the model for Malibu Lagoon
x.1 <- updated_malibu %>% 
  select(intercept, presence) ## explanatory variables the intercept and whether there was an elnino year
x.1 <- as.matrix(x.1) ## matrix

# Defining null model without El Nino for Malibu Lagoon
x.0 <- updated_malibu %>% 
  select(intercept) ## making a null model
x.0 <- as.matrix(x.0)

## null model without elnino for Malibu Lagoon
# Fitting the null model for Malibu Lagoon using glarma function
malibu_mdl1 <- glarma(y, x.0, phiLags = c(1), type = 'Poi', method = 'FS',
                      residuals = 'Pearson', maxit = 100, grad = 1e-6) 

# Plotting the null model for Malibu Lagoon
plot.glarma(malibu_mdl1)

## Model with El Nino for Malibu Lagoon
# Fitting the model with El Nino for Malibu Lagoon using glarma function
malibu_mdl2 <- glarma(y, x.1, phiLags = c(1), type = 'Poi', method = 'FS',
                      residuals = 'Pearson', maxit = 100, grad = 1e-6)

# Summarizing the null model for Malibu Lagoon
summary(malibu_mdl1) ## 211.5289 phi coefficient 0.07057

# Summarizing the model with El Nino for Malibu Lagoon
summary(malibu_mdl2) ## 198.3919 the better model phi coefficient -0.03154

## Plotting the two best fit models

## Plotting for Huntington Beach
# Plotting fitted values for Huntington Beach
huntington_modified <- huntington_beach %>% 
  mutate('est' = huntington_mdl2$fitted.values)

# Creating a plot for Huntington Beach
ggplot(huntington_modified, aes(x = year)) +
  geom_point(col = 'gray', aes(y = individuals), size = 3) +
  geom_point(col = 'black', aes(y = est), size = 3) +
  geom_line(col = 'black', aes(y = est)) +
  labs(x = 'Year', y = 'Individual WSP') +
  scale_x_continuous(breaks = c(seq(2005,2016, 1))) +
  annotate("rect", xmin = 2005, xmax =2005.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") + ## adding red lines to indicate el nino years
  annotate("rect", xmin = 2006, xmax =2006.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2007, xmax =2007.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2010, xmax =2010.04, ymin = 0, ymax = 80, alpha = .75,fill = "red")+
  annotate("rect", xmin = 2014, xmax =2014.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2015, xmax =2015.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2016, xmax = 2016.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  ggtitle('GLARMA Model Results of WSP at Huntington Beach')+
  theme_minimal()

## Plotting for Malibu Lagoon
# Plotting fitted values for Malibu Lagoon
malibu_modified <- malibu_lagoon %>% 
  mutate('est' = malibu_mdl1$fitted.values)

# Creating a plot for Malibu Lagoon
ggplot(malibu_modified, aes(x = year)) +
  geom_point(col = 'gray', aes(y = individuals), size = 3) +
  geom_point(col = 'black', aes(y = est), size = 3) +
  geom_line(col = 'black', aes(y = est)) +
  labs(x = 'Year', y = 'Individual WSP') +
  scale_x_continuous(breaks = c(seq(2005,2016, 1))) +
  annotate("rect", xmin = 2005, xmax =2005.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") + ## adding red lines to indicate el nino years
  annotate("rect", xmin = 2006, xmax =2006.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2007, xmax =2007.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2010, xmax =2010.04, ymin = 0, ymax = 80, alpha = .75,fill = "red")+
  annotate("rect", xmin = 2014, xmax =2014.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2015, xmax =2015.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  annotate("rect", xmin = 2016, xmax = 2016.04, ymin = 0, ymax = 80, alpha = .75,fill = "red") +
  ggtitle('GLARMA Model Results of WSP at Malibu Lagoon')+
  theme_minimal()
