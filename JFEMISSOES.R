library(rio)
library(tidyverse)


setwd("C:/Users/Matheus/Desktop")
rio::import("jotaefeemissao.csv")%>%
  pivot_wider(id_cols = c("nivel_1", "ano"), names_from = "nivel_1",  values_from = f0_)%>%
  arrange(ano)%>%
  export("jotaefeemissaopronto.csv")

bhjf <- import("emissaominas.csv")%>%
  select(-nivel_1)

popminas <- import("popminas.csv")

emissaominas<- bhjf%>%
  inner_join(popminas, by= c("id_municipio", "ano"))%>%
  mutate(emissaopcap = (f0_ / populacao)*1000)%>%
  pivot_wider(id_cols = c("id_municipio", "ano"), names_from = "id_municipio",  values_from = emissaopcap)%>%
  export("emissa.csv")
