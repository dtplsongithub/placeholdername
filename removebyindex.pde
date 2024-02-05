/*
some code i stole off of stack overflow
*/

float[] removeByIndex(float[] array, int index) {
  int index2 = array.length-1;
  float old = array[index];
  array[index] = array[index2];
  array[index2] = old;
  array = shorten(array);
  return array;
}

int[] removeByIntIndex(int[] array, int index) { // yeh
  int index2 = array.length-1;
  int old = array[index];
  array[index] = array[index2];
  array[index2] = old;
  array = shorten(array);
  return array;
}

String[] removeByStringIndex(String[] array, int index) { // YEH
  int index2 = array.length-1;
  String old = array[index];
  array[index] = array[index2];
  array[index2] = old;
  array = shorten(array);
  return array;
}
