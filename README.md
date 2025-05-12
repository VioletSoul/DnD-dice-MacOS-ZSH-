# DnD Dice Roller (zsh script)

A simple and reliable zsh script for macOS that simulates rolling the seven standard Dungeons & Dragons dice:

- **d4** (four-sided)
- **d6** (six-sided)
- **d8** (eight-sided)
- **d10** (normal ten-sided)
- **d10** (percentile ten-sided)
- **d12** (twelve-sided)
- **d20** (twenty-sided)

## Features

- Clears the terminal screen and displays a clear description of each die before rolling
- Rolls each die once and outputs the result on a separate line
- Ensures the two d10 dice produce different results to avoid duplicates
- Uses `/dev/urandom` for high-quality randomness on macOS
- Calculates and displays the total sum of all dice rolls
- Written specifically for zsh on macOS

## Usage

1. Clone or download the script file `dnd_dice.sh`.
2. Make it executable:

chmod +x dnd_dice.sh

3. Run the script in your terminal:

./dnd_dice.sh

You will see a clean output with dice descriptions, individual roll results, and the total sum.

