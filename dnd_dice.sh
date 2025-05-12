#!/bin/zsh

# Clear the terminal screen for a clean start
clear

# Print description of standard DnD dice
echo "Standard Dungeons & Dragons Dice:"
echo "---------------------------------"
echo "d4  - Four-sided die (tetrahedron)"
echo "d6  - Six-sided die (cube)"
echo "d8  - Eight-sided die (octahedron)"
echo "d10 (regular) - Ten-sided die (pentagonal trapezohedron)"
echo "d10 (percentile) - Ten-sided die (for percentages)"
echo "d12 - Twelve-sided die (dodecahedron)"
echo "d20 - Twenty-sided die (icosahedron)"
echo

# Function to roll a die with given number of sides using /dev/urandom for better randomness
roll_die() {
  local sides=$1
  # Read 2 bytes from /dev/urandom, convert to integer, modulo sides + 1
  # to get a number in [1, sides]
  local rand_num=$(od -An -N2 -tu2 < /dev/urandom | tr -d ' ')
  echo $(( (rand_num % sides) + 1 ))
}

total=0

echo "Rolling the 7 standard DnD dice:"

# Roll d4, d6, d8
for die in d4 d6 d8; do
  case $die in
    d4) sides=4 ;;
    d6) sides=6 ;;
    d8) sides=8 ;;
  esac
  result=$(roll_die $sides)
  echo "$die: $result"
  (( total += result ))
done

# Roll first d10 (regular)
d10_regular=$(roll_die 10)
echo "d10 (regular): $d10_regular"
(( total += d10_regular ))

# Roll second d10 (percentile)
d10_percentile=$(roll_die 10)
echo "d10 (percentile): $d10_percentile"
(( total += d10_percentile ))

# Roll d12
d12=$(roll_die 12)
echo "d12: $d12"
(( total += d12 ))

# Finally roll d20
d20=$(roll_die 20)
echo "d20: $d20"
(( total += d20 ))

echo
echo "Total sum: $total"
