void parse() {
  String[] input = loadStrings(file);
  
  troop = new Monkey[(input.length+1)/7];
  
  for(int i=0; i<troop.length; i++)
    troop[i] = new Monkey();
    
  for(int i=0; i<troop.length; i++) {
    parseMonkey(troop[i],subset(input, 7*i,6));
    
    println("----- Parse Monkey",i,"-----");
    println("Monkey:",troop[i]);
    println("Items:",troop[i].Items);
    println("Operation:",troop[i].Operation,troop[i].OperationValue);
    println("Test: /",troop[i].TestValue);
    println("True Monkey",troop[i].TrueMonkey);
    println("False Monkey",troop[i].FalseMonkey);
  }
}

void parseMonkey(Monkey monkey, String[] lines) {
  setItems(monkey,lines[1]);
  setOperation(monkey,lines[2]);
  setTest(monkey,lines[3]);
  setTrueMonkey(monkey,lines[4]);
  setFalseMonkey(monkey,lines[5]);
}

void setItems(Monkey monkey, String itemsLine) {
  int[] items = int(splitTokens(split(itemsLine,": ")[1],", "));
  monkey.Items.append(items);
}

void setOperation(Monkey monkey, String operationLine) {
  if(operationLine.indexOf("old * old") > -1) {
    monkey.Operation = '^';
  } else {
    if(operationLine.indexOf('*') > -1) {
      monkey.Operation = '*';
    }
    if(operationLine.indexOf('+') > -1) {
      monkey.Operation = '+';
    }
    monkey.OperationValue = getNumberFromEndOfString(operationLine);
  }
}

void setTest(Monkey monkey, String testLine) {
  monkey.TestValue = getNumberFromEndOfString(testLine);
}

void setTrueMonkey(Monkey monkey, String trueMonkeyLine) {
  int target = getNumberFromEndOfString(trueMonkeyLine);
  monkey.TrueMonkey = troop[target];
}

void setFalseMonkey(Monkey monkey, String falseMonkeyLine) {
  int target = getNumberFromEndOfString(falseMonkeyLine);
  monkey.FalseMonkey = troop[target];
}

int getNumberFromEndOfString(String line) {
  String[] tokens = splitTokens(line);
  return int(tokens[tokens.length-1]);
}