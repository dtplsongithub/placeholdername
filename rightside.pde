int score = 0;
void rightside(float xoff){
  textFont(msg20);
  strokeWeight(4);
  stroke(255);
  fill(0, 0, 50);
  rect(width-225+xoff, 3, 256, 42, 6);
  fill(255);
  textSize(32);
  text(nf(score, 10), width-215+xoff, 38);
  textSize(20);
  
  // displaying messages
  textFont(msg14);
  strokeWeight(4);
  textSize(14);
  for (int i = 0; i<message.length; i++){
    fill(messagecolor[i]);
    rect(width-214, 56+29*i+max(0, 29+lastmsgdel*2-t*2)+xoff, 203-12-textWidth(str(messagescore[i])), 24, 6);
    rect(width-17-textWidth(str(messagescore[i])), 56+29*i+max(0, 29+lastmsgdel*2-t*2)+xoff, 6+textWidth(str(messagescore[i])), 24, 6);
    fill(255);
    text(message[i], width-210+xoff, 76+29*i+max(0, 29+lastmsgdel*2-t*2));
    text(messagescore[i], width-textWidth(str(messagescore[i]))-15+xoff, 76+29*i+max(0, 29+lastmsgdel*2-t*2));
    messagetime[i]--;
    if(messagetime[i]<0){
      message = removeByStringIndex(message, i);
      messagetime = removeByIntIndex(messagetime, i);
      messagecolor = removeByIntIndex(messagecolor, i);
      messagescore = removeByIntIndex(messagescore, i);
      lastmsgdel = t;
    }
  }
  textSize(20);
  textFont(msg20);
  noStroke();
}
String[] message = {};
int[] messagetime = {};
color[] messagecolor = {};
int[] messagescore = {};
int lastmsgdel = 0;
void addmessage(String msg, int lfspan, color col, int addscore){
  message = append(message, msg);
  messagetime = append(messagetime, lfspan);
  messagecolor = append(messagecolor, col);
  score += addscore;
  messagescore = append(messagescore, addscore);
}
