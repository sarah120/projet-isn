import ddf.minim.*;  //importation de la librairie "minim" pour mettre du son
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
AudioPlayer player;
Minim minim;
SpriteAnim an;
boolean printbackground;
boolean sonicdead;
boolean sonic;
boolean saut;
int x,y,p=0,ecran, gameScreen=0; //x et y pour faire varier pour utiliser le clavier 
int compteur;
float y0 = 0;
float y0_speed=5; 
  PImage coin,photofunky,logo, sonic4,sonic5,neige,paris,jaguar1,jaguar2,sonicjaguar,gameover,sonicplongeon;
   PFont police;
     int posT=x;
   Sonicmort h1= new Sonicmort();
   Arcenciel h2= new Arcenciel();
   Printbackground h3=new Printbackground();
  GameOver h4= new GameOver();
   SonicAvancer h5= new SonicAvancer();
   Play h7=new Play();
    premierfond h8=new premierfond();
   level3 h9=new level3();
   pacman h10= new pacman();
   jaguar h11=new jaguar();
   pause h12=new pause();
   float x0 = 200; //les coordonnées de départ
//float y0 = 0;

float posX=40; //coordonnés quand il tombe
float posY=200;
/*float gravity=2; //vitesse à laquelle il tombe

int g=0; //compteur
int m=millis();
*/

int xposi; //pour le pacman
int r;
int v;
int d;

    int timed; //pour le code pause
static final int FPS = 60, TIMING = 1*FPS*60 + 60;    //pour le temps à laquelle le game over se déclenchera, car il ne se base pas sur le maxTime
int maxTime =60; //temps maximum, à laquelle le décompte commencera (en seconde)
int currentTime; //temps qui sera afficher
boolean pause = false; //on définit un boolean pause comme étant faux
 PFont police2; //police caractère
 boolean isPaused, isGameOver; //d'autre boolean que l'on définira ensuite
 int timeup = TIMING; 

void setup(){
  size(600,360);   //taille de la fenêtre
  compteur=0;   //initialisation du compteur 
  an=new SpriteAnim("sonic_1.png",6,5); //on charge l'animation sonic, 6,5 est la vitesse des images du sprite
coin=loadImage("coin_1.gif"); //de la ligne 61 a 72 on charge des images 
 photofunky=loadImage("photofunky.gif");
    sonic4= loadImage("sonicmortf4.jpg");
 sonic5= loadImage("sonicplongeon.gif");
   logo=loadImage("logo.jpg");
   neige=loadImage("neige.gif");
   paris=loadImage("paris.gif");
    jaguar1=loadImage("jaguar1-3.png");
  jaguar2= loadImage("jaguar2-3.png");
  sonicjaguar=loadImage("sonicmort2-3.gif");
gameover=loadImage("gameover.jpg");
sonicplongeon=loadImage("sonicplongeon-3.gif");
   posT=25;                          //pour la position de la balle 
    minim = new Minim(this);           //son 
  player = minim.loadFile("musiquesonic.mp3", 2048); //on charge la musique comme une image
  player.play();  //on la déclare pour qu'elle commence
  
  //pour le pacman
    frameRate(60); //image par seconde
  noStroke();
  fill(0);
  xposi=550; //xposi est le x du pacman pour qu'il ne se confonde pas avec la position de sonic
 d=1;
  
  //pour le code pause
 police = loadFont("MVBoli-10.vlw");
    textFont(police, 10);    
    timed = millis();  //transforme le nombre en millisecondes
  
  
}
void draw(){

if (x>600){   //pour initialiser la condition "quand peut on parler d'un nouveau level"? quand x>600, donc quand la fenetre est "finie"
  gameScreen=gameScreen+1;
  x=0; //on redonne à x la valeur 0 pour que Sonic revienne à 0 quand il depasse x=600
}
  if (gameScreen == 0) { //fenetre play
  h7.debut(); //programme pour le play
   } 
   else if (gameScreen == 1) { //premier level 
    background(80);
    h8.jeu1();
       h12.pause();
    if (x==160 && y==220){ 
     
      background(0);
image(gameover,170,0);
   image(sonicplongeon,170,260);
     // background(80);
for (int i = 0; i < 135; i++) {
  fill(i, 128, 128);
  rect(i, 265, 45, 15);
  rect(200,265,150,15);
  rect(360,265,120,15);
  rect(500,265,120,15);
  colorMode(HSB, 100);
}
stop();
if (keyCode==DOWN){
  exit();
}  }
     if (x==330 && y==220){ 
      background(80);
for (int i = 0; i < 135; i++) {
  fill(i, 128, 128);
  rect(i, 265, 45, 15);
  rect(200,265,150,15);
  rect(360,265,120,15);
  rect(500,265,120,15);
  colorMode(HSB, 100);
}
stop();
    image(sonic5,330,260);
    
 }
 if (x==480 && y==220){ 
      background(80);
for (int i = 0; i < 135; i++) {
  fill(i, 128, 128);
  rect(i, 265, 45, 15);
  rect(200,265,150,15);
  rect(360,265,120,15);
  rect(500,265,120,15);
  colorMode(HSB, 100);
}
stop();
    image(sonic5,480,260);
    if (compteur>50){
      h4.fin();
    }
 
 
     if (posT==posY){
        h4.fin();
     }
   }

 if (x==250 && y==220){
   background(80);
for (int i = 0; i < 135; i++) {
  fill(i, 128, 128);
  rect(i, 265, 45, 15);
  rect(200,265,150,15);
  rect(360,265,120,15);
  rect(500,265,120,15);
  colorMode(HSB, 100);
}
//stop();

 }
   }
 
   
  else if (gameScreen==2){ // deuxieme level, chine
  
 background(0);
  image(photofunky,0,0);
    an.anim(x,y);
     h5.avancer();
    h2.an();
     h12.pause();
   
   }
 else if (gameScreen==3){ //troisième level, neige
   
 image(neige,0,0);
 
  an.anim(x,y);
     h5.avancer();
    h2.an();
     h10.attaque();
    h12.pause();
 }
 else if (gameScreen==4){ //quatrième level, Paris
    
   image(paris,0,0);
   an.anim(x,y);
     h5.avancer();
    h2.an();
    h12.pause();
     h11.attaque2(); 
  
 }
 else if(gameScreen==5){
   background(140);
   text("VOUS ETES ARRIVES A PARIS, BRAVO!!",150,150);
 }

 }
