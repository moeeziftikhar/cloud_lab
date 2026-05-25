#!/bin/bash
# Student Management Script

 detail="dp schools class 5 "
 detail2="dp schools class 5  "
 my_section="2"
 other_section="3"
echo "--------------------"
echo "student list check"
echo "--------------------"
	
for student in moeez ali ahmad usman matie atif faizan
do
    echo "$student - $detail"
done
for student in mustafa ehsan khalid awais ibrahim
do
    echo "$student - $detail2"
done
echo "----------------"
echo "section checker"
echo "----------------"

section1="2"
section2="3"
if [ $section1 = $my_section ]
then 
echo "these students are from section 2"
  for student in moeez ali ahmad usman matie atif faizan
do
 echo "$student -  $detail"
done
fi
if [ $section2 = $other_section ]
then
echo "these students are from section 3"
for student in  mustafa ehsan khalid awais ibrahin
do
 echo "$student -  $detail2"
done
fi
echo "done"
  
echo "Git is now tracking my work!"
