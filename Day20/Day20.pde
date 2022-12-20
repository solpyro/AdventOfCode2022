String file = "test.txt";
//String file = "data.txt";

int[] values, orders;

void setup() {
  parse();
  
  mix();
  
  part1();
}

void parse() {
  values = int(loadStrings(file));
  orders = new int[values.length];
  for(int i=0;i<values.length;i++)
    orders[i] = i;
}



void part1() {
  int zero = findIndex(0, values);
  int onek = (1000+zero)%values.length;
  int twok = (2000+zero)%values.length;
  int threek = (3000+zero)%values.length;
  
  println(onek,twok,threek);
  println("The sum of coordinates (",values[onek],values[twok],values[threek],") is",values[onek]+values[twok]+values[threek]);
}