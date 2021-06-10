import java.util.Arrays;


class Text{
  PImage wallbox, backbox, ibox, jbox, lbox, obox, sbox, tbox, zbox, blankBox;
  int w; int h = 5; String word;
  int[] corner; // in order of x y
  String[][] text;
  iBox iboxy;
  jBox jboxy;
  lBox lboxy;
  oBox oboxy;
  sBox sboxy;
  tBox tboxy;
  zBox zboxy;
  Random rand;
  int overStart; int upStart;
  int mult = 16;
  
  Text(int oS, int uS, String word, int mult){
    this.word = word;
    this.mult = mult;
    w = word.length();
    overStart = oS; upStart = uS;
    corner = new int[]{overStart*mult, upStart*mult};
    wallbox = loadImage("wallbox.png"); // loads the image
    backbox = loadImage("backgroundbox.png");
    ibox = loadImage("wallbox2.png");
    jbox = loadImage("wallbox2.png");
    lbox = loadImage("wallbox2.png");
    obox = loadImage("wallbox2.png");
    sbox = loadImage("wallbox2.png");
    tbox = loadImage("wallbox2.png");
    zbox = loadImage("wallbox2.png");
    blankBox = loadImage("blankbox.png");

    
    rand = new Random();
    
    text = makeText();
       
  }
  
  Text(int oS, int uS, String word){
    this.word = word;
    w = word.length();
    overStart = oS; upStart = uS;
    corner = new int[]{overStart*mult, upStart*mult};
    wallbox = loadImage("wallbox.png"); // loads the image
    backbox = loadImage("backgroundbox.png");
    ibox = loadImage("cibox.png");
    jbox = loadImage("cjbox.png");
    lbox = loadImage("clbox.png");
    obox = loadImage("cobox.png");
    sbox = loadImage("csbox.png");
    tbox = loadImage("ctbox.png");
    zbox = loadImage("czbox.png");
    blankBox = loadImage("blankbox.png");

    
    rand = new Random();
    
    text = makeText();
       
  }
  
  public void setWord(String word){
   this.word = word;
   w = word.length();
   text = makeText();
  }
  
  public void drawText(){ //draws the grid with a for loop
    PImage im;
    int x;
    int newCorn0 = corner[0];
    for(int i = 0; i < h; i++){ //rows
      for(int ii = 0; ii < w; ii++) //stuff in rows
      {  
        for(int iii = 0; iii < 3; iii++){
          im = (getImage(Character.toString(text[i][ii].charAt(iii))));
          x = (iii + 4*ii-1);
          image(im, (x)*mult+newCorn0, i*mult+corner[1]);

        }
   
      }  
    }
  }
  
  String[][] makeText(){
    String[][] t = new String[5][w];
    String s = "";
    String letter;
    String liney = "";
    
    for(int i = 0; i < h; i++){
      for(int ii = 0; ii < w; ii++){
        letter = Character.toString(word.charAt(ii));
        for(int iii = 0; iii<3; iii++){
         liney += (getChar(letter)[i][iii]);
         
        }
        
       t[i][ii] = liney;
       liney = "";
        
      }
      
      
    }

    return t;
  }
  



