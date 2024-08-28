library(jsonlite)

predict_function = function(pred) {
  predicoes = numeric(length(pred))

  for (i in 1:length(pred)) {
  predicoes[i] = predict(fit, pred[[i]])
  }
  return(predicoes)
}



