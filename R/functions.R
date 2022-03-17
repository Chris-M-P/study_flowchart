# A function to record inclusions in and exclusions from a study datatset
# To facilitate producing study flowcharts
# TODO create dataframe of included/excluded cases
exclude <- function(.data, ...){
  excl_df <- dplyr::filter(.data, ...)
  # return(newdata)
  # extract the optional arguments to be used as placeholder descriptions of filtering
  mc <- match.call()
  res <- c()
  for (i in 3:length(mc)){
    # apply the filter
    # newdata <- dplyr::filter(.data, {{ mc[[i]] }})
    print(mc[[i]])
    # extract the filter command
    res <- c(res, mc[[i]])
  }
  res
  # length(mc)
  
}



# A function to create or append a flowchart tracker
fc_tracker <- function(fc_df, position, sample_n, level, excl, excl_details){
  # Check whether fc_df exists.
  # If fc_df exists then append it
  # If fc_df doesn't exist then build it
  # If fc_df has been left blank then make a generic fc_df
  arg <- quo_name(enquo(fc_df))
  print(arg)
  if(exists(arg))
  {
    print("Flowchart tracker needs to be appended with new data")
    return(fc_df)
  }
  else if (!exists(arg))
  {
    print("time to make a new fc tracker")
    fc_df <- data.frame(
      ID = integer(),
      position = integer(),
      sample_n = integer(),
      level = factor(),
      excl = logical(),
      excl_details = character()
      ) %>% 
      as_tibble()
    return(fc_df)
  }
  else if (is.na(fc_df))
  {
    fc_details <- data.frame(
      ID = integer(),
      position = integer(),
      sample_n = integer(),
      level = factor(),
      excl = logical(),
      excl_details = character()
    ) %>% 
      as_tibble()
  }
  
}

B <- fc_tracker(fc_df = B)

# mtcars %>% filter(am == 1)

# temp_Df <- exclude(mtcars, am == 1, gear == 4)

mtcars %>% exclude(am == 1, gear == 4)


mtcars %>% filter(am!=1, gear!=4)
mtcars %>% filter(!c(am==1), !c(gear==4))

# pseudocode:
# Starting dataset
# Get starting N
# Generate temp df of excluded people
# Extract exclusion numbers for each reason
# Use setdiff to drop excluded people from main df
# Return the updated main df
# Create/append the flowchart dataset to describe steps

