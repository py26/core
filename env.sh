


#!/bin/bash

# LeafOS
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

clear

function cmpio {

  if [ "$1" == "" ];
  then
    break
  else
    git clone "$1"
    chmod 777 -R *
    ./*/main.sh || python3 */main.py || gcc */*.c && ./a.out
    
    #sleep 5 # for debugging
  fi
}

#main function
function main {

  while true
  do
    tput setaf 250
    select input in $(cat data/repolist.txt)
    do
      cmpio "$input"
      rm -rf $(basename $input .git)
      clear
      tput setaf 46
      echo "Welcome to LeafEnv!"; echo
      tput setaf 45
      date +"%D %T"
      break
    done
  done
}

tput setaf 46
echo "Welcome to LeafEnv!"; echo

tput setaf 45
date +"%D %T"

main
