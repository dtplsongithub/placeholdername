// particle handling g

float[] particlex = {}; // x
float[] particley = {}; // y
int[] particlet = {}; // type
int[][] particlesettings = {{10, 20, 15}, {8, 20, 8}}; // x hitbox size, y hitbox size, speed
color[] particlecolor = {color(255, 0, 0), color(255, 255, 0)};
int[][] epartsettings = {{8, 20, 8}};
color[] epartcolor = {color(255, 255, 0)};
int lastshoot = 0;
void shoot(int type, float x, float y, boolean cooldown) {
  if(cooldown) {
    if(t-lastshoot<15) {
      return;
    } else { 
      lastshoot = t;
    }
  }
  particlex = append(particlex, x);
  particley = append(particley, y);
  particlet = append(particlet, type);
}
void updateparticle() {
  for (int i = 0; i<particlex.length; i++){
    int type = particlet[i];
    if (type < 0) {
      println(type + " ig was an epart");
      type = abs(type)-1;
      println(type + " ig was an epart");
      fill(epartcolor[type]);
      rect(particlex[i], particley[i], epartsettings[type][0], epartsettings[type][1]);
      particley[i] += epartsettings[type][2];
      if(particley[i]<-100) {
        particlex = removeByIndex(particlex, i);
        particley = removeByIndex(particley, i);
        particlet = removeByIntIndex(particlet, i);
      }
    } else {
      fill(particlecolor[type]);
      rect(particlex[i], particley[i], particlesettings[type][0], particlesettings[type][1]);
      particley[i] -= particlesettings[type][2];
      if(particley[i]<-100) {
        particlex = removeByIndex(particlex, i);
        particley = removeByIndex(particley, i);
        particlet = removeByIntIndex(particlet, i);
      }
    }
  }
}
void particledestroy(int i){
  particlex = removeByIndex(particlex, i);
  particley = removeByIndex(particley, i);
  particlet = removeByIntIndex(particlet, i);
}
