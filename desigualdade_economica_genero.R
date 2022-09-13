
# Desigualdade econômica entre gêneros -----------------------------------------------------------------------------------------------------
# Auotria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 12/09/22 ---------------------------------------------------------------------------------------------------------------------------
# Referência: https://ourworldindata.org/economic-inequality-by-gender ---------------------------------------------------------------------

# Sobre os dados ---------------------------------------------------------------------------------------------------------------------------

### Nós apresentamos aqui dados sobre desigualdade econômica entre homens e
### mulheres. Nós também discutimos como essas desigualdades tem mudado ao
### longo do tempo.

### Embora as desigualdades de gêneros permaneçam comuns e grandes, hoje
### são menores do que era algumas décadas atrás.

# Carregar pacotes -------------------------------------------------------------------------------------------------------------------------

library(tidyverse)
library(cols4all)
library(RColorBrewer)

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

desg <- read.csv("gender-gap-in-average-wages-ilo.csv")
view(desg)
names(desg)

# Manipular dados --------------------------------------------------------------------------------------------------------------------------

desg <- desg %>%
  select(Entity, Year, Gender.wage.gap....) %>%
  rename(desigualdade = Gender.wage.gap....) %>%
  view()

desg1 <- desg %>%
  filter(Entity %in% c("Brazil", "United States", "United Kingdom",
                       "Australia", "South Korea", "France", "Italy",
                       "China", "Spain", "Colombia")) %>%
  group_by(Entity) %>%
  summarise(media = mean(desigualdade),
            sd = sd(desigualdade),
            n = n(),
            se = sd/sqrt(n)) %>%
  view()

# Gráficos ---------------------------------------------------------------------------------------------------------------------------------

### Seleção de cores

c4a_gui()
c4a("paired", 10)

ggplot(desg1, aes(x = Entity, y = media, fill = Entity)) +
  geom_col() +
  geom_errorbar(aes(ymin = media - se, ymax = media + se)) +
  scale_fill_manual(values = c("#A6CEE3", "#1F78B4", "#B2DF8A",
 "#33A02C", "#FB9A99", "#E31A1C",
 "#FDBF6F", "#FF7F00", 
 "#CAB2D6","#6A3D9A"))
