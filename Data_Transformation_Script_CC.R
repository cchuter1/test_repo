## Example for Data Workflow

## Simulated Data
data_example_1 <- data.frame(column_a = c("School_a", "School_a", "School_b", "School_C", "School_b"), 
                        column_b = c("Sense_of_belonging", "Communication_with_teacher", "Manage_your_emotions", "Communication_with_teacher", "Peer_friendships"),
                        x = 1:5,
                        y = 6:10)



library(“reshape2”)
data_example_2 <- melt(data_example_1, 
                       id.vars = c("column_a", "column_b"))
