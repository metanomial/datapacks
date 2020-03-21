# Langton's Bees

Langton's Ant simulator using bees.

# Usage

If a bee flies over or is spawned on a black or white concrete block, it will be tagged and locked into the automaton routine. Automaton bees will not leave an area of black or white concrete blocks, and will not traverse the Y-axis. If the concrete block underneath an automaton bee is broken, it is unlocked from it's routine and resumes it's standard AI behavior.

If a bee flies over a white concerete block, it will turn the block black, turn right, and fly one block. If a bee flies a black concrete block, it will turn the block white, turn left, and fly one block. If in either of these cases there is a block on the same Y-level obstructing the path of the bee, it will make an additional turn and try to fly forward again, repeating indenfinitely.
