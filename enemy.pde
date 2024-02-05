int waveno = 1;
String wavename;
int[][] enemytype = new int[4][8];
float[] enemyxoff = new float[40];
float[] enemyyoff = new float[40];
float[] enemyv = new float[40];
int[] enemyclock = new int[40];
int[] enemystate = new int[40]; // 0: wandering, 1: hit, 2: angy >:((( (will attack more)
int[] enemyhp = new int[40];
void loadwave(int which) {
  t = 0;
  String[] wavetemp = loadStrings(which+".dpw");
  wavename = wavetemp[0];
  for(int y = 1; y<5; y++){
    for(int x = 0; x<8; x++){
      int i = y*8+x;
      int th = int(wavetemp[y].charAt(x))-48;
      enemytype[y-1][x] = th;
      enemyhp[i-8] = round(th/2)+3;
    }
  }
}
void enemy() {
  for(int y = 0; y<4; y++){
    for(int x = 0; x<8; x++){
      int i = y*8+x;
      if(enemyhp[i]<1)continue;
      switch(enemytype[y][x]){
        case 0:
          fill(255, 0, 0);
          break;
        case 1:
          fill(255, 127, 0);
          break;
        case 2:
          fill(255, 255, 0);
          break;
        case 3:
          fill(0, 255, 0);
          break;
        case 4:
          fill(0, 255, 255);
          break;
        case 5:
          fill(0, 127, 255);
          break;
        default:
          fill(77);
      }
      enemyyoff[i]=map2(min(max(t-i*45-100, 0), 90), 0, 90, -600, 0, QUINTIC, EASE_OUT);
      float finalx = x*100+100+enemyxoff[i]+(sin(float(t)/30)*sin(enemyv[i])*5);
      float finaly = y*90+40+enemyyoff[i]+(sin(float(t)/30)*cos(enemyv[i])*5);
      enemyclock[i]--;
      if(enemyclock[i]<0&&abs(sin(float(t)/30))<0.1){
        enemyclock[i] = int(random(10, 100));
        enemyv[i] = random(0, TAU);
        shoot(-1, finalx, finaly, false);// negative particles means its from an enemy and should be treated differently
      }
      //text(enemyyoff[i] + "  " + finaly, 100, 30+i*30);
      rect(finalx, finaly, 70, 70);
      if (-599<enemyyoff[i]) {
        //text("has checked", 400, 30+i*30);
        for(int ip = 0; ip<particlex.length; ip++){
          if(particlet[ip]<0)continue;
          if(rectRect(finalx, finaly, 70, 70, particlex[ip], particley[ip], particlesettings[particlet[ip]][0], particlesettings[particlet[ip]][1])){
            enemyhp[i]--;
            particledestroy(ip);
            if(enemyhp[i]<1){
              score+=100+enemytype[y][x]*50;
              if(-80>enemyyoff[i]){
                score+=100;
                addmessage("early kill", 300, #5AB7B8, 100);
              }
              break;
            }
          }
        }
      }
    }
  }
}// mm yes } cascade

void emd() {
  enemyclock[0]--;
  switch (menuselect){ // aka enemystate ingame
    case 0: {
      if(enemyclock[0]<0&&abs(sin(float(t)/30))<0.1){
        enemyclock[0] = int(random(10, 100));
        enemyv[0] = random(0, TAU);
      }
      text(mouseX/( width/TAU), 300, 600);
      rect(sin(float(t)/30)*sin(enemyv[0])*5+300, sin(float(t)/30)*cos(enemyv[0])*5+300, 70, 70);
      break;
    }
  }
}
