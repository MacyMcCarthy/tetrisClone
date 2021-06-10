import java.util.Arrays;
import processing.sound.*;

class Grid{
  PImage wallbox, backbox, ibox, jbox, lbox, obox, sbox, tbox, zbox, blankBox;
  
  int w; int h; int rot = 0; int numnum = 0; int level = 0;
  String[][] grid; // in order of y x
  boolean controlling = false;
  int[] corner; // in order of x y
  int[] bCorner; // in order of x y
  int[] shapeDim; // x y
  iBox iboxy;
  jBox jboxy;
  lBox lboxy;
  oBox oboxy;
  sBox sboxy;
  tBox tboxy;
  zBox zboxy;
  String[][] shape; // in order of y x
  String shapeType;
  int score = 0;
  boolean go = false;
  int allLinesCleared = 0;
  int overStart; int upStart;
  boolean landed;
  
  Grid(int oS, int uS){
    overStart = oS; upStart = uS;
    wallbox = loadImage("wallbox.png"); // loads the image
    backbox = loadImage("backgroundbox.png");
    ibox = loadImage("ibox.png");
    jbox = loadImage("jbox.png");
    lbox = loadImage("lbox.png");
    obox = loadImage("obox.png");
    sbox = loadImage("sbox.png");
    tbox = loadImage("tbox.png");
    zbox = loadImage("zbox.png");
    blankBox = loadImage("blankbox.png");
    
    iboxy = new iBox(); //instantiates the different boxes
    jboxy = new jBox();
    lboxy = new lBox();
    oboxy = new oBox();
    sboxy = new sBox();
    tboxy = new tBox();
    zboxy = new zBox();
    
    
    
    
    prepareGrid(overStart, upStart);
       
  }
  
  
  public void drawGrid(){ //draws the grid with a for loop
    for(int i = 0; i < h; i++){ //rows
      for(int ii = 0; ii < w; ii++) //stuff in rows
      {  
        image(getImage(grid[i][ii]), ii*mult+corner[0], i*mult+corner[1]);
      }
    }
  }
  
  
  
  public void spawnBlock(int num){ //spawns in a new block and sets the necessary data
    rot = 0;
    bCorner = new int[]{w/2-2, 0};
    numnum = num;
    String[][] newShape = getFormation(num);
    shape = newShape;
    shapeDim = getDim(num);
    controlling = true;
    for(int i = 0; i < shapeDim[1]; i++){ //loops to create shape
      for(int ii = 0; ii < shapeDim[0]; ii++){
        if(shape[i][ii].equals(shapeType) && grid[bCorner[1]+i][bCorner[0]+ii].equals("*")){
          grid[bCorner[1]+i] [bCorner[0]+ii] = shape[i][ii];
        }
        else if(shape[i][ii].equals(shapeType)){
          go = true;
        }
        
      }
    }
    
  }
  
  
  public boolean checkGameOver(){
    return go;
  }
  
  
  public void setShape(String[][] newShape){ //replaces the unrotated shape with the rotated one
    int midX = bCorner[0] + shapeDim[0]/2;
    int midY = bCorner[1] + shapeDim[1]/2;
    int[] newSDim = {newShape[0].length, newShape.length};
    int[] newBCor = {midX-newSDim[0]/2, midY-newSDim[1]/2};
    
    for(int i = 0; i < shapeDim[1]; i++){
        for(int ii = 0; ii < shapeDim[0]; ii++){
          if(grid[bCorner[1]+i][bCorner[0]+ii] == shapeType){
            grid[bCorner[1]+i][bCorner[0]+ii] = "*";
          }
        }
    }

    if(newBCor[1] <0)newBCor[1] = 0;
    boolean canRotate = true;
    for(int i = 0; i < newSDim[1]; i++){
      
      for(int ii = 0; ii < newSDim[0]; ii++){
        if(//newBCor[1] < 0 ||
          ((grid[newBCor[1]+i] [newBCor[0]+ii].equals(newShape[i][ii]) == false) &&
          (grid[newBCor[1]+i] [newBCor[0]+ii].equals("*"))==false)){
          canRotate = false;
          
        }
        
      }
    }
    if(canRotate){
      bCorner = newBCor;
      shape = newShape;
      shapeDim = newSDim;
      rotate.play();
    }
      
      
      
      for(int i = 0; i < shapeDim[1]; i++){
        for(int ii = 0; ii < shapeDim[0]; ii++){
          grid[bCorner[1]+i] [bCorner[0]+ii] = shape[i][ii];
        }
      }

  }
  
  
  
