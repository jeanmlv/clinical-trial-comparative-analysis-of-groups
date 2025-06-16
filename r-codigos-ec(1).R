### Análise Comparativa de Grupos em Estudo Simulado: Efetividade e Segurança de Tratamento ###

# Carregar pacotes necessários
install.packages(c("tidyverse", "survival", "broom", "gtsummary", "cardx"))
library(tidyverse)   # Manipulação de dados
library(survival)    # Análise de sobrevivência
library(broom)       # Organizar resultados de modelos
library(gtsummary)   # Criar tabelas descritivas
library(cardx)       # Criar tabelas descritivas com bom visual

# Gerar dados simulados
set.seed(123)

# Criar variáveis externas para uso dentro do data.frame
grupo <- sample(c("Tratamento", "Controle"), 100, replace = TRUE)

dados <- data.frame(
  id = 1:100,
  grupo = grupo,
  idade = round(rnorm(100, mean = 50, sd = 10), 1),
  sexo = sample(c("Masculino", "Feminino"), 100, replace = TRUE),
  eficacia = rnorm(100, mean = ifelse(grupo == "Tratamento", 70, 65), sd = 5),
  evento_adv = sample(c(0, 1), 100, replace = TRUE, prob = c(0.8, 0.2))
)

# Tabela Descritiva (Tabela 1)
tabela_descritiva <- dados %>%
  tbl_summary(
    by = grupo,
    include = c(idade, sexo, eficacia, evento_adv),
    label = list(
      idade ~ "Idade (anos)",
      sexo ~ "Sexo",
      eficacia ~ "Escore de Eficácia",
      evento_adv ~ "Eventos Adversos"
    ),
    statistic = list(
      all_continuous() ~ "{mean} ({sd})",
      all_categorical() ~ "{n} ({p}%)"
    ),
    digits = list(
      all_continuous() ~ c(1, 1),
      all_categorical() ~ c(0, 1)
    )
  ) %>%
  add_p() %>%
  modify_header(
    label ~ "**Característica**",
    stat_1 ~ "**Controle**\nN = {n}",
    stat_2 ~ "**Tratamento**\nN = {n}"
  ) %>%
  modify_footnote(
    all_stat_cols() ~ "Média (DP) ou n (%)"
  ) %>%
  modify_caption("**Tabela 1. Características Basais dos Pacientes**") %>%
  bold_labels() %>%
  as_gt() %>%
  gt::tab_options(
    table.font.size = "12px",
    column_labels.font.weight = "bold",
    table.width = "85%"
  )

# Visualizar tabela
tabela_descritiva

# Teste t para comparação de eficácia entre grupos
teste_t <- t.test(eficacia ~ grupo, data = dados)
print(teste_t)

# Regressão logística para avaliar fatores associados a eventos adversos
modelo_logistico <- glm(
  evento_adv ~ grupo + idade + sexo,
  family = binomial,
  data = dados
)
summary(modelo_logistico)

# Calcular e exibir Odds Ratios (OR)
exp(coef(modelo_logistico))