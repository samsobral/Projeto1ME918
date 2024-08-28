library(glue)
library(readr)
library(yaml)
source("scripts/treinamento.R")
source("scripts/predicao.R")

config = read_yaml("configuracao.yaml")
dados = read_csv(glue("entradas/{config$dados}"), show_col_types = FALSE)
pred = read_json("entradas/predicoes.json")

fit = regression(metodo = config$metodo,
           preditora = config$variaveis$Preditoras$y, 
           respostas = config$variaveis$Resposta,
           dados = dados)

predicoes = predict_function(pred)

valores_preditos = read_json("saidas/predicoes_regressao.json")

write_rds(fit, "saidas/fit.rds")
write_json(toJSON(predicoes), "saidas/predicoes_regressao.json")
