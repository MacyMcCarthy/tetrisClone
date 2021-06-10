import java.util.*;
import processing.sound.*;

SoundFile tetris, gameover, land, levelup, line, move, rotate;
int boxesX = 10; int boxesY = 22;
int mult = 32;
int clock = 1000; //current seconds gap
int timer = 1000; //how long between block falls
int m = 1; //total miliseconds
int score = 0; //score
boolean keyLock1 = false; //locks a and d
boolean keyLock2 = false; //locks s and w
boolean keyLock3 = false; //locks misc keys
int gameMode = 0;
int level = 0;
boolean gameOvered = false;
Random rand;
Grid grid;
Text home1;
Text home2;
Text home3;
Text scorey;
Text scoreNum;
Text game;
Text over;
Text lvl;
Text levelT;

SoundFile song;

void setup(){
  
  song = new SoundFile(this, "Tetris.wav");
  tetris = new SoundFile(this, "samples_tetris.wav");
  gameover = new SoundFile(this, "samples_gameover.wav");
  land = new SoundFile(this, "samples_land.wav");
  levelup = new SoundFile(this, "samples_level.wav");
  line = new SoundFile(this, "samples_line.wav");
  move = new SoundFile(this, "samples_move.wav");
  rotate = new SoundFile(this, "samples_rotate.wav");

  
  size(788, 980);
  home1 = new Text(2, 1, "raven tetris");
  home2 = new Text(2, 7, "choose width");
  home3 = new Text(30, 13, "10");
  game = new Text(2, 1, "game", 32);
  over = new Text(2, 9, "over", 32);
  lvl = new  Text(2, 55, "lvl: ");
  levelT = new  Text(25, 55, "0");
  
  grid = new Grid(1, 1); 
  rand = new Random();
  timer = clock; 
  timer = 1000;
  level = 0;
  
  song.loop();
}

void draw(){
  background(#ffffff);
  if(gameMode == 0){ //startup screen
    grid.drawGrid();
    home1.drawText();
    home2.drawText();
    home3.drawText();
    
    
  }
  
  if(gameMode == 1){ //game playing
    if(grid.controlling == false){ //checks if there is a block in control
      grid.spawnBlock(rand.nextInt(7)); //creates a new block
    }
    if(timerTick()){ //checks if the timer has ticked down
      grid.blockFall(); //makes the block fall
    }
    grid.drawGrid(); //draws the grid
    scorey.drawText();
    
    if(grid.getScore() != score){
      score = grid.getScore();
      scoreNum.setWord(String.valueOf(score));
      
    }
    
    if(level!=grid.getLevel()){
      level = grid.getLevel();
      levelT.setWord(String.valueOf(level));
    }
    
    scoreNum.drawText();
    lvl.drawText();
    levelT.drawText();
    if(grid.checkGameOver())gameMode =2;
    
  }
  
  if(gameMode == 2){ //game over
    song.stop();
    
    if(gameOvered == false){gameover.play(); gameOvered =true;}
    grid.drawGrid();
    scorey.drawText();
    scoreNum.drawText();
    game.drawText();
    over.drawText();
  }
  
  
  
  
  
  
}

public boolean timerTick(){ //checks if the timer hit zero
  /*
  int clock = 1000; //current seconds gap
  int timer = 1000; //how long between block falls
  int m; //total miliseconds
  int score; //score
  int timePasssed;
  */
  
  
  //println(clock);
  clock -= millis()%m;
  m = millis();
  if(clock <= 0){ 
    //println("ping");
    clock = timer;
    return true;
  }
  else{return false;}
}



public void keyPressed(){ //checks if a key is pressed and calls its function
  if(gameMode == 1 && grid.getControlling() == true){
    switch(key){
      case 'a': //move left
        if(keyLock1 == false){
          grid.blockLeft();
          keyLock1 = true;
        }
        break;
         
      case 'd': //move right
        if(keyLock1 == false){
          grid.blockRight();
          keyLock1 = true;
        }
        break;
         
      case 's': //move down
        if(keyLock2 == false){
          grid.blockFall();
          keyLock2 = true;
        }
        break;
         
      case 'w': //snap move
        if(keyLock2 == false){
          grid.snap();
          keyLock2 = true;
        }
        break; 
        
      case 'e': //rotate clockwise
        if(keyLock3 == false){
          grid.cro();
          keyLock3 = true;
        }
        break;
      
      case 'q': //rotate counterclockwise
      if(keyLock3 == false){
        grid.ccro();
        keyLock3 = true;
      }
        break;
      
      case 'l': 
        if(keyLock3 == false){
          song.stop();
          setup(); 
          keyLock3 = true;
        }
          break;
      
      case 'p': 
      if(keyLock3 == false){
        println(grid);
        keyLock3 = true;
      }
      
      
      
    }
    
  }
  
  if(gameMode == 0){
    switch(key){
     case ENTER:
        if(gameMode == 0){
         gameMode = 1; 
         scorey = new Text(2, 49, "score:");
         scoreNum = new Text(25, 49, "0");
        } break;
     case RETURN: 
       if(gameMode == 0){
         gameMode = 1; 
        } break;
        
     case 'w': 
       if(boxesX <20){
         boxesX++;
         home3.setWord(String.valueOf(boxesX)); 
         grid.changeWidth(1);
       }
       
       break;
     
     case 's':
       if(boxesX>8){
         boxesX--; 
         home3.setWord(String.valueOf(boxesX));
         grid.changeWidth(-1);
       } 
       break;
     
    }
    
  
        
         
  
    
  }
  
    
}

void keyReleased(){ //makes sure the key is released before letting the player click another
  switch(key){
   case 'a': 
     keyLock1 = false;
     break;
   case 'd':
     keyLock1 = false;
     break;
   case 'w':
     keyLock2 = false;
     break;
   case 's':
     keyLock2 = false;
     break;
   case 'e':
     keyLock3 = false;
     break;
   case 'q':
     keyLock3 = false;
     break;
   case 'l':
     keyLock3 = false;
     break;
   case 'p':
     keyLock3 = false;
     break;
  }
}
