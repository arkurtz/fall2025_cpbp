pacman::p_load(dplyr)
cacao_data <- read.csv("~/Desktop/cpbp/cacao/flavors_of_cacao.csv")

cacao_percent_as_dec <- cacao_data %>%
  mutate(cacao_decimal = as.numeric(sub("%", "", Cocoa.Percent))/100)

cacao_clean <- cacao_percent_as_dec %>%
  rename(company = Company...Maker.if.known., 
         bean_origin = Specific.Bean.Origin.or.Bar.Name,
         review_date = Review.Date,
         cocoa_percent = Cocoa.Percent,
         company_location = Company.Location,
         rating = Rating,
         bean_type = Bean.Type,
         broad_bean_origin = Broad.Bean.Origin)

write.csv(cacao_clean, file = "~/Desktop/cpbp/cacao/cacao_clean.csv", row.names = FALSE)