  public String[][] getChar(String character){
    String[][] s;
    switch(character){
     case "0" :
       String[][] str = {
         {"-", "-", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "-", "-"}
       };
       s = str;
       break;
    
     
     case "1" :
       String[][] str1 = {
         {"*", "-", "*"},
         {"-", "-", "*"},
         {"*", "-", "*"},
         {"*", "-", "*"},
         {"-", "-", "-"}
       };
       s = str1;
       break;
    
     case "2" :
       String[][] str2 = {
         {"-", "-", "-"},
         {"*", "*", "-"},
         {"-", "-", "-"},
         {"-", "*", "*"},
         {"-", "-", "-"}
       };
       s = str2;
       break;
       
     case "3" :
       String[][] str3 = {
         {"-", "-", "-"},
         {"*", "*", "-"},
         {"-", "-", "-"},
         {"*", "*", "-"},
         {"-", "-", "-"}
       };
       s = str3;
       break;
       
     case "4" : 
       String[][] str4 = {
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "-", "-"},
         {"*", "*", "-"},
         {"*", "*", "-"}
       };
       s = str4;
       break;
       
     case "5" :
       String[][] str5 = {
         {"-", "-", "-"},
         {"-", "*", "*"},
         {"-", "-", "-"},
         {"*", "*", "-"},
         {"-", "-", "-"}
       };
       s = str5;
       break;
       
     case "6" : 
       String[][] str6 = {
         {"-", "-", "-"},
         {"-", "*", "*"},
         {"-", "-", "-"},
         {"-", "*", "-"},
         {"-", "-", "-"}
       };
       s = str6;
       break;
       
     case "7" :
       String[][] str7 = {
         {"-", "-", "-"},
         {"-", "*", "-"},
         {"*", "*", "-"},
         {"*", "*", "-"},
         {"*", "*", "-"}
       };
       s = str7;
       break;
       
     case "8" :
       String[][] str8 = {
         {"-", "-", "-"},
         {"-", "*", "-"},
         {"-", "-", "-"},
         {"-", "*", "-"},
         {"-", "-", "-"}
       };
       s = str8;
       break;
       
     case "9":
       String[][] str9 = {
         {"-", "-", "-"},
         {"-", "*", "-"},
         {"-", "-", "-"},
         {"*", "*", "-"},
         {"-", "-", "-"}
       };
       s = str9;
       break;
       
     case "a":
       String[][] strA = {
         {"-", "-", "-"},
         {"-", "*", "-"},
         {"-", "-", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"}
       };
       s = strA;
       break;
       
     case "c":
       String[][] strC = {
         {"-", "-", "-"},
         {"-", "*", "*"},
         {"-", "*", "*"},
         {"-", "*", "*"},
         {"-", "-", "-"}
       };
       s = strC;
       break;
       
     case "d":
       String[][] strD = {
         {"-", "-", "*"},
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "-", "*"}
       };
       s = strD;
       break;
       
     case "e":
       String[][] strE = {
         {"-", "-", "-"},
         {"-", "*", "*"},
         {"-", "-", "-"},
         {"-", "*", "*"},
         {"-", "-", "-"}
       };
       s = strE;
       break;
       
     case "g":
       String[][] strG = {
         {"-", "-", "-"},
         {"-", "*", "*"},
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "-", "-"}
       };
       s = strG;
       break;
       
     case "h":
       String[][] strH = {
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "-", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"}
       };
       s = strH;
       break;
       
     case "i":
       String[][] strI = {
         {"-", "-", "-"},
         {"*", "-", "*"},
         {"*", "-", "*"},
         {"*", "-", "*"},
         {"-", "-", "-"}
       };
       s = strI;
       break;
       
     case "l":
       String[][] strL = {
         {"-", "*", "*"},
         {"-", "*", "*"},
         {"-", "*", "*"},
         {"-", "*", "*"},
         {"-", "-", "-"}
       };
       s = strL;
       break;
       
     case "m":
       String[][] strM = {
         {"-", "*", "-"},
         {"-", "-", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"}
       };
       s = strM;
       break;
       
     case "n":
       String[][] strN = {
         {"-", "-", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"}
       };
       s = strN;
       break;
       
     case "o":
       String[][] strO = {
         {"-", "-", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "-", "-"}
       };
       s = strO;
       break;
       
     case "r":
       String[][] strR = {
         {"-", "-", "-"},
         {"-", "*", "-"},
         {"-", "-", "*"},
         {"-", "*", "-"},
         {"-", "*", "-"}
       };
       s = strR;
       break;
       
     case "s":
       String[][] strS = {
         {"-", "-", "-"},
         {"-", "*", "*"},
         {"-", "-", "-"},
         {"*", "*", "-"},
         {"-", "-", "-"}
       };
       s = strS;
       break;
       
     case "t":
       String[][] strT = {
         {"-", "-", "-"},
         {"*", "-", "*"},
         {"*", "-", "*"},
         {"*", "-", "*"},
         {"*", "-", "*"}
       };
       s = strT;
       break;
       
     case "v":
       String[][] strV = {
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"*", "-", "*"}
       };
       s = strV;
       break;
       
     case "w":
       String[][] strW = {
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "*", "-"},
         {"-", "-", "-"},
         {"-", "*", "-"}
       };
       s = strW;
       break;
       
       case ":":
       String[][] strcolon = {
         {"*", "-", "*"},
         {"*", "*", "*"},
         {"*", "*", "*"},
         {"*", "*", "*"},
         {"*", "-", "*"}
       };
       s = strcolon;
       break;
       
     default:
       String[][] strEmpty = {
         {"*", "*", "*"},
         {"*", "*", "*"},
         {"*", "*", "*"},
         {"*", "*", "*"},
         {"*", "*", "*"}
       };
       s = strEmpty;
       break;
   
    }
    
    for(int i = 0; i < s.length; i++){
      for(int ii =0; ii < s[i].length; ii++){
        if(s[i][ii] == "-"){
          s[i][ii] = String.valueOf(rand.nextInt(7));
          
        }
      }
    }
    
    return s;
  }
  
  
  
  PImage getImage(String boxType){ //returns images
   switch(boxType){
    case "0": return ibox; 
    case "1": return jbox;
    case "2": return lbox;
    case "3": return obox;
    case "4": return sbox;
    case "5": return tbox;
    case "6": return zbox;
    default: return blankBox;

   }
  }
  

}
