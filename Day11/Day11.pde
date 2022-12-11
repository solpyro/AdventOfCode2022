//String file = "test.txt";
String file = "data.txt"; 

Monkey[] troop;

void setup() {
  parse();
  
  for(int round = 1; round <= 20; round++) {
    println("----- Round",round,"-----");
    for(Monkey monkey: troop)
      monkey.Turn();
      
    for(int i = 0;i<troop.length;i++) {
      println("Monkey",i,"-",troop[i].Items);
    }
  }
  
  part1();
}

void part1() {
  int[] inspections = new int[troop.length];
  for(int i=0;i<troop.length;i++)
    inspections[i] = troop[i].InspectionCounter;
  inspections = subset(reverse(sort(inspections)),0,2);
  println("Level of Monkey business:",inspections[0]*inspections[1]);
}