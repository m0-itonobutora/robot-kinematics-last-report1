Arm arm;
float angle0;

void setup()
{fullScreen(P3D);
  strokeWeight(20);
  arm = new Arm(new PVector(0, 0));
  arm.addBone(200, 0);
  arm.addBone(200, 1);
  arm.addBone(200, 2);}

void draw()
{ background(0);
  lights();
  float angle1 = (float)mouseX/1000;
  float angle2 = (float)mouseY/1000;
  translate(width/2, height);
  arm.show();
  arm.setAngle(0, angle0);
  arm.setAngle(1, angle1);
  arm.setAngle(2, angle2);
  angle0+=0.01;
  if(keyPressed)
  {rect(mouseX, mouseY, 50, 50);}
  else{ background(0); }}

class Arm
{ArrayList<Bone> bones = new ArrayList<Bone>();
  PVector pos;
  Arm(PVector pos)
  {this.pos = pos;}
  
  void addBone(float len, int type)
  { if(bones.isEmpty())
  {bones.add(new Bone(len, type));}
  else{ bones.add(new Bone(bones.get(bones.size()-1), len, type)); }}
  
  void setAngle(int index, float angle)
  {bones.get(index).angle = angle;}
  
  void show()
  {pushMatrix();
    translate(pos);
    for(Bone bone : bones)
    {bone.show();}
    popMatrix();}}

class Bone
{Bone parent;
  int type; 
  float len;
  float angle;
  
  Bone(float len, int type)
  {this.len = len;
    this.type = type;}
  
  Bone(Bone bone, float len, int type)
  {this.parent = bone;
    this.len = len;
    this.type = type;}
  
  void show()
  {noStroke();
    box(50);
    if(type == 0)
    {rotateY(angle);}
    else if(type == 1)
    {rotateX(angle);}
    else if(type == 2)
    {rotateZ(angle);}
    stroke(255);
    line(0, 0, 0, 0, -len, 0);
    translate(0, -len, 0);
    noStroke();
    box(50);}}

void translate(PVector p)
{translate(p.x, p.y, p.z);}

void rotate(PVector p)
{rotateX(p.x);
  rotateY(p.y);
  rotateZ(p.z);}

void line(PVector a, PVector b)
{line(a.x, a.y, a.z, b.x, b.y, b.z);}
