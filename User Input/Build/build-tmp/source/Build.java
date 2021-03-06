/* autogenerated by Processing revision 1277 on 2022-03-30 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class Build extends PApplet {

PGraphics pg;
PImage img;
float x = 450;
float oldx = x;
float y = 950;
float mx = 0;
int my = 5;
float circleX = 500;
float circleY = 250;
ArrayList<Wacky> circleList = new ArrayList<Wacky>();
boolean b = true;
boolean l = false;


 public void setup() {


	img = loadImage("167.jpg");
	/* pixelDensity commented out by preprocessor */;
	/* size commented out by preprocessor */;
	background(0xFF182030);
	pg = createGraphics(1000,1000);
}

 public void draw() {
	pg.beginDraw();
	noStroke();
	fill(0xFF182030,35);
	rect(0,0,width,height);
	if(l){
		image(img,0,0,width,height);
	}
	collide();
	if(b){
		fill(0xFFF9D71C);
		if(l){
			image(img, circleX,circleY,30,30);
		}else{
			circle(circleX, circleY, 15);
		}
		int r = PApplet.parseInt(random(0,8));
		if (r == 0){
			Wacky placeHolder = new Wacky(circleX+(random(-10,10)),circleY+(random(-10,10)));
			circleList.add(placeHolder);
		}
		if(l){
			image(img,x,y,height/10, width/100);
		}else{
			rect(x, y, height/10, width/100);
		}
		
	}
	if(keyPressed){
		oldx = x;
		if(key == 'a' && x >= 0){
			x -= 5;
		}else if(key == 'd' && x+height/10 <= width){
			x += 5;
		}else if(key == 'l'){
			lean();
		}
	}
	//for (Wacky i: circleList){
	//	i.drawAndShrink();
	//}
	circleY += my;
	circleX += mx;
	pg.endDraw();
	//image(pg, 0, 0);
}

 public void collide(){
	if(circleX > x && circleX < x+width/10 && circleY >= y){
		my *=-1;
		mx = random(-3,3);
		while (mx > -1 && mx < 1){
			mx = random(-1*my,my);
		}
	}else if(circleX < 0 || circleX > width){
		mx = mx*-1;
	}else if(circleY < 0){
		my = my*-1;
	}else if(circleY > width){
		respawn();
	}
}

 public void respawn(){
	fill(0xFF182030,35);
	rect(0,0,width,height);
		for (Wacky i: circleList){
		i.drawAndShrink();
	}
	image(pg,0,0);
	my = 0;
	mx = 0;
	b = false;
}

 public void lean(){
	l = true;
}
class Wacky{
	//color list
	int [] colors = {0xFFF433AB, 0xFFCB04A5, 0xFF934683, 0xFF65334D, 0xFF2D1115, 0xFF092327, 0xFF0B5351, 0xFF00A9A5, 0xFF4E8098, 0xFF90C2E7};
	//radius of circle
	int r = PApplet.parseInt(random(15,width/2));
	//postion values of circle
	float x;
	float y;
	int w = 4;
	int color_;
	Wacky(float x, float y){
		//sets postion of circle to the x and y value of the change in slope
		this.x = x;
		this.y = y;
		
	}
	//function that shrinks the circles radius and draws it.
	 public void drawAndShrink(){
		color_ = colors[PApplet.parseInt(random(0,colors.length))];
		pg.strokeWeight(w);
		pg.noFill();
		pg.stroke(color_);
		if (l){
			pg.image(img,x,y,r,r);
		}else{
			pg.circle(x,y,r);
		}
		if(r-w < 0){
			r = 0;
		}else if (r > 0){
			r-=w;
		}
	}
}


  public void settings() { size(1000, 1000);
pixelDensity(2); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
