//String file = "test.txt";
String file = "data.txt";

HashMap<String, Monkey> troop;

void setup() {
  parse();
  part1();
}

void part1() {
  println("root will shout",troop.get("root").getNumber());
}