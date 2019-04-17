routino_data_dir <- paste("/data/", Sys.info()['user'], "/routino-data", sep="")

origin <- c("DE7 6HQ", "52.973368", "-1.364844")
destination <- c("S6 5AY", "53.396155", "-1.50903")


router_args <- c(paste("--dir=", routino_data_dir, sep=""),
                 "--transport=motorcar", "--prefix=gb", "--quickest",
                paste("--lat1=", origin[2], sep=""), paste("--lon1=", origin[3], sep=""),
                paste("--lat2=", destination[2], sep=""), paste("--lon2=", destination[3], sep=""),
                "--output-text-all", "--output-stdout")

router_result <- system2("router", router_args, stdout=TRUE, stderr=TRUE)

if(!is.null(attr(router_result, "status"))){
  stop(paste("Error: router command failed:", router_result))
}

final_result <- strsplit(router_result[length(router_result)], "\\s+")[[1]]

cat(paste("Journey time between", origin[1], "and", destination[1], "computed by routino to be",
          final_result[9], "minutes.\n"))
