# Advent of Code 2022

This year I'm going to try creating graphical outputs for each puzzle, using [Processing](https://processing.org/) while I earn my ⭐s.

## Day 1: Calorie Counting ⭐⭐

An easy start, but I'm already reminded how clunky Processing and Java are as languages. To be fair, I had over-engineered the Elf class in part 1, thinking that I'd need the seperate values in part 2. In the end I could have just collapsed the values into a single calorie count per elf, and used a normal array, which would have been much less work.

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

## Day 8: Treetop Tree House ⭐⭐

Something quick and simple to visualise at last! After a little stumble, due to some badly copied code, I thought I was cursed with forever low-balling my answers. But having rectified that, part 1 was in the bag. The visualisation will cycle through `vanilla trees` and `visible trees` when you press any key.

Figuring out the counting algorithm for higest tree took some time and trial and error, but eventially I was getting expected numbers for the example. The visualisation has a third option now colouring each tree in a gradient of how many trees are visible.

## Day 9: Rope Bridge ⭐⭐

Another one begging to be visualised, although this feels like the kind of simulation that could get out of hand by part 2. Coding up the rules for part 1 was easy enough, although running my input took **3 minutes and 15 seconds**! I did however get to see this:

![Day 9 Part 1 - Tail's path](Day9/data.txt.png)

Part 2 required some code rearrangement, but it wasn't too much work to extend my existing process. And somehow the rearrangements got my processing time down to **3 minutes and 11 seconds** even though we're dealing with more points in the rope.

![Day 9 Part 2 - Tail's path](Day9/data.txt_10.png)

## Day 10: Cathode-Ray Tube ⭐⭐

Dear diary, today I made a tiny Atari emulator, apparently. I hit a wall in part 1 for a little while, since I'd somehow read the instructions to check the `X` value every _20_ cycles, rather than 40. But after I'd rectified that mistake, the solutions to part 1 and 2 came pretty easily. It helped that I'd already implemented something close to the CRT when I'd created an oscilloscope to check the path `X` travelled during the program.

## Day 11: Monkey in the Middle ⭐⭐

The challenge today appears to be parsing the input data. It's eslecially problematic as Java (and therefore Processing) don't allow for passing functions as arguments. Fortunately the monkeys for my inputs all use one of three operations so I can just use a flag instead and hardcode the operations. After fighting with the `x ^= n` assignment operator, which doesn#t seem to do `x = x ^ n` like the docs say, but instead (in the one instance it was used) subtracted 2 from the value, I'd gotten my part 1 star.

Now that we're running for so many rounds and the worry factor never reduces,I had to rework the item values as `long`s to avoid the int overflow issue. That brought it's own issues in that the calculations appear to be incorrect now, but after some careful review of the recent changes and restoring the logs I had for part 1, I was getting correct values for part 1 again. Running part 2 reveled that even `long` isn't big enough, so it#s time to rework (again) using `BigInteger`. 

That solution _might_ work if I haveenough ram and time, but I never saw it progress beyond about 10%, so I dug around the subreddit to see what I'd missed. It turns out

> You'll need to **find another way to keep your worry levels manageable**.

did not mean `divide by 1` but that I should calculate a valid number ti divide by. I had a vague memory, from my A-level Maths, as to what I should do and checking through some of the solutions confirmed my hunch. Now my code runs at a decent speed, but yields the wrong answer again. Thanks to a small hint from [u/1234abcddcba4321](https://www.reddit.com/r/adventofcode/comments/zih7gf/comment/izrck61/) I'd fogured out the bug in my code and had subdued the monkeys on my back. I elected not te remove the `BigInteger` from my code because there are other things to do with my life.

## Day 12: Hill Climbing Algorithm

I don't really have the energy to deal with this after a day's work. I've parsed the data and got a nice rendering of the terrain, along with some border walls for squares where the gradient is too steep, but before I can continue I'll need to refresh my knowledge of pathfinding algorithms.

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
