## Subset

# subset by position
friend[1]
friend[c(1,3)]

# subset by condition
age[age==28]
# assign name of friend to age
names(age) <- friend
df[df$movie_lover == TRUE,c(1,3)]

