##............................Running the Growth Rate (GR) function over all individual data..........................

## Nt+1 = aNt
## If a>1 Postive growth rate
## If a<1 Negative growth rate

## Running function over COPR data
copr <- map_df(.x = list(copr), ~growth_rate_fcn(.x, individuals = copr$individuals)) %>% 
  drop_na() ## mean GR= 1.475765

## Running function over Eden Landing data
eden_landing <- map_df(.x = list(eden_landing), ~growth_rate_fcn(.x, individuals = copr$individuals)) %>% 
  drop_na() ## mean GR = 1.053062

## Running function over Hayward data
hayward <- map_df(.x = list(hayward), ~growth_rate_fcn(.x, individuals = copr$individuals)) %>% 
  drop_na() ## mean GR = 1.702186

## Running function over Huntington Beach data
huntington_beach <- map_df(.x = list(huntington_beach), ~growth_rate_fcn(.x, individuals = copr$individuals)) %>% 
  drop_na() ## mean GR = 3.3669 but has an outlier the first year

## Running function over Malibu Lagoon data
malibu_lagoon <- map_df(.x = list(malibu_lagoon), ~growth_rate_fcn(.x, individuals = copr$individuals)) %>% 
  drop_na() ## mean GR = 2.359633 but has an outlier

## Running function over Ormond Beach data
ormond_breeding_adults <- map_df(.x = list(ormond_breeding_adults), ~growth_rate_fcn(.x, individuals = copr$individuals)) %>% 
  drop_na() ## mean GR = 1.401753