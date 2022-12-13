//String file = "test.txt";
String file = "data.txt"; 

Packet[] packets;

void setup() {
  parse();
  part1();
}

void parse() {
  String[] lines = loadStrings(file);
  packets = new Packet[2*(lines.length+1)/3];
  
  for(int i=0;i<packets.length/2;i++) {
    packets[2*i] = FromJSON(lines[3*i]); 
    packets[2*i+1] = FromJSON(lines[(3*i)+1]);
  }
}

void part1() {
  int orderedPairs = 0;
  for(int i=0;i<packets.length/2;i++) {
    if(packets[2*i].isLessThan(packets[2*i+1])<1) 
      orderedPairs += (i+1);
  }
  println("Sum of ordered pairs:",orderedPairs);
}
boolean isOrdered(Packet a, Packet b) {
  //do comparison, maybe some recusrion? 
  println(a); 
  println(b); 
  println("-----");
  return true;
}