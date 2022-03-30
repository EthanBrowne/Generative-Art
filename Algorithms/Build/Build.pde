float x;
float y;
float radius = 1;
float r = 0;
int [] colors = {#4C1A57,#FF3CC7,#F0F600,#00E5E8,#007C77,#390099,#9E0059,#FF0054,#FF5400,#FFBD00};
int color_that_we_use_why_is_this_variable_so_long = colors[int(random(0,colors.length))];
float pattern_num = (random(0,6));
void setup() {
	size(1000,1000);
	background(#182030);
	x = width/2;
	y = height/2;
	strokeWeight(2);
}

void draw() {
	fill(#182030,7);
	rect(0,0,width,height);
	noFill();
	stroke(color_that_we_use_why_is_this_variable_so_long);
	circle(x,y,radius);
	stroke(color_that_we_use_why_is_this_variable_so_long);
	line(x+random(-1*radius,radius),y+random(-1*radius,radius),width/2,height/2);
	r += PI/pattern_num;
	x = x+radius*cos(r);
	y = y+radius*sin(r);
	radius *= 1.025;
	if (radius > 1000){
		x = width/2;
		y = height/2;
		radius = 1;
		color_that_we_use_why_is_this_variable_so_long = colors[int(random(0,colors.length))];
		pattern_num = (random(0,6));
	}
}