# Langton's Bee

Implements a [Langton's ant](https://en.wikipedia.org/wiki/Langton%27s_ant) simulator using bees.

## Usage

If a bee flies over or is spawned on a black or white [concrete block](https://minecraft.fandom.com/wiki/Concrete), it will be tagged and locked into the automaton routine. Automaton bees will not leave an area of black or white concrete blocks, and will not traverse the Y-axis. If the concrete block underneath an automaton bee is broken, it is unlocked from it's routine and resumes it's usual behavior.

Automaton rules:

1. When an automaton bee flies over a white concrete block, it will turn the block black, turn right, and fly one block.
2. When it flies a black concrete block, it will turn the block white, turn left, and fly one block.
3. If in either of these cases there is a block on the same Y-level obstructing the path of the bee, it will make an additional turn and try to fly forward again, repeating indefinitely.

## Compatibility

Pack format 8, Java Edition 1.18+
