# Advent of Code 2022

This year I'm going to try creating graphical outputs for each puzzle, using [Processing](https://processing.org/) while I earn my ⭐s.

## Day 1: Calorie Counting ⭐⭐

An easy start, but I#m already reminded how clunky Processing and Java are as languages. To be fair, I had over-engineered the Elf class in part 1, thinking that I'd need the seperate values in part 2. In the end I could have just collapsed the values into a single calorie count per elf, and used a normal array, which would have been much less work.

## Day 2: Rock Paper Scissors ⭐⭐

This time I tried to keep things simple, to the point that I just coded a switch-case with the possible outcomes for the RPS game.

## Day 3: Rucksack Reorganization ⭐⭐

Increasingly, I'm reminded how bad an implementation Processing is. I was trying to use ArrayLists, which in Java would have allowed me to filter the list down to unique values (albeit with more implementation than a better language) but Processing for some reason doesn't allow ArrayLists of primatives, and although there's a `IntList` implementation, there is no `CharList` equivilent, or any easy way to convert a `char[]` or `String` into an `IntList`. In the end, writing a class to do the search operations was the simplest solution, although definitely not the most efficient.

## Day 4: Camp Cleanup ⭐⭐

After a little struggle with the `a = b` edge case, I had my first star. The second task was simple enough that I also slightly refactored the parsing, although not so much that it all moved into the parsing routine. (lazy coder!)

## Day 5: Supply Stacks ⭐⭐

This is the first time I can imagine using the graphical part of Processing. But first I had to parse the data and that was complicated enough that it got it's own class. Once I had the data structure laid out, part 1 was pretty straightforward. Since my part 1 operated on the parsed data model, I'm unable to run part 1 and 2 sequentially but, other than that, reworking the algorithm to move the stack was simple enough. Another lazy coder issue though: I didn#t bother with a graphical example of the task.

## Day 6: ???

## Day 7: ???

## Day 8: ???

## Day 9: ???

## Day 10: ???

## Day 11: ???

## Day 12: ???

## Day 13: ???

## Day 14: ???

## Day 15: ???

## Day 16: ???

## Day 17: ???

## Day 18: ???

## Day 19: ???

## Day 20: ???

## Day 21: ???

## Day 22: ???

## Day 23: ???

## Day 24: ???

## Day 25: ???
