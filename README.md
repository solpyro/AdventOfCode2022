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

## Day 6: Tuning Trouble ⭐⭐

Simple one-line inputs (and having multiple examples) meant I had to rework my layout a little. But the token search for part 1 was simple enough.Part 2 didn't take much work, just a little refactoring to reuse the token search code.

## Day 7: No Space Left On Device ⭐⭐

Did I have to write a full folder system? Probably not. Havce I checked that the parsing works correctly? Nope.

The parse _seems_ to work perfectly, and the test data gives me the predicted answer, but my real input seems to be cinsistently falling short. I even had to resort to asking on the [subreddit](https://www.reddit.com/r/adventofcode/comments/zgcvdx/2022_day_7_part_1_my_solution_works_for_the/). Thanks to some hints from [u/kg959](https://www.reddit.com/user/kg959/) in the form of more test cases, I realised that by using a HashMap, I'd made the assumption that folder names would be unique across the file system; obviously not the case.

Part 2 was much simpler, and it turned out the list of sizes I'd generated for part 1 were all I needed; the directory tree is completely useless!

## Day 8: Treetop Tree House ⭐

Something quick and simple to visualise at last! After a little stumble, due to some badly copied code, I thought I was cursed with forever low-balling my answers. But having rectified that, part 1 was in the bag. The visualisation will cycle through `vanilla trees` and `visible trees`.

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
