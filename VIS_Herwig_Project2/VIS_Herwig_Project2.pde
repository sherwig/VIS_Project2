import KinectPV2.KJoint;
import KinectPV2.*;
import java.util.ArrayList;
float zVal = 950;
float rotX = PI;
KinectPV2 kinect;
int[] randomStuff=new int[8];

void setup() 
{
  size(1920, 1080, P3D);
  colorMode(RGB);
  kinect = new KinectPV2(this);

  kinect.enableSkeletonColorMap(true);
//  kinect.enableColorImg(true);
//  kinect.enableSkeleton3DMap(true);
  kinect.enableDepthMaskImg(true);
  //kinect.enableSkeletonDepthMap(true);
  
  kinect.init();
  strokeWeight(4);

}

void draw() {
  background(0);

  //pushMatrix();
  //stroke(0,0,255);
  //translate(width/2, height/2, 0);
  //scale(zVal);
  //rotateX(rotX);
  //SkullyBoi();
  //popMatrix();

  SkullyBoi();

}


void SkullyBoi()
{
   //ArrayList<KSkeleton> skeletonArray =  kinect.getSkeleton3d();   
    ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonColorMap();
   //ArrayList<KSkeleton> skeletonArray =  kinect.getSkeletonDepthMap();
  int[] randomGetter=getRandom(randomStuff);
  println(randomStuff);
  //individual JOINTS
  for (int i = 0; i < skeletonArray.size(); i++) {
    KSkeleton skeleton = (KSkeleton) skeletonArray.get(i);
    if (skeleton.isTracked()) {
      KJoint[] joints = skeleton.getJoints();
    
      //Draw body
      color col  = skeleton.getIndexColor();
      stroke(col);
      drawBody8(joints);
    }       
  }

}

void drawBody1(KJoint[] joints)
{
   drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_Neck);
   drawBone(joints, KinectPV2.JointType_Neck, KinectPV2.JointType_ElbowLeft);
   drawBone(joints, KinectPV2.JointType_Neck, KinectPV2.JointType_ElbowRight);
   drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_FootLeft);
   drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_FootRight);
  
}


void drawBody2(KJoint[] joints)
{
   drawBone(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_SpineMid);
   drawBone(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_SpineMid);
   drawBone(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_HandRight);
   drawBone(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_HandLeft);

   drawBone(joints, KinectPV2.JointType_HandLeft, KinectPV2.JointType_FootRight);
   drawBone(joints, KinectPV2.JointType_HandRight, KinectPV2.JointType_FootLeft);

}

void drawBody3(KJoint[] joints)
{
  drawCurvedBone(joints,KinectPV2.JointType_Head,KinectPV2.JointType_ShoulderLeft,KinectPV2.JointType_ElbowLeft,KinectPV2.JointType_HandLeft);
  drawCurvedBone(joints,KinectPV2.JointType_Head,KinectPV2.JointType_ShoulderRight,KinectPV2.JointType_ElbowRight,KinectPV2.JointType_HandRight);

  
  drawCurvedBone(joints,KinectPV2.JointType_FootLeft,KinectPV2.JointType_KneeLeft,KinectPV2.JointType_HipLeft,KinectPV2.JointType_Head);
  drawCurvedBone(joints,KinectPV2.JointType_FootRight,KinectPV2.JointType_KneeRight,KinectPV2.JointType_HipRight,KinectPV2.JointType_Head);
}

void drawBody4(KJoint[] joints)
{
  drawBezierBone(joints,KinectPV2.JointType_Head,KinectPV2.JointType_ShoulderLeft,KinectPV2.JointType_ElbowLeft,KinectPV2.JointType_HandLeft);
  drawBezierBone(joints,KinectPV2.JointType_Head,KinectPV2.JointType_ShoulderRight,KinectPV2.JointType_ElbowRight,KinectPV2.JointType_HandRight);

  
  drawBezierBone(joints,KinectPV2.JointType_FootLeft,KinectPV2.JointType_KneeLeft,KinectPV2.JointType_HipLeft,KinectPV2.JointType_Head);
  drawBezierBone(joints,KinectPV2.JointType_FootRight,KinectPV2.JointType_KneeRight,KinectPV2.JointType_HipRight,KinectPV2.JointType_Head);
}

