int max=5;
int[] xpos=new int[max]; 
int[] ypos=new int[max];
int[] velx=new int[max];
int[] vely=new int[max];
int[] r=new int[max]; 
int[] g=new int[max]; 
int[] b=new int[max];
int[] mostrar=new int[max];
int correctos=0;
int puntos=0;
int intentos=6;
int mostrarn=1;
int vel;
int niv=1;
int mostn=0;
void setup() {
  size(800, 800);
  //fullScreen();
  if(width>800){
    vel=25;
  }else{
    vel=9;
  }
  for (int i=0; i<max; i++) {
    int x=int (random(26, width-26));
    int y=int (random(26, height-26));
    r[i]=int(random(20, 235));
    g[i]=int(random(20, 235));
    b[i]=int(random(20, 235));
    xpos[i]=x;
    ypos[i]=y;
    velx[i]=0;
    while (velx[i]==0) {
      velx[i]=int(random(-vel, vel));
    }
    vely[i]=0;
    while (vely[i]==0) {
      vely[i]=int(random(-vel, vel));
    }
    mostrar[i]=1;
  }
}
void draw() {
  fondo();
  meteoro();
  nave();
  puntaje();
  parar();
  reinicio();
  nivel();
}
void nivel() {
  if(mostn<50){
    fill(255);
    textSize(100);
    textAlign(CENTER);
    text("Nivel", width/2, height/2);
    text(niv, width/2, height/2+100);
  }
  mostn+=1;
}
void reinicio() {
  if (mostrarn==1) {
    if (correctos==max) {
      niv+=1;
      mostn=0;
      max+=5;
      vel+=2;
      xpos=new int[max]; 
      ypos=new int[max];
      velx=new int[max];
      vely=new int[max];
      r=new int[max]; 
      g=new int[max]; 
      b=new int[max];
      mostrar=new int[max];
      for (int i=0; i<max; i++) {
        int x=int (random(26, width-26));
        int y=int (random(26, height-26));
        r[i]=int(random(20, 235));
        g[i]=int(random(20, 235));
        b[i]=int(random(20, 235));
        xpos[i]=x;
        ypos[i]=y;
        velx[i]=0;
        while (velx[i]==0) {
          velx[i]=int(random(-vel, vel));
        }
        vely[i]=0;
        while (vely[i]==0) {
          vely[i]=int(random(-vel, vel));
        }
        mostrar[i]=1;
      }
      correctos=0;
      if (intentos<6) {
        intentos=6;
      }
    }
  }
}
void parar() {
  if (intentos<=0) {
    for (int i=0; i<max; i++) {
      mostrar[i]=0;
    }
    mostrarn=0;
    if (puntos>0) {
      fill(255);
      textSize(100);
      textAlign(CENTER);
      text("GANASTE", width/2, height/2-100);
      textSize(50);
      text("Puntaje final:", width/2, height/2);
      text(puntos, width/2, height/2+100);
      textSize(40);
      text("Iniciar", width/2, height/2+200);
    } else {
      textSize(100);
      textAlign(CENTER);
      text("PERDISTE", width/2, height/2);
      textSize(40);
      text("Iniciar", width/2, height/2+200);
    }
  }
}
void puntaje() {
  if (mostrarn==1) {
    noStroke();
    fill(255);
    textSize(20);
    textAlign(LEFT);
    text("Puntaje:", 25, 25);
    textAlign(RIGHT);
    text(puntos, 160, 25);
    textAlign(CENTER);
    text("Intentos faltantes:", 270, 25);
    textAlign(RIGHT);
    text(intentos, 400, 25);
  }
}
void nave() {
  if (mostrarn==1) {
    noCursor();
    fill(98, 98, 98);
    rectMode(CENTER);
    stroke(0);
    fill(234, 234, 234);
    triangle(mouseX-30, mouseY+5, mouseX, mouseY-20, mouseX, mouseY);
    triangle(mouseX+30, mouseY+5, mouseX, mouseY-20, mouseX, mouseY);
    triangle(mouseX-20, mouseY+25, mouseX, mouseY+20, mouseX, mouseY+8);
    triangle(mouseX+20, mouseY+25, mouseX, mouseY+20, mouseX, mouseY+8);
    fill(255, 255, 255);
    noStroke();
    rect(mouseX, mouseY, 16, 40, 0, 0, 3, 3);
    rect(mouseX, mouseY-20, 16, 20, 20, 100, 0, 0);
    fill(0);
    rect(mouseX-3, mouseY, 4, 30, 2, 2, 2, 2);
    rect(mouseX+3, mouseY, 4, 30, 2, 2, 2, 2);
    rect(mouseX, mouseY-22, 8, 6, 2, 2, 2, 2);
  } else {
    cursor(0);
  }
}
void fondo() {
 background(0);
}
void meteoro() {
  for (int i=0; i<max; i++) {
    if (mostrar[i]==1) {
      fill(r[i], g[i], b[i]);
      noStroke();
      ellipse(xpos[i], ypos[i], 50, 50);
      fill(r[i]-20, g[i]-20, b[i]-20);
      ellipse(xpos[i]-2, ypos[i]-2, 10, 10);
      fill(r[i]-20, g[i]-20, b[i]-20);
      ellipse(xpos[i]+5, ypos[i]+15, 15, 15);
      fill(r[i]-20, g[i]-20, b[i]-20);
      ellipse(xpos[i]+12, ypos[i]-15, 6, 10);
      fill(r[i]+20, g[i]+20, b[i]+20);
      ellipse(xpos[i]+17, ypos[i], 13, 10);
      fill(r[i]+20, g[i]+20, b[i]+20);
      ellipse(xpos[i]-17, ypos[i]+5, 11, 13);
      fill(r[i]+20, g[i]+20, b[i]+20);
      ellipse(xpos[i], ypos[i]-17, 9, 9);
      fill(r[i]+20, g[i]+20, b[i]+20);
      ellipse(xpos[i]-15, ypos[i]-12, 7, 7);
      xpos[i]+=velx[i];
      ypos[i]+=vely[i];
      if (xpos[i]>=width-25) {
        velx[i] *= -1;
      }
      if (xpos[i]<=25) {
        velx[i] *= -1;
      }
      if (ypos[i]>=height-25) {
        vely[i] *= -1;
      }
      if (ypos[i]<=25) {
        vely[i] *= -1;
      }
    }
  }
}
void mousePressed() {
  if (mostrarn==1) {
    for (int i=0; i<max; i++) {
      if (dist(xpos[i], ypos[i], mouseX, mouseY)<(50)) {
        mostrar[i]=0;
        puntos+=10;
        intentos+=1;
        xpos[i]=width+26;
        ypos[i]=height+26;
      }
    }
  } else {
    if (mouseX>344 && mouseX<460 && mouseY>570 && mouseY<600) {
      max=5;
      xpos=new int[max]; 
      ypos=new int[max];
      velx=new int[max];
      vely=new int[max];
      r=new int[max]; 
      g=new int[max]; 
      b=new int[max];
      mostrar=new int[max];
      correctos=0;
      puntos=0;
      intentos=7;
      mostrarn=1;
      if(width>800){
        vel=25;
      }else{
        vel=9;
      }
      niv=1;
      mostn=0;
      for (int i=0; i<max; i++) {
        int x=int (random(26, width-26));
        int y=int (random(26, height-26));
        r[i]=int(random(20, 235));
        g[i]=int(random(20, 235));
        b[i]=int(random(20, 235));
        xpos[i]=x;
        ypos[i]=y;
        velx[i]=0;
        while (velx[i]==0) {
          velx[i]=int(random(-vel, vel));
        }
        vely[i]=0;
        while (vely[i]==0) {
          vely[i]=int(random(-vel, vel));
        }
        mostrar[i]=1;
      }
    }
  }
  intentos-=1;
  println(mouseX, mouseY);
}
