String input = "";
String[] choice = {};

void kbd() { // keyboard detection for input
  //       minus            ------numbers------             equals           ------alphabet------                     dot          apostrophe         space
  if ((keyCode == 45 || (keyCode >= 48 && keyCode <= 57) || keyCode == 61 || (keyCode >= 65 && keyCode <= 90) || keyCode == 46 || keyCode == 39 || keyCode == 32) && input.length() < 17) {
    input += key;
  }
  //                       vvv !dont delete! vvv
  if (keyCode == BACKSPACE && input.length() > 0) { // or just 8 but eh
    input = input.substring(0, input.length()-1);
  }
}
