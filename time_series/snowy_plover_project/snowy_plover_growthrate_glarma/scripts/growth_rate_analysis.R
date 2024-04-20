## bringing in the datasets based on their protection status

##...........................Natural Reserves.............................. 
view(eden_landing)
view(copr_nesting)

## fitting the data to model using fit_easylinear

## Eden Landing single growth curve
eden_landing %>%
  ggplot(aes(x = year, y = individuals)) +
  geom_line() +
  theme(text = element_text(size = 12)) +
  ylim(0, NA) +
  theme_minimal()

## models

## fit_spline
mdl1 <- fit_spline(eden_landing$year, eden_landing$individuals)
coef(mdl1) ## mumax is 2.59e-01

par(mfrow = c(1, 2))
plot(mdl1, log = "y", cex.lab = 2, cex.axis = 2) ## logged
plot(mdl1, cex.lab = 2, cex.axis = 2)

## fit_easylinear
mdl2 <- fit_easylinear(eden_landing$year, eden_landing$individuals,quota = 0.95)
coef(mdl2) ## mumax is 1.46e-01

## fit_growthmodel
p <- c(y0 = 1.840000e+02, mumax = 2.59e-01, K = 180)
mdl3 <- fit_growthmodel(FUN = grow_logistic,
                        p = p, 
                        eden_landing$year, eden_landing$individuals)
coef(mdl3)

par(mfrow = c(1, 2))
plot(mdl3, log = "y", cex.lab = 2, cex.axis = 2) ## logged
plot(mdl3, cex.lab = 2, cex.axis = 2)

## Copr
copr_nesting %>%
  ggplot(aes(x = year, y = number_of_nests)) +
  geom_line() +
  theme(text = element_text(size = 12)) +
  ylim(0, NA) +
  theme_minimal()

## fit_spline
mdl1 <- fit_spline(copr_nesting$year, copr_nesting$number_of_nests)
coef(mdl1) ## mumax is 2.59e-01

par(mfrow = c(1, 2))
plot(mdl1, log = "y", cex.lab = 2, cex.axis = 2) ## logged
plot(mdl1, cex.lab = 2, cex.axis = 2)

## fit_easylinear
mdl4 <- fit_easylinear(copr_nesting$year, copr_nesting$number_of_nests, quota = 0.95)
coef(mdl4) ## mumax is 1.46e-01

par(mfrow = c(1, 2))
plot(mdl4, log = "y", cex.lab = 2, cex.axis = 2) ## logged
plot(mdl4)

## fit_growthmodel
p <- c(y0 = 1.0, mumax = 3.10, K = 100)
mdl5 <- fit_growthmodel(FUN = grow_logistic,
                        p = p, 
                        copr_nesting$year, copr_nesting$number_of_nests)
coef(mdl5)

par(mfrow = c(1, 2))
plot(mdl5, log = "y", cex.lab = 2, cex.axis = 2) ## logged
plot(mdl5, cex.lab = 2, cex.axis = 2)


