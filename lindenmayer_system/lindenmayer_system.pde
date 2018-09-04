//https://en.wikipedia.org/wiki/L-system

void setup() {
  size(800, 800);
  
  //KochCurve().Draw();
  //SierpinskiTriangle().Draw();
  //SierpinskiArrowheadCurve().Draw();
  //FractalPlant().Draw();
  KochSnowflake().Draw();
}


Fractal KochCurve(){
  Rule[] rules = new Rule[1];
  rules[0] = new Rule('F', "F+F-F-F+F");
  
  String axiom = "--F";
  float angle = PI/2;
  int len = 8;
  
  Fractal f = new Fractal(axiom, rules, angle, len, 0.5);
  f.SetInitialTransform(width-100, height/2);
  f.Recurse(4);
  return f;
}

Fractal SierpinskiTriangle(){
  Rule[] rules = new Rule[2];
  rules[0] = new Rule('F', "F-G+F+G-F");
  rules[1] = new Rule('G', "GG");
  
  String axiom = "F-G-G";
  float angle = 2*PI/3;
  int len = 10;
  
  Fractal f = new Fractal(axiom, rules, angle, len, 0.5);
  f.SetInitialTransform(width/3, 2*height/3);
  f.Recurse(5);
  return f;
}

Fractal SierpinskiArrowheadCurve(){
  Rule[] rules = new Rule[2];
  rules[0] = new Rule('A', "B-A-B");
  rules[1] = new Rule('B', "A+B+A");
  
  String axiom = "+A";
  float angle = PI/3;
  int len = 2;
  
  Fractal f = new Fractal(axiom, rules, angle, len, 0.5);
  f.SetInitialTransform(width/2, height/4);
  f.Recurse(8);
  return f;
}

Fractal FractalPlant(){
  Rule[] rules = new Rule[2];
  rules[0] = new Rule('_', "F+[[_]-_]-F[-F_]+_");
  rules[1] = new Rule('F', "FF");
  
  String axiom = "+++_";
  float angle = -PI*(25.0/180);
  int len = 3;
  
  Fractal f = new Fractal(axiom, rules, angle, len, 0.8);
  f.SetInitialTransform(width/4, height);
  f.Recurse(7);
  return f;
}

Fractal KochSnowflake(){
  Rule[] rules = new Rule[1];
  rules[0] = new Rule('F', "F+F--F+F");
  
  String axiom = "F--F--F"; //equalateral triangle
  float angle = -PI/3;
  int len = 1;
  
  Fractal f = new Fractal(axiom, rules, angle, len, 0.8);
  f.SetInitialTransform(50, height/4);
  f.Recurse(6);
  return f;
}
