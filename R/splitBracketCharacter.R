splitBracketCharacter <- function(bracketVector){
  gsub("\\[|\\]", "", bracketVector) %>% strsplit(",") %>% unlist()
}
