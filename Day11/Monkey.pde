class Monkey {
  IntList Items;
  char Operation;
  int OperationValue;
  int TestValue;
  Monkey TrueMonkey, FalseMonkey;
  
  int InspectionCounter = 0;
  
  Monkey() {
    Items = new IntList();
    //set initial values
    
    //set operation
    
    //set test val
    
    //set target ints/monkeys
  }
  
  void Catch(int item) {
    Items.append(item);
  }
  
  void Turn() {
    for(int item: Items) {
      item = Inspect(item);
      ThrowTo(item).Catch(item);
    }
    Items = new IntList();
  }
  
  int Inspect(int val) {
    InspectionCounter++;
    
    switch(Operation) {
      case '*':
        val *= OperationValue;
        break;
      case '+':
        val += OperationValue;
        break;
      case '^':
        println("Square op");
        println("source",val);
        val = val * val;
        println("result",val);
        break;
      default: throw new RuntimeException("Unknown operation: "+Operation);
    }
    
    return floor(val/3);
  }
  
  Monkey ThrowTo(int val) {
    return Test(val)
      ? TrueMonkey
      : FalseMonkey;
  }
  
  boolean Test(int i) {
    return i%TestValue == 0;
  }
}