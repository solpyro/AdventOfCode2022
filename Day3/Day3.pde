//String file = "test.txt";
String file = "data.txt"; 

Rucksack[] rucksacks;

void setup() {
  parse();
  part1();
}

void parse() {
  String[] lines = loadStrings(file);
  rucksacks = new Rucksack[lines.length];
  for(int i=0;i<lines.length;i++)
    rucksacks[i] = new Rucksack(lines[i]);
  println("Rucksacks: "+rucksacks.length);
}

void part1() {
  int totalPriorities = 0;
  
  for(Rucksack rucksack:rucksacks)
    totalPriorities += GetPriority(rucksack.InBoth());
  
  println("Sum of priorities: "+totalPriorities);
}
int GetPriority(char item) {
  int value = int(item);
  value -= (value > 90)
    ? 96
    : 38;
  return value;
}