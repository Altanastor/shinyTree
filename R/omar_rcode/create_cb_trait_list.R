# out <- paste("omar",1:20,sep="") #vector de items
# out <- as.list(out) #lista de items
# names(out) <- paste("nombre",1:20,sep ="") #nombre de la lista de items
# 
# 
# virus2 <- list(out) #convertimos en sublista
# names(virus)
# 
# virus3 <- list(root2 = list(nombre2 = out))
# 
# List <- list()
# for(i in 1:3){
#   List[[length(List)+1]] <- list(sample(1:3))
# }

#append(virus2,virus2)
#crop_table <- fbmodule::get_module_table("potato")

trait_check_box <- paste(potato$variable,": ",potato$variables_name,sep="")
#agrego el nombre de los check boxes
potato$trait_check_box <- trait_check_box

crop_table <- potato

trial_module <- crop_table %>% select(.,module_name) %>% unique(.)
trial_module <- trial_module[[1]]

trial_abbr<- crop_table %>% select(.,module) %>% unique(.)
trial_abbr <- trial_abbr[[1]]

trial_module_list <- list()
trial_module_list_cb <- list()
n <- length(trial_module)

#for(i in trial_module){

for(i in 1:n){
  
  #crop_table %>% filter(., module_name == "yield")  
  #trait_var <- crop_table %>% filter(., module_name == i) %>% select(., variable)
  trait_var <- crop_table %>% filter(., module_name == trial_module[i]) %>% select(., variable)
  trait_var <- trait_var[[1]]
  trait_var <- as.list(trait_var)
  #extract trait check box names
  trait_names <- crop_table %>% filter(., module_name == trial_module[i]) %>% select(., trait_check_box)
  trait_names <- trait_names[[1]]
  
  names(trait_var) <- trait_names
  trait_list <- list(trait_var)
  names(trait_list) <- trial_module[i]
  
  trial_module_list[[i]] <- trait_list
  
}

trial_module_list

a1 <- trial_module_list[[1]]
for(i in 2:n){
    
    a <- c(a1,trial_module_list[[i]])
    a1 <- a
}




#names(trial_module_list) <- trial_abbr





