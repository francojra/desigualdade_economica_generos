
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

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

desg <- read.csv("gender-gap-in-average-wages-ilo.csv")
view(desg)
names(desg)

# Manipular dados --------------------------------------------------------------------------------------------------------------------------

desg <- desg %>%
  select(Entity, Year, Gender.wage.gap....) %>%
  rename(desigualdade = Gender.wage.gap....) %>%
  view()
