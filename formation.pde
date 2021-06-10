
public class Formation{
  
  String[][] formation = new String[][]{
    {"*", "*", "*", "*"},
    {"*", "*", "*", "*"},
    {"*", "*", "*", "*"},
    {"*", "*", "*", "*"}
    
  };
  public String getType(){return "*";}
  public String[][] getFormation() {return formation;}
}
//USE IBOX AS EXAMPLE FOR ALL OTHER SUBCLASSES AS WELL
public class iBox extends Formation{
  String[][] getFormation(){ //returns array in shape of block
    formation = new String[][]{
      {"i", "i", "i", "i"}
      };
      return formation;
  }
  public String getType(){return "i";} //returns the type of block
  public int[] shapeDim(){ //returns the dimensions of the bloc
    int[] dim = {4, 1}; return dim;}
  
  public String[][] getRotation(int rot){ //returns all possible rotations of block
    switch(rot){
     case 0: formation = new String[][]{
      {"i", "i", "i", "i"}
      };
      return formation;
     
     case 90: formation = new String[][]{
       {"i"},
       {"i"},
       {"i"},
       {"i"}
       };
       return formation;

     case 180: formation = new String[][]{
      {"i", "i", "i", "i"}
      };
      return formation;
     
     default: formation = new String[][]{
       {"i"},
       {"i"},
       {"i"},
       {"i"}
       };
       return formation;
    }
  }
}




class jBox extends Formation{
  String[][] getFormation(){
    formation = new String[][]{
    {"j", "*", "*"},
    {"j", "j", "j"}

    };
    return formation;
  }
  public String getType(){return "j";}
  public int[] shapeDim(){
  int[] dim = {3, 2}; return dim;}
  
  public String[][] getRotation(int rot){
    switch(rot){
     case 0: formation = new String[][]{
      {"j", "*", "*"},
      {"j", "j", "j"}
      
      };
      return formation;
     
     case 90: formation = new String[][]{
       {"j", "j"},
       {"j", "*"},
       {"j", "*"}
       };
       return formation;

     case 180: formation = new String[][]{
      {"j", "j", "j"},
      {"*", "*", "j"}
      
      };
      return formation;
     
     default: formation = new String[][]{
       {"*", "j"},
       {"*", "j"},
       {"j", "j"}
       
       };
       return formation;
    }
  }
  
  
  
}





class lBox extends Formation{
  String[][] getFormation(){
    formation = new String[][]{
    {"*", "*", "l"},
    {"l", "l", "l"}
    };
    return formation;
  }
  public String getType(){return "l";}
  public int[] shapeDim(){
  int[] dim = {3, 2}; return dim;}
  
  public String[][] getRotation(int rot){
    switch(rot){
     case 0: formation = new String[][]{
        {"*", "*", "l"},
        {"l", "l", "l"}
      
      };
      return formation;
     
     case 90: formation = new String[][]{
       {"l", "*"},
       {"l", "*"},
       {"l", "l"}
       };
       return formation;

     case 180: formation = new String[][]{
        {"l", "l", "l"},
        {"l", "*", "*"}
      
      };
      return formation;
     
     default: formation = new String[][]{
       {"l", "l"},
       {"*", "l"},
       {"*", "l"}
       
       };
       return formation;
    }
  }
}





class oBox extends Formation{
  String[][] getFormation(){
    formation = new String[][]{
    {"o", "o"},
    {"o", "o"}
    };
    return formation;
  }
  public String getType(){return "o";}
  public int[] shapeDim(){
  int[] dim = {2, 2}; return dim;}
  
  public String[][] getRotation(int rot){
    switch(rot){
     case 0: formation = new String[][]{
      {"o", "o"},
      {"o", "o"}
      
      };
      return formation;
     
     case 90: formation = new String[][]{
      {"o", "o"},
      {"o", "o"}
       
       };
       return formation;

     case 180: formation = new String[][]{
      {"o", "o"},
      {"o", "o"}
      
      };
      return formation;
     
     default: formation = new String[][]{
      {"o", "o"},
      {"o", "o"}
       
       };
       return formation;
    }
  }
}





class sBox extends Formation{
  String[][] getFormation(){
    formation = new String[][]{
    {"*", "s", "s"},
    {"s", "s", "*"}
    };
    return formation;
  }
  public String getType(){return "s";}
  public int[] shapeDim(){
  int[] dim = {3, 2}; return dim;}
  
  public String[][] getRotation(int rot){
    switch(rot){
     case 0: formation = new String[][]{
      {"*", "s", "s"},
      {"s", "s", "*"}
      
      };
      return formation;
     
     case 90: formation = new String[][]{
       {"s", "*"},
       {"s", "s"},
       {"*", "s"}
       
       };
       return formation;

     case 180: formation = new String[][]{
      {"*", "s", "s"},
      {"s", "s", "*"}
      
      };
      return formation;
     
     default: formation = new String[][]{
       {"s", "*"},
       {"s", "s"},
       {"*", "s"}
       
       };
       return formation;
    }
  }
}





class tBox extends Formation{
  
  String[][] getFormation(){
    formation = new String[][]{
    {"*", "t", "*"},
    {"t", "t", "t"}
    };
    return formation;
  }
  public String getType(){return "t";}
  public int[] shapeDim(){
  int[] dim = {3, 2}; return dim;}
  
  public String[][] getRotation(int rot){
    switch(rot){
     case 0: formation = new String[][]{
       {"*", "t", "*"},
       {"t", "t", "t"}
      };
      return formation;
     
     case 90: formation = new String[][]{
       {"t", "*"},
       {"t", "t"},
       {"t", "*"}
     };
       return formation;
  
     case 180: formation = new String[][]{
       {"t", "t", "t"},
       {"*", "t", "*"}
       
      };
      return formation;
     
     default: formation = new String[][]{
       {"*", "t"},
       {"t", "t"},
       {"*", "t"}
       
       };
       return formation;
    }
  }
}





class zBox extends Formation{
  String[][] getFormation(){
    formation = new String[][]{
    {"z", "z", "*"},
    {"*", "z", "z"}
    };
    return formation;
  }
  public String getType(){return "z";}
  public int[] shapeDim(){
  int[] dim = {3, 2}; return dim;}
  
  public String[][] getRotation(int rot){
    switch(rot){
     case 0: formation = new String[][]{
      {"z", "z", "*"},
      {"*", "z", "z"}
      };
      return formation;
     
     case 90: formation = new String[][]{
       {"*", "z"},
       {"z", "z"},
       {"z", "*"}
       };
       return formation;

     case 180: formation = new String[][]{
        {"z", "z", "*"},
        {"*", "z", "z"}
      };
      return formation;
     
     default: formation = new String[][]{
       {"*", "z"},
       {"z", "z"},
       {"z", "*"}
       
       };
       return formation;
    }
  }
}