  public void cro(){//clockwise rotation
    rot += 90;
    if(rot == 360){rot = 0;}
    String[][] newShape;
    switch(numnum){
      case 0: shapeType = iboxy.getType(); newShape = iboxy.getRotation(rot); break;
      case 1: shapeType = jboxy.getType(); newShape = jboxy.getRotation(rot); break;
      case 2: shapeType = lboxy.getType(); newShape = lboxy.getRotation(rot); break;
      case 3: shapeType = oboxy.getType(); newShape = oboxy.getRotation(rot); break;
      case 4: shapeType = sboxy.getType(); newShape = sboxy.getRotation(rot); break;
      case 5: shapeType = tboxy.getType(); newShape = tboxy.getRotation(rot); break;
      default: shapeType = zboxy.getType(); newShape = zboxy.getRotation(rot); break;
      
    }
    setShape(newShape);
    
        
     
  }
  
  public void ccro(){ //counterclockwise rotation
    rot -= 90;
    if(rot == -90){rot = 270;}
    String[][] newShape;
    switch(numnum){
      case 0: shapeType = iboxy.getType(); newShape = iboxy.getRotation(rot); break;
      case 1: shapeType = jboxy.getType(); newShape = jboxy.getRotation(rot); break;
      case 2: shapeType = lboxy.getType(); newShape = lboxy.getRotation(rot); break;
      case 3: shapeType = oboxy.getType(); newShape = oboxy.getRotation(rot); break;
      case 4: shapeType = sboxy.getType(); newShape = sboxy.getRotation(rot); break;
      case 5: shapeType = tboxy.getType(); newShape = tboxy.getRotation(rot); break;
      default: shapeType = zboxy.getType(); newShape = zboxy.getRotation(rot); break;
      }
    setShape(newShape);
  }
  
  
  /*MOVER METHODS MOVE BLOCKS
  All mover methods work the same, just in different directions
  They check each tile that makes up the shape, then checks if the space in the
  right direction of shape blocks is clear, and moves it if it is
  
  */
  public void snap(){ //moves the block to the bottom immediately
    boolean canMove = true;
    while(canMove){
     for(int i = 0; i < shapeDim[1]; i++){
        for(int ii = 0; ii < shapeDim[0]; ii++){
          if((bCorner[1]+shapeDim[1]+1 >= h)){
             canMove = false;
           }
          
           if(grid[bCorner[1]+i] [bCorner[0]+ii].equals(shapeType) == true)
          {
            boolean empty = grid[bCorner[1]+i+1] [bCorner[0]+ii].equals("*") ;
            boolean dupe =  grid[bCorner[1]+i+1] [bCorner[0]+ii].equals(shapeType);
            if(empty == false && dupe == false){
              canMove = false;
            }  
          }
        }
     }
     
     if(canMove){
     for(int i = 0; i < shapeDim[1]; i++){
      for(int ii = 0; ii < shapeDim[0]; ii++){ // x coord
        if(grid[bCorner[1]+i] [bCorner[0]+ii].equals(shapeType))
        {
          grid[bCorner[1]+i] [bCorner[0]+ii] = "*";
        }
      }
     }
     
     bCorner[1]++;
     
     for(int i = 0; i < shapeDim[1]; i++){
        for(int ii = 0; ii < shapeDim[0]; ii++){ // x coord{
          if((bCorner[1]+i+1 < h)&& shape[i][ii].equals(shapeType)){
            grid[bCorner[1]+i] [bCorner[0]+ii] = shapeType;
          }
        }
      }
     
   }
   else{
     blockSolid();
   }

    }
  }  
  
  
  