void stop(){
  player.close();
  minim.stop();
  super.stop();
}

  class jaguar{
    int j=0;
    int count=0;
    void attaque2(){
      count=count +1;
       j=j+1;
     
      if (j<40){
        stroke(j);
       
        image(jaguar1,250,220);} //changer la position de l'image
       
        else{
          
          image(jaguar2,250,220);
          if(count>100){
            count=0;
      j=0;
          }
        }
        if (x==250 && y==220){
        image(sonicjaguar,250,220);
        image(gameover,170,0);
        noLoop();
        return;
        
        }
  }}


class pacman{
  int compteur=0;
  //float vitesse=2;
  void attaque(){
     compteur=compteur+1;
  arc(xposi,250,30,30,radians(5),radians(320));
   stroke(0,0,0);
   fill(0,0,0);
   ellipse(xposi,238,5,5);
   stroke(255,255,0);
   fill(255,255,0);
        
if (d>0){
xposi=xposi-1;
}
else{
  xposi=xposi+1;
}
if (xposi==40){
  d=1; 
}
if (xposi==590){
  d=0;  
}
if (xposi==x){
  if (looping){ noLoop(); }
     else   {loop(); }
 
  background(0);
  fill(0,0,255);  //cependant desfois sonic ne detecte pas pacman et je ne comprend pas pourquoi
text("VOUS AVEZ ÉTÉ DÉVORÉ PAR PACMAN!!!!!",20,300);
 police = loadFont("MVBoli-10.vlw");
textFont(police,10);
image(gameover,170,0);


}}}





  class level3{
    void level3(){
      background (0);
    }}
  
    
 class premierfond{
   void jeu1(){
 if (x>600){
    x=0;
 }
     compteur=0;
     compteur=compteur+1;
    h2.an();
    //h3.fond();
  noStroke();
  image(coin,200,200);
  image(coin,100,200);
  image(coin,400,200);
  image(coin,500,200);
  an.anim(x,y);    
 h5.avancer();
  
   if (x==600){
     ecran=ecran+1;
   }
  if(ecran == 0) {
    text("START THE GAME!!!", 100, 100);
  }
  if(ecran == 1) {
    text("your on level 1", 20, 50);
  }
  if(ecran == 2) {
    text("Ooh man onto level 2", 20, 50);
  }
  if(ecran == 3) {
    text("YOU HAVE WON!!! Gratz", 20, 50);
}
   }}
       
 class Printbackground{
   void fond(){
  if (printbackground){ //programme pour que le nouveau fond apparaisse
   image(photofunky,0,0);
   image(coin,400,200);
   an.anim(x,y); 
    h2.an();
   }  
  if (x>600){
    x=0;
     printbackground=true;   
  }
  }}
  
class Sonicmort{  //trape piege animation par image
 
    void update(){
      
    if (compteur<100){
      image(sonic4,40,200);
    }
    else {
      image(sonic5,posX,posY);}
    /* g=g+1;
      if (g<40){
        stroke(g);
        //background(0);
        image(sonic4,40,200);} //changer la position de l'image
        //image(sonic1,0,0);}
        else{
          //background(0);
          image(sonic5,posX,posY);
          posY +=gravity;
        }
      if(y==360){
        h4.fin();}
   */
  }}
    
