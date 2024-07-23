// Projet 1 Processing 1
// NOM         : ZENIA
// Prénom      : Rayane
// Groupe      : C5
// N° étudiant : 223101

///////////////////////////////////
//les variables globales
boolean buton =false;
boolean butonT=false;
boolean butonE=false;
//////////////////////////////////
//pour la tete
int r=50;
int r1=70;
//////////////////////////////////
//pour le ballon
int r2=25;
float x;
float y;
//////////////////////////////////
int score = 0;
//////////////////////////////////
//la vitesse du triangle qui bouge
int v=10;
int yt1;
int yt2;
int yt3;
//////////////////////////////////
//le joueur
int xjoueur;
int yjoueur;
int xpieddroit;
int ypieddroit;
//////////////////////////////////
//les couleurs
int R1=255;
int R2=0;
int G1=0;
int G2=255;
int B1=0;
int B2=0;




void setup() {
  size(800, 800);
  x=width/2;
  y=height/2;
  yt1=height/2-100;
  yt2=height/2-90;
  yt3=height/2-80;
}

void draw() {
  xjoueur=mouseX;
  yjoueur=mouseY;
  xpieddroit= xjoueur+20;
  ypieddroit= yjoueur+200;


  //le stade
  background(58, 157, 35);
  stroke(255);
  strokeWeight(15);
  line(width, 0, width/2, 0);
  line(width, height, width/2, height);
  line(width/2, 0, width/2, height);

  //le point de pinaltie
  fill(255);
  circle(width/2, height/2, 30);

  //le ballon
  strokeWeight(1);
  stroke(0);
  fill(100);
  circle ( x, y, r2);

  //la tete
  strokeWeight(2);
  stroke(0);
  fill(226, 182, 129);
  ellipse(xjoueur, yjoueur, r, r1);

  //le visage
  fill(0);
  ellipse(xjoueur-10, yjoueur-10, 10, 20);
  ellipse(xjoueur+10, yjoueur-10, 10, 20);
  arc(xjoueur, yjoueur+25, 10, 10, 0, PI, CHORD);

  //le corps
  line ( xjoueur, yjoueur+35, xjoueur, yjoueur+80);

  //les bras
  line(xjoueur, yjoueur+70, xjoueur-20, yjoueur+50);
  line(xjoueur, yjoueur+70, xjoueur+20, yjoueur+50);

  //les jambes
  line(xjoueur, yjoueur+80, xjoueur-20, yjoueur+100);
  line(xjoueur, yjoueur+80, xjoueur+20, yjoueur+100);

  //le but
  strokeWeight(5);
  stroke(255);
  line(width, height/2 -50, width-50, height/2 -50 );
  line(width, height/2 +50, width-50, height/2 +50 );

  if (mousePressed   ) {
    buton=true;
  }

  if (buton ) {
    noStroke();
    fill(R1, G1, B1);
    rect(width/2-200, height/2-100, 20, 90);
    fill(R2, G2, B2);
    rect(width/2-200, height/2-10, 20, 20);
    fill(R1, G1, B1);
    rect(width/2-200, height/2+10, 20, 90);
    fill(0);
    triangle(width/2-230, yt1, width/2-200, yt2, width/2-230, yt3);
  }
  //condition pour que le joueur tire : le pied droit sur le ballon
  if (butonT && mouseX<width/2 && mouseX>width/2 -30 && mouseY>height/2 -115 && mouseY+100<height/2 +10 ) {

    yt1 += v;
    yt2 += v;
    yt3 += v;

    if (yt2==height/2+100 || yt2==height/2-100) {
      v = -v;
      v = -v;
      v = -v;
    }
  }

  //le tir
  if (yt2>height/2-10 && yt2<height/2+10 && !butonT) {

    x= x+10;
  }

  //le score qui augmente
  if (x==width) {

    score++;
  }

  if (x>=width) {

    fill(0);
    textSize(16);
    text("GOAL!!!, si vous voulez rejouer :  ", 20, 50 );
    text("-cliquez d'abord sur la souris (le pied droit sur le point de pinaltie)", 20, 70);
    text("-puis sur n'importe quelle touche", 20, 90 );
    textSize(15);
    text("Si vous voulez arreter : cliquez sur la souris (le pied droit sur le p pinaltie) puis ENTER ", 20, 110 );
  }

  //le score
  fill(0);
  textAlign(LEFT);
  textSize(20);
  text("Score " + score, 20, 20);


  //element aleatoire(soleil)
  noStroke();
  fill(237, 255, 0);
  circle(width, 0, 100);

  //fin de la partie
  if (butonE) {

    background(0);
    fill(255);
    textSize(25);
    text("Vous avez marqué " + score + " buts", width/2-150, height/2 );
  }
}


void mousePressed() {

  butonT=!butonT;
}
void keyPressed() {
  x=width/2;
  if ( key==ENTER) {
    butonE=!butonE;
  }
}
