#!/bin/bash/

mkdir Name_Surname && [ -d ./Name_Surname ] && touch ./Name_Surname/my_file && [[ -e ./Name_Surname/my_file ]] && echo "Hello" >> ./Name_Surname/my_file && [[ -s ./Name_Surname/my_file ]] && cat ./Name_Surname/my_file || echo "Something went wrong"
