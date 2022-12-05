//String file = "test.txt";
String file = "data.txt"; 

String[][] pairs;

void setup() {
  parse();
  part1();
}

void parse() {
  String[] lines = loadStrings(file);
  pairs = new String[lines.length][];
  for(int i=0;i< lines.length; i++) {
    pairs[i] = lines[i].split(",");
  }
  println("Pairs: "+pairs.length);
}

void part1() {
  int containedPairs = 0;
  
  for(String[] pair: pairs) {
    if(IsFullyContained(pair))
      containedPairs++;
  }
  
  println("Contained pairs: "+containedPairs);
}

boolean IsFullyContained(String[] pair) {
  String[] a = pair[0].split("-");
  String[] b = pair[1].split("-");
  
  if(int(a[0])==int(b[0])) return true;
  
  if(int(a[0])<int(b[0])){
    return int(a[1])>=int(b[1]); 
  } else {
    return int(b[1])>=int(a[1]);
  }
}