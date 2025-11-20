setwd("YOUR-LANDMARK-DATA-PATH")

filelist <- list.files(pattern = ".xlsx")     #Store all file names in one R object

names <- gsub(".xlsx"
              , "", filelist)          #Remove the .xlsx from the names
ar <- NULL                                    #Create a NULL object to run the following loop
for(i in 1:97){                              #Start the search loop, setting the number of files available 
  A <- as.matrix(read_excel(filelist[i]))     #Reads files with readxl function as matrix; always use "i" in filelist to read into the matrix
  ar <- rbind(ar, A)                          #Connect the matrix, in the first loop the matrix fills the NULL object, from then on the number increases 
}                                             #End of the loop
ar <- arrayspecs(ar, 1800, 3)                  #Converts matrix to array with 400 rows (number of semilandmarks we use to change thus accordingly to your study) and 3 columns (x,y,z coordinates) for each object (in our case x 502)
dimnames(ar)[[3]] <- names                    #Name the layers with the names defined above (filename without xlsx).

ar[1:5,,1:5]                                  #Test the e.g., first 5 objects, showing the first 5 rows and all columns available

setwd("YOUR-PATH")

# Your large array or data object

save(ar, file = "ar_data.RData") # tp use it in a markdwon file