  public void blockRight(){ //moves block right
    
    boolean canMove = true;
     for(int i = 0; i < shapeDim[1]; i++){
        for(int ii = 0; ii < shapeDim[0]; ii++){
          if((bCorner[0]+shapeDim[0]+1 >= w)){
             canMove = false;
           }
          
           if(grid[bCorner[1]+i] [bCorner[0]+ii].equals(shapeType) == true)
          {
            boolean empty = grid[bCorner[1]+i] [bCorner[0]+ii+1].equals("*") ;
            boolean dupe =  grid[bCorner[1]+i] [bCorner[0]+ii+1].equals(shapeType);
            if(empty == false && dupe == false){
              canMove = false;
            }  
          }
        }
     }
     
     if(canMove){ move.play();
       clock = timer;
       for(int i = 0; i < shapeDim[1]; i++){
        for(int ii = 0; ii < shapeDim[0]; ii++){ // x coord
          if(grid[bCorner[1]+i] [bCorner[0]+ii].equals(shapeType))
          {
            grid[bCorner[1]+i] [bCorner[0]+ii] = "*";
          }
        }
       }
       
       bCorner[0]++;
       
       for(int i = 0; i < shapeDim[1]; i++){
          for(int ii = 0; ii < shapeDim[0]; ii++){ // x coord{
            if((bCorner[1]+i+1 < h)&& shape[i][ii].equals(shapeType)){
              grid[bCorner[1]+i] [bCorner[0]+ii] = shapeType;
            }
          }
        }
       
     }
     
  }
  
  
  
  public void blockLeft(){ //moves left
    boolean canMove = true;
     for(int i = 0; i < shapeDim[1]; i++){
        for(int ii = 0; ii < shapeDim[0]; ii++){
          
           if(grid[bCorner[1]+i] [bCorner[0]+ii].equals(shapeType) == true)
          {
            
            boolean empty = grid[bCorner[1]+i] [bCorner[0]+ii-1].equals("*") ;
            boolean dupe =  grid[bCorner[1]+i] [bCorner[0]+ii-1].equals(shapeType);
            if(empty == false && dupe == false){
              canMove = false;
            }  
          }
        }
     }
     
     if(canMove){ move.play();
       clock = timer;
       for(int i = 0; i < shapeDim[1]; i++){
        for(int ii = shapeDim[0]; ii >= 0; ii--){ // x coord
          if(grid[bCorner[1]+i] [bCorner[0]+ii].equals(shapeType))
          {
            grid[bCorner[1]+i] [bCorner[0]+ii] = "*";
          }
        }
       }
     
       bCorner[0]--;
       
       for(int i = 0; i < shapeDim[1]; i++){
          for(int ii = 0; ii < shapeDim[0]; ii++){ // x coord{
            if((bCorner[1]+i+1 < h)&& shape[i][ii].equals(shapeType)){
              grid[bCorner[1]+i] [bCorner[0]+ii] = shapeType;
            }
          }
        }
     
     }
     
  }
  
  
  
  public void blockFall(){ //moves down
   boolean canMove = true;
   for(int i = 0; i < shapeDim[1]; i++){
      for(int ii = 0; ii < shapeDim[0]; ii++){
        if((bCorner[1]+shapeDim[1]+1 >= h)){
           canMove = false;
         }
        
         if(grid[bCorner[1]+i] [bCorner[0]+ii].equals(shapeType) == true)
        {
          boolean empty = grid[bCorner[1]+i+1] [bCorner[0]+ii].equals("*") ;
          boolean dupe =  grid[bCorner[1]+i+1] [bCorner[0]+ii].equals(shapeType);
          if(empty == false && dupe == false){
            canMove = false;
          }  
        }
      }
   }
   
   if(canMove){ move.play();
     clock = timer;
     for(int i = 0; i < shapeDim[1]; i++){
      for(int ii = 0; ii < shapeDim[0]; ii++){ // x coord
        if(grid[bCorner[1]+i] [bCorner[0]+ii].equals(shapeType))
        {
          grid[bCorner[1]+i] [bCorner[0]+ii] = "*";
        }
      }
     }
     
     bCorner[1]++;
     
     for(int i = 0; i < shapeDim[1]; i++){
        for(int ii = 0; ii < shapeDim[0]; ii++){ // x coord{
          if((bCorner[1]+i+1 < h)&& shape[i][ii].equals(shapeType)){
            grid[bCorner[1]+i] [bCorner[0]+ii] = shapeType;
          }
        }
      }
     
   }
   else{
     blockSolid();
     
   }
 }
   
   
  public void blockSolid(){ //makes a block solid so it wont move anymore
    for(int i = 0; i < shapeDim[1]; i++){
        for(int ii = 0; ii < shapeDim[0]; ii++){ // x coord
          grid[bCorner[1] + i] [bCorner[0] +ii] = grid[bCorner[1] + i] [bCorner[0] +ii].toUpperCase();
        }
    }
    controlling = false;
    checkLines();
    if(landed == false){land.play();}
  }
  
  
  void checkLines(){ //checks if a line is clear
    int linescleared = 0;
    boolean rowFinished = true;
    for(int i = 0; i < h-1; i++){ //i = row number, top to bottom
      String row = "";
      rowFinished = true;
      for(int ii = 1; ii<w-1; ii++){
        if(grid[i][ii].equals("*")){
          rowFinished= false;
   
        }     
        
      }
      if(rowFinished){
        linescleared++;
        allLinesCleared++;

        if(linescleared < 4){line.play();}
        else{line.play();}
        landed = true;
          for(int ii = i; ii>1; ii--){ 
            String[][] s;
            for(int iii = 0; iii < w; iii++){
              grid[ii][iii] = grid[ii-1][iii];

            }
          }
        
        }
        else landed = false;
        
    }

    
    
    score+=10*linescleared*linescleared;
    
    if(level <= 29 && allLinesCleared == 10){
      allLinesCleared = 0;
      timer= timer-50*level;
      println("level up");
      levelup.play();
      level++;
    }
    
    
  }
  
