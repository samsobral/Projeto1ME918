library(glmnet)

regression = function(metodo, preditora, respostas, dados) {
  
  vec = numeric(length(respostas))
  for (i in 1:length(respostas)) {
    vec[i] = respostas[[i]]
  }

  if (metodo == "Linear") {
  formula = as.formula(paste(glue("{preditora} ~"), paste(vec, collapse = " + ")))
  fit = lm(formula, data = dados)
  }

  if (metodo == "LASSO") {
  x = as.matrix(dados[vec])
  y = as.matrix(dados[preditora[[1]]])
  fit = cv.glmnet(x, y)
  }
  return(fit)
}