void drawBody5(KJoint[] joints)
{
  drawBezierBone(joints,KinectPV2.JointType_Head,KinectPV2.JointType_HandLeft,KinectPV2.JointType_HipRight,KinectPV2.JointType_KneeLeft);
  drawBezierBone(joints,KinectPV2.JointType_Head,KinectPV2.JointType_HandRight,KinectPV2.JointType_HipLeft,KinectPV2.JointType_KneeRight);  
}

void drawBody6(KJoint[] joints)
{
   drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipLeft);
   drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipRight);
   drawBone(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_KneeRight);
   drawBone(joints, KinectPV2.JointType_HipLeft, KinectPV2.JointType_KneeLeft);

   drawBone(joints, KinectPV2.JointType_KneeRight, KinectPV2.JointType_HandRight);
   drawBone(joints, KinectPV2.JointType_KneeLeft, KinectPV2.JointType_HandLeft);

   drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_SpineShoulder);
   drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderRight);
   drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderLeft);
   
   drawBone(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_HandRight);
   drawBone(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_HandLeft);
  
}

void drawBody7(KJoint[] joints) //<>//
{
  
  //drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_SpineMid);

  drawBezierBone(joints,KinectPV2.JointType_KneeLeft,KinectPV2.JointType_HipRight,KinectPV2.JointType_ElbowLeft,KinectPV2.JointType_ShoulderRight);
  drawBezierBone(joints,KinectPV2.JointType_KneeRight,KinectPV2.JointType_HipLeft,KinectPV2.JointType_ElbowRight,KinectPV2.JointType_ShoulderLeft);
  
  drawBezierBone(joints,KinectPV2.JointType_KneeLeft,KinectPV2.JointType_HandRight,KinectPV2.JointType_SpineMid,KinectPV2.JointType_ShoulderLeft);
  drawBezierBone(joints,KinectPV2.JointType_KneeRight,KinectPV2.JointType_HandLeft,KinectPV2.JointType_SpineMid,KinectPV2.JointType_ShoulderRight);

}

void drawBody8(KJoint[] joints)
{
  
  //drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_SpineMid);

  drawBezierBone(joints,KinectPV2.JointType_Head,KinectPV2.JointType_ShoulderRight,KinectPV2.JointType_ElbowRight,KinectPV2.JointType_SpineBase);
  drawBezierBone(joints,KinectPV2.JointType_Head,KinectPV2.JointType_ShoulderLeft,KinectPV2.JointType_ElbowLeft,KinectPV2.JointType_SpineBase);
  
  drawBezierBone(joints,KinectPV2.JointType_SpineShoulder,KinectPV2.JointType_SpineMid,KinectPV2.JointType_HipRight,KinectPV2.JointType_KneeLeft);
  drawBezierBone(joints,KinectPV2.JointType_SpineShoulder,KinectPV2.JointType_SpineMid,KinectPV2.JointType_HipLeft,KinectPV2.JointType_KneeRight);
  
  
  drawBezierBone(joints,KinectPV2.JointType_HandLeft,KinectPV2.JointType_HipLeft,KinectPV2.JointType_HipRight,KinectPV2.JointType_HandRight);

}

