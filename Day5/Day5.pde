String file = "test.txt";
//String file = "data.txt"; 

void setup() {
  parse();
  //part1();
  //part2();
}

void parse() {
  String[] lines = loadStrings(file);
  int split = 0;
  
  while(lines[split].length()>0)
    split++;
  
  StringList[] stacks = Parse.Containers(subset(lines,0,split));
  String[] instructions = subset(lines,split+1);
  
  println("Stacks: "+stacks);
  println("Instructions: "+instructions.length);
}