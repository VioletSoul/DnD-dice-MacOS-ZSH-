#!/bin/zsh

# Clear the terminal screen for a clean start
clear

# Print description of standard DnD dice
echo "Standard Dungeons & Dragons Dice:"
echo "---------------------------------"
echo "d4  - Four-sided die (tetrahedron)"
echo "d6  - Six-sided die (cube)"
echo "d8  - Eight-sided die (octahedron)"
echo "d10 - Ten-sided die (pentagonal trapezohedron)"
echo "d12 - Twelve-sided die (dodecahedron) - normal"
echo "d12 - Twelve-sided die (dodecahedron) - percentile (used for percentages)"
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

# Roll d4, d6, d8, d10 normally first
for die in d4 d6 d8 d10; do
  case $die in
    d4) sides=4 ;;
    d6) sides=6 ;;
    d8) sides=8 ;;
    d10) sides=10 ;;
  esac
  result=$(roll_die $sides)
  echo "$die: $result"
  (( total += result ))
done

# Roll first d12 (normal)
d12_normal=$(roll_die 12)
echo "d12 (normal): $d12_normal"
(( total += d12_normal ))

# Roll second d12 (percentile), ensuring it differs from first d12
max_attempts=100
attempt=0
while true; do
  d12_percentile=$(roll_die 12)
  (( attempt++ ))
  if [[ $d12_percentile -ne $d12_normal ]]; then
    break
  fi
  if (( attempt >= max_attempts )); then
    # Safety fallback: accept duplicate after many tries
    break
  fi
done
echo "d12 (percentile): $d12_percentile"
(( total += d12_percentile ))

# Finally roll d20
d20=$(roll_die 20)
echo "d20: $d20"
(( total += d20 ))

echo
echo "Total sum: $total"