void drawBody(KJoint[] joints) {
  drawBone(joints, KinectPV2.JointType_Head, KinectPV2.JointType_Neck);
  drawBone(joints, KinectPV2.JointType_Neck, KinectPV2.JointType_SpineShoulder);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_SpineMid);

  drawBone(joints, KinectPV2.JointType_SpineMid, KinectPV2.JointType_SpineBase);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderRight);
  drawBone(joints, KinectPV2.JointType_SpineShoulder, KinectPV2.JointType_ShoulderLeft);
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipRight);
  drawBone(joints, KinectPV2.JointType_SpineBase, KinectPV2.JointType_HipLeft);

  // Right Arm    
  drawBone(joints, KinectPV2.JointType_ShoulderRight, KinectPV2.JointType_ElbowRight);
  drawBone(joints, KinectPV2.JointType_ElbowRight, KinectPV2.JointType_WristRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_HandRight);
  drawBone(joints, KinectPV2.JointType_HandRight, KinectPV2.JointType_HandTipRight);
  drawBone(joints, KinectPV2.JointType_WristRight, KinectPV2.JointType_ThumbRight);

  // Left Arm
  drawBone(joints, KinectPV2.JointType_ShoulderLeft, KinectPV2.JointType_ElbowLeft);
  drawBone(joints, KinectPV2.JointType_ElbowLeft, KinectPV2.JointType_WristLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_HandLeft);
  drawBone(joints, KinectPV2.JointType_HandLeft, KinectPV2.JointType_HandTipLeft);
  drawBone(joints, KinectPV2.JointType_WristLeft, KinectPV2.JointType_ThumbLeft);

  // Right Leg
  drawBone(joints, KinectPV2.JointType_HipRight, KinectPV2.JointType_KneeRight);
  drawBone(joints, KinectPV2.JointType_KneeRight, KinectPV2.JointType_AnkleRight);
  drawBone(joints, KinectPV2.JointType_AnkleRight, KinectPV2.JointType_FootRight);

  // Left Leg
  drawBone(joints, KinectPV2.JointType_HipLeft, KinectPV2.JointType_KneeLeft);
  drawBone(joints, KinectPV2.JointType_KneeLeft, KinectPV2.JointType_AnkleLeft);
  drawBone(joints, KinectPV2.JointType_AnkleLeft, KinectPV2.JointType_FootLeft);

  drawJoint(joints, KinectPV2.JointType_HandTipLeft);
  drawJoint(joints, KinectPV2.JointType_HandTipRight);
  drawJoint(joints, KinectPV2.JointType_FootLeft);
  drawJoint(joints, KinectPV2.JointType_FootRight);

  drawJoint(joints, KinectPV2.JointType_ThumbLeft);
  drawJoint(joints, KinectPV2.JointType_ThumbRight);

  drawJoint(joints, KinectPV2.JointType_Head);
}

void drawJoint(KJoint[] joints, int jointType) {
  //strokeWeight(.05);   
  //point(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
  pushMatrix();
  translate(joints[jointType].getX(), joints[jointType].getY(), joints[jointType].getZ());
  ellipse(0, 0, 10, 10);
  popMatrix();
}



void drawBone(KJoint[] joints, int jointType1, int jointType2) {
  //strokeWeight(.01);
  //line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(),joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());

  pushMatrix();
  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
 // ellipse(0, 0, 10, 10);
  popMatrix();
  line(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ());
}

void drawCurvedBone(KJoint[] joints, int jointType1, int jointType2, int jointType3, int jointType4) {
  //strokeWeight(.01);
  //curve(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(),joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ(),joints[jointType3].getX(), joints[jointType3].getY(), joints[jointType3].getZ(),joints[jointType4].getX(), joints[jointType4].getY(), joints[jointType4].getZ());
  noFill();
  pushMatrix();
  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
  //ellipse(0, 0, 10, 10);
  popMatrix();
  curve(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ(),joints[jointType3].getX(), joints[jointType3].getY(), joints[jointType3].getZ(),joints[jointType4].getX(), joints[jointType4].getY(), joints[jointType4].getZ());
}

void drawBezierBone(KJoint[] joints, int jointType1, int jointType2, int jointType3, int jointType4) {
  //strokeWeight(.01);
  //bezier(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(),joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ(),joints[jointType3].getX(), joints[jointType3].getY(), joints[jointType3].getZ(),joints[jointType4].getX(), joints[jointType4].getY(), joints[jointType4].getZ());
  noFill();
  pushMatrix();
  translate(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ());
 // ellipse(0, 0, 10, 10);
  popMatrix();
  bezier(joints[jointType1].getX(), joints[jointType1].getY(), joints[jointType1].getZ(), joints[jointType2].getX(), joints[jointType2].getY(), joints[jointType2].getZ(),joints[jointType3].getX(), joints[jointType3].getY(), joints[jointType3].getZ(),joints[jointType4].getX(), joints[jointType4].getY(), joints[jointType4].getZ());
}


int[] getRandom(int[] randoms)
{
  for(int i=0; i<randoms.length;i++)
  {
   randoms[i]=(floor(random(1,9))); 
   
  }
   return randoms;
  
}
