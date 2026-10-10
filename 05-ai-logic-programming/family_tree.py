import pandas as pd
from pyDatalog import pyDatalog

# Read the CSV file into a data frame
df = pd.read_csv('family.csv') 
print(df) # print the data frame

# Create terms for the columns of the data frame
pyDatalog.create_terms('name, gender, father, mother, spouse')

# Create terms for the predicates and variables
pyDatalog.create_terms('parent, son, daughter, female, male, X, Y, Z')

# Loop through the rows of the data frame and assert facts based on the values
for index, row in df.iterrows():
  # Assert facts about who is the parent of whom
  if row['father']:
    pyDatalog.assert_fact('parent', row['father'], row['name'])
  if row['mother']:
    pyDatalog.assert_fact('parent', row['mother'], row['name'])
  # Assert facts about who is the spouse of whom
  if row['spouse']:
    pyDatalog.assert_fact('spouse', row['name'], row['spouse'])
  # Assert facts about who is male or female
  if row['gender'] == 'male':
    pyDatalog.assert_fact('male', row['name'])
  elif row['gender'] == 'female':
    pyDatalog.assert_fact('female', row['name'])

# Define rules for father, mother, son and daughter relationships
father(X, Y) <= (male(X) & parent(X, Y))
mother(X, Y) <= (female(X) & parent(X, Y))
son(X, Y) <= (male(X) & parent(Y, X))
daughter(X, Y) <= (female(X) & parent(Y, X))

# Define rules for sibling, aunt, uncle, cousin, niece and nephew relationships
pyDatalog.create_terms('sibling, aunt, uncle, cousin, niece, nephew ,W')
sibling(X, Y) <= (parent(Z, X) & parent(Z, Y) & (X != Y))
aunt(X, Y) <= (female(X) & sibling(X, Z) & parent(Z, Y))
uncle(X,Y) <= (male(X) & sibling(X,Z) & parent(Z,Y))
cousin(X,Y) <= (parent(Z,X) & sibling(Z,W) & parent(W,Y))
niece(X,Y) <= (female(X) & parent(Z,X) & sibling(Z,Y))
nephew(X,Y)<= (male(X)& parent(Z,X)& sibling(Z,Y))

# Define rules for in-law relationships
pyDatalog.create_terms('mother_in_law, father_in_law, brother_in_law, sister_in_law , child')
mother_in_law(X, Y) <= (female(X) & spouse(Y, Z) & parent(X, Z))
father_in_law(X, Y) <= (male(X) & spouse(Y, Z) & parent(X, Z))
brother_in_law(X, Y) <= male(X) & (spouse(Y, Z) & sibling(X, Z)) or (sibling(Y, Z) & spouse(X, Z))
sister_in_law(X, Y) <= female(X) & (spouse(Y, Z) & sibling(X, Z)) or (sibling(Y, Z) & spouse(X, Z))

# Define a rule for the child relationship
child(X, Y) <= parent(Y, X)

# Define rules for step relationships
pyDatalog.create_terms('step_parent, step_child, step_son, step_daughter , step_sibling')
step_parent(X,Y)<= spouse(Y,Z)&parent(Z,X)
step_child(Y,X)<= spouse(Y,Z)&parent(Z,X)
step_son(Y,X)<= male(Y)&spouse(Y,Z)&parent(Z,X)
step_daughter(Y,X)<= female(Y)&spouse(Y,Z)&parent(Z,X)
step_sibling(Y,X)<= step_parent(Z,Y)&parent(Z,X)


# Define rules for grandparent and great-grandparent relationships
pyDatalog.create_terms('grandparent,great_grandparent')
grandparent(X,Y)<=parent(X,Z)& parent(Z,Y)
great_grandparent(X,Y)<= (grandparent(X,Z)& parent(Z,Y))

# Define rules for siblings-in-law and niece/nephew-in-law relationships
pyDatalog.create_terms('sibling_in_law,niece_in_law,nephew_in_law')
sibling_in_law(X,Y)<= (sibling(Y,Z)& spouse(Z,X)) or (sibling(Z,X)& spouse(Y,Z))& (X!=Y)
niece_in_law(X,Y)<= (female(X)& parent(Z,X)& sibling_in_law(Z,Y))
nephew_in_law(X,Y)<= (male(X)& parent(Z,X)& sibling_in_law(Z,Y))

# Who are the grandparents?
print(grandparent(X, Y))

# Who are the great grandparents?
print(great_grandparent(X, Y))

# Who are the parents of whom?
print(parent(X, Y))

# Who are the cousins of whom?
print(cousin(X, Y))
print(parent(X, 'lana'))
print(sibling(X, 'ali'))
print(cousin(X, 'reem'))
print(spouse(X, Y))
print(father(X,Y))
print(mother(X,Y))
print(son(X,Y))
print(daughter(X,Y))
print(aunt(X,Y))
print(uncle(X,Y))
print(niece(X,Y))
print(nephew(X,Y))
print(mother_in_law(X,Y))
print(father_in_law(X,Y))
print(step_child(X,Y))
print(sibling_in_law(X,Y))
print(spouse('ahmad','sara'))

