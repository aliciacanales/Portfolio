library(tidyverse) 
library(growthrates)
library(glarma)
library(purrr)
library(ggplot2)

## Locations (7): Coal Oil Point Reserve (COPR), Ormond Beach (Oxnard, CA), Malibu Lagoon (Malibu, CA), Huntington Beach (Huntington Beach, CA), Hayward (San Francisco, CA), Eden Landing Reserve (San Francisco, CA)

## Protected Areas: Coal Oil Point Reserve and Eden Landing Reserve
## State Parks: Malibu Lagoon and Huntington State Park
## Non-affiliated: Ormond Beach and Hayward


## Snowy Plover data from COPR
copr <- data.frame(year = c(seq(2001, 2023, 1)),
                           individuals = c(1, 8, 26, 30, 26, 39, 39, 25, 29, 26, 48, 37, 30, 33, 34, 31, 38, 54, 68, 51, 56, 52, 44))## data from jessica

## Snowy Plover data from Ormond Beach
ormond_breeding_adults<- data.frame(year = c(seq(2014, 2023, 1)),
                                   individuals = c(6, 20, 16, 24, 25, 39, 42, 31, 39, 51))## breeding adult plovers https://www.venturaaudubon.org/_files/ugd/0cfb00_d7c46aca8fcd40309a83c3e54bd84c23.pdf

## Snowy Plover data from Malibu Lagoon
malibu_lagoon <- data.frame(year = c(seq(2004, 2017,1)), ## la county pdf
                            individuals = c(33, 28, 12, 34, 37, 36, 67, 47, 78, 60, 25, 1, 18, 19))

## Snowy Plover data from Huntington Beach
huntington_beach <- data.frame(year = c(seq(2005, 2017,1)),
                               individuals = c(1, 26, 23, 30, 13, 13, 81, 21, 20, 21, 12, 15, 7)) ## LA county pdf

## Snowy Plover data from Hayward Beach
hayward <- data.frame(year = c(seq(2010, 2023, 1)),
                      individuals = c(12, 8, 9, 32, 7, 2, 4, 1, 7, 12, 19, 56, 36, 5)) ## https://www.southbayrestoration.org/sites/default/files/documents/wspl_and_clte_monitoring_in_the_sf_bay_annual_report_2023_final_01-24-24.pdf

## Snowy Plover data from Eden Landing
eden_landing <- data.frame(year = c(seq(2010, 2023, 1)),
                           individuals = c(184, 185, 82, 97, 94, 76, 120, 144, 142, 117, 115, 44, 89, 116)) ## same pdf as above. ecological reserve


## El Nino years data
el_nino_yrs <- data.frame(year = c(seq(2001, 2023, 1)),
                          presence = c(0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 0, 1, 0, 0, 0, 1)) ## https://ggweather.com/enso/oni.html 