class Arcenciel{
  void an(){
    noStroke();
// La teinte sera spécifiée avec un chiffre de 0 à 400
//colorMode(HSB, 400, 100, 100);

// On fait quatre cent répétitions
for (int i = 0; i < 135; i++) {
  fill(i, 128, 128);
  rect(i, 265, 45, 15);
  rect(200,265,150,15);
  rect(360,265,120,15);
  rect(500,265,120,15);
  colorMode(HSB, 100);
}}}

  
class SonicAvancer{
  void avancer(){
    keyPressed();
  }}

void keyPressed(){//fonction pour faire sauter sonic+avancer
compteur=0;
compteur=compteur+1;
if (keyCode==RIGHT){
      an.anim(x,y);
      x=x+1;
    }
    else{
    x=x-1;
    }
  if (keyCode==LEFT){
an.anim(x,y);
x=x-1;
}else{
 x=x+1;
  }
    if (keyCode==ENTER){
    y=190;
    x=x+1;
 }else{
    y=220;
 }
    final int k = keyCode;
  if (k == 'S')
    if (looping)  noLoop();
    else          an.anim(x,y);
    loop();

}
public void mousePressed() {
        if (gameScreen==0) {
    startGame();
  }
  //pour le code pause
  if (mouseButton==RIGHT){
 pause = !pause;  //quand on clique, le jeu se met en pause, ! est utilisé pour un boolean mais revient à ==
    timed = millis();
       if (looping){ noLoop(); }
     else   {loop(); }
  }
}
  
  
void startGame() {
  gameScreen=1;
}

class SpriteAnim { //suite prg Sonic
  int index; //permet de parcourir le tableau tabIm
  int compt;
  int vit;
  int nbImg;
  PImage img;
  PImage[] tabImg;
  SpriteAnim(String nomImg,int nbImage, int vitAnim){
    index=0;
    compt=0; //permet de changer l'image de Sonic après "10 boucles draw"
    vit=vitAnim;
    nbImg=nbImage;
    img=loadImage(nomImg);
    tabImg=new PImage[nbImage];
    for (int i=0;i<nbImg;i++){
      tabImg[i]=img.get(48*i,0,48,48); //get permet de découper l'image
    }
  }
  void anim(int x, int y){
    if (compt==vit){
      compt=0;
      index=index+1;
      if (index==nbImg){
        index=0;
      }
    }
    compt=compt+1;
    image(tabImg[index],x,y);   
     if (x>600){
       gameScreen=gameScreen+1;
   x=0;}
    
     }}

void nettoyer(){
  background(0);
}
class Play{
  void debut(){
    background(255);
    image(logo,170,60,250,180);
   PFont police;
police = loadFont("MicrosoftPhagsPa-Bold-20.vlw");
textFont(police,20);
   fill(0);
   text("à la découverte du monde parralèle", 125,225);
   fill(250);
   rect(225,250,150,50);
   fill(0);
   text("PLAY", 275,280);
   police = loadFont("MVBoli-10.vlw");
textFont(police,10);
   text("(appuyer sur entrer)",258,290);
   text("utiliser la flèche gauche et droite pour se déplacer, la touche entrée pour sauter",100,320);
   text("et appuyer sur S pour pouvoir mettre le jeu en pause",150,330);
   police=loadFont("MicrosoftPhagsPa-Bold-30.vlw");
   text("N'OUBLIEZ PAS D'ACTIVER VOTRE SON",400,350);
   textFont(police,30);
  }}

class GameOver{
  void fin(){
compteur=compteur+1;
    nettoyer();
    text("GAME OVER",300,300);
    textAlign(CENTER,CENTER);
      text("le jeu va se fermer, veuillez le relancer si vous voulez recommencer",300,150); 
      if(compteur==100){
      exit();}
    
    if (mousePressed==true){
     if (looping){ noLoop(); }
     else   {loop(); }
    }
  }}
  
  class pause{

    void pause(){
  if(!pause){     //! comme un == sauf que c'est pour un boolean
   if(millis() - timed > 1000){ //les millisecondes seront strictement superieur a 1000
   currentTime--; //permet d'avoir le temps à n'importe quel instant
   timed = millis(); 
       }
   }else{
       text("paused", 20, 150); //sinon, on affiche pause 
       }
  if (isPaused | isGameOver) {
    text(isGameOver? "Game Over" : "Game Paused", width>>1, height>>2);
    background(0);
    image(gameover,170,0);
    noLoop();
    return;
  }
    text(nf(currentTime, 2), 20, 20);
    currentTime = currentTime > 0 ?  currentTime:maxTime;
    final int currentTime = (timeup-frameCount)/60 | 0; //changer    framecount=nombre d'image qu'il y a depuis le début 
if (currentTime == 0)  isGameOver = true;
    }}

  
  
  
  
  