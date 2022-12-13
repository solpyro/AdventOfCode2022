String file = "test.txt";
//String file = "data.txt"; 

Packet[] packets;

void setup() {
  parse();
  part1();
  part2();
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

final String DIVIDER2 = "[[2]]", DIVIDER6 = "[[6]]";
void part2() {
  packets = (Packet[])append(packets,FromJSON(DIVIDER2));
  packets = (Packet[])append(packets,FromJSON(DIVIDER6));
  
  //sort all packets - ugh!
  
  int i=0, index2 = 0, index6 = 0;
  while(index2==0 || index6==0) {
    String packet = packets[i].toString();
    println(packet);
    if(packet.equals(DIVIDER2)) index2 = i+1;
    if(packet.equals(DIVIDER6)) index6 = i+1;
    i++;
  }
  
  println(index2, index6,"Decoder key:",index2*index6);
}