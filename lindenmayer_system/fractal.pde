class Fractal {
  String axiom;
  String sentence;
  Rule[] rules;
  float angle;
  float len;
  int initialTransformX;
  int initialTransformY;
  float scaler;
  
  Fractal(String axiom_, Rule[] rules_, float angle_, int len_, float scaler_){
    axiom = axiom_;
    rules = rules_;
    angle = angle_;
    len = len_;
    scaler = scaler_;
    sentence = axiom;
    SetInitialTransform(0, 0);
  }
  
  void Print(){
    //println("axiom: " + axiom + "\nrule: " + rules[0].a + " -> " + rules[0].b + "\nangle: " + angle);
    println(sentence);
  }
  
  void Recurse(int r_){
    for(int r = r_; r > 0; r--){
      
      String temp = "";
      for(int i = 0; i < sentence.length(); i++){
        
        char c = sentence.charAt(i);
        boolean found = false;
        for(int j = 0; j < rules.length; j++){
          if(sentence.charAt(i) == rules[j].a){
            found = true;
            temp += rules[j].b;
            continue;
          }
        }
        if(!found){
          temp += Character.toString(c);
        }
      }
      sentence = temp;
      
    }
  }
  
  void Draw(){
    translate(initialTransformX, initialTransformY);
    
    for(int i = 0; i < sentence.length(); i++){
      
      char c = sentence.charAt(i);
      if(Character.isAlphabetic(c)){
        line(0, 0, len, 0);
        translate(len, 0);
      }
      else if(c == '['){
        pushMatrix();
        len *= scaler;
      }
      else if(c == ']'){
        popMatrix();
        len /= scaler;
      }
      else if(c == '-'){
        rotate(-angle);
      }
      else if(c == '+'){
        rotate(angle);
      }
      
    }
  }
  
  void SetInitialTransform(int x, int y){
    initialTransformX = x;
    initialTransformY = y;
  }
}
