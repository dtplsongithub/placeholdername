// leaderboard rendering

IntDict ldb;
String whoami;

void ldbrender() {
  textFont(msg48);
  text("placeholdername leaderboard", (width-textWidth("placeholdername leaderboard"))/2, height/2+1000-t-1000);
  for (int l = 0; l<min(ldbscoredata.length, 20); l++) {
    int y = l*75+1000-t;
    for (int i = 0; i<16; i++){
      int x = i*35+width/2-16*25;
      text(l+1+".",20, y);
      if(whoami == ldbstrdata[l])
      text(ldbstrdata[l].charAt(i),x+sin(float(t+i*10)/25)*5,y+cos(float(t+i*10)/25)*5);
      else
      text(ldbstrdata[l].charAt(i),x+sin(float(t+i*10+l*100)/25)*1,y+cos(float(t+i*10+l*100)/25)*1);
    }
    if(whoami == ldbstrdata[l])
    text(ldbscoredata[l], 700, y+cos(float(t)/25)*5);
    else
    text(ldbscoredata[l], 700, y);
  }
}
void ldbloaddata(String _whoami) {
  if (_whoami != "") {
    whoami = _whoami;
  } else {
    whoami = null;
  }
  ldbstrdata = expand(ldbstrdata,ceil(ldbdata.length/tablerowsize));
  ldbscoredata = expand(ldbscoredata,ceil(ldbdata.length/tablerowsize));
  for(int i = 0; i<ceil(ldbdata.length/tablerowsize); i++){
    ldbstrdata[i] = "";
    for(int j = 0; j<tablerowsize-4; j++){
      if(i*tablerowsize+j>ldbdata.length-1)break;
      ldbstrdata[i] += char(ldbdata[i*tablerowsize+j]);
    }
    int scoretemp = 0;
    for(int j = 0; j<4; j++){
      scoretemp += ldbdata[i*tablerowsize+j+16]&127; 
      scoretemp <<= 8;
    }
    ldbscoredata[i] = scoretemp;
    ldb.set(ldbstrdata[i]+i, ldbscoredata[i]);
  }
  ldb.sortValues();
  int i = 0;
  for (String k : ldb.keys()) { // oh well
    ldbstrdata[i] = k.substring(0, 16);
    ldbscoredata[i] = ldb.get(k);
    i++;
  }
  ldbstrdata = reverse(ldbstrdata);
  ldbscoredata = reverse(ldbscoredata);
}
