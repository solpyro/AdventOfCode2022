void mix() {
  for (int i=0; i<values.length; i++) {
    int index = findIndex(i, orders);
    int value = values[index];
    int target = findTarget(index+value, values.length);
    
    orders = pop(orders,index);
    orders = splice(orders,i,target);
    
    values = pop(values,index);
    values = splice(values,value,target);
  }
}

int findIndex(int value, int[] array) {
  int index = -1;

  for (index = 0; index<array.length; index++)
    if (array[index] == value)
      break;

  return index;
}

int findTarget(int value, int range) {
  value = value%(range-1);

  if (value<=0)
    value += range-1;

  return value;
}

int[] pop(int[] array, int index) {
  return concat(subset(array,0,index),subset(array,index+1));
}

void println(int[] array) {
  println("["+join(str(array),", ")+"]");
}