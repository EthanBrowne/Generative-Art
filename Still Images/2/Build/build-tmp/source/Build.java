/* autogenerated by Processing revision 1277 on 2022-01-26 */
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

 public void setup() {
	/* size commented out by preprocessor */;
	background(0,0,0);
	for(int i = 1000; i > 0; i--){
		square(500, 500, 100);
		rotate(radians(PApplet.parseInt(random(0, 90))));
		//fill(random(0, 255), random(0, 255), random(0, 255));
	}
	
}


  public void settings() { size(1000, 1000); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Build" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