  public int getLevel(){return level;}
  
  String[][] getFormation(int num){ //gets the shape of a block and sets the type
    switch(num){
      case 0: shapeType = iboxy.getType(); return iboxy.getFormation();
      case 1: shapeType = jboxy.getType(); return jboxy.getFormation();
      case 2: shapeType = lboxy.getType(); return lboxy.getFormation();
      case 3: shapeType = oboxy.getType(); return oboxy.getFormation();
      case 4: shapeType = sboxy.getType(); return sboxy.getFormation();
      case 5: shapeType = tboxy.getType(); return tboxy.getFormation();
      default: shapeType = zboxy.getType(); return zboxy.getFormation();
      
    }
  }
  
  int[] getDim(int num){ //gets the dimension of the box
    switch(num){
      case 0: shapeType = iboxy.getType(); return iboxy.shapeDim();
      case 1: shapeType = jboxy.getType(); return jboxy.shapeDim();
      case 2: shapeType = lboxy.getType(); return lboxy.shapeDim();
      case 3: shapeType = oboxy.getType(); return oboxy.shapeDim();
      case 4: shapeType = sboxy.getType(); return sboxy.shapeDim();
      case 5: shapeType = tboxy.getType(); return tboxy.shapeDim();
      default: shapeType = zboxy.getType(); return zboxy.shapeDim();
      
    }
  }
  
  public boolean getControlling(){return controlling;} //returns if a current piece is being dropped
  public void setControlling(boolean con){controlling = con;}
  
  public String toString(){
    String str = "";
    for(int i = 0; i < h; i++)
    {
     for(int ii = 0; ii < w; ii++){
       str+=(grid[i][ii] + " ");
     }
     str+="\n";
    }
    return str;
    
  }
  
  PImage getImage(String boxType){ //returns images
   switch(boxType){
    case "i": return ibox;
    case "I": return ibox;
    case "j": return jbox;
    case "J": return jbox;
    case "l": return lbox;
    case "L": return lbox;
    case "o": return obox;
    case "O": return obox;
    case "s": return sbox;
    case "S": return sbox;
    case "t": return tbox;
    case "T": return tbox;
    case "z": return zbox;
    case "Z": return zbox;
    case "W": return wallbox;
    case "*": return backbox;
    default: return blankBox;
   }
  }
  public void prepareGrid(int overStart, int upStart){
   w = boxesX + 2; h = boxesY + 1; // adds to the width and height for the border
    grid = new String[h][w]; // creates the array for the grid
    corner = new int[]{overStart*mult, upStart*mult};
    for(int i = 0; i < h-1; i++){ //creates the vertical borders
      grid[i][0] = "W"; // wall blocks
      for(int ii = 1; ii < boxesX+1; ii++){
          grid[i][ii] = "*"; // background blocks
      }
      grid[i][boxesX+1] = "W";
    }    
    for(int i = 0; i<w; i++){ //prepares the grid walls
     grid[h-1][i] = "W"; 
    }  
    
  }
  
  public void changeWidth(int num){
    w=num;
    
    prepareGrid(overStart, upStart);
  }
  
  public int getScore(){
    return score;
  }
}
