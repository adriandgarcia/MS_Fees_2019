library(tidyverse)
library(lubridate)

READ <- function(FILE) {
  read_csv(FILE,
           n_max = nrow(read_csv(FILE)) - 12,
           guess_max = nrow(read_csv(FILE)) - 12
           )
}

Data1 <- READ("DIRECT/MS_Fee_Report_061220_5000.csv")
Data2 <- READ("DIRECT/MS_Fee_Report_061220_10000.csv")
Data3 <- READ("DIRECT/MS_Fee_Report_061220_15000.csv")
Data4 <- READ("DIRECT/MS_Fee_Report_061220_20000.csv")
Data5 <- READ("DIRECT/MS_Fee_Report_061220_25000.csv")
Data6 <- READ("DIRECT/MS_Fee_Report_061220_25654.csv")

Full_Direct <- full_join(Data1, Data2) %>%
  full_join(., Data3) %>%
  full_join(., Data4) %>%
  full_join(., Data5) %>%
  full_join(., Data6)

write_csv(Full_Direct, "DIRECT/MS_Fee_Report_061220.csv")

rm(list = c(
  "Data1",
  "Data2",
  "Data3",
  "Data4",
  "Data5",
  "Data6",
  "READ",
  "Full_Direct"
))

