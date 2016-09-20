//top & bottom are the point vectors for the top and bottom of each line
PVector top = new PVector(0, 0);
PVector bottom = new PVector(0, 0);
//ele is the number of elements
int ele = 190; 
//Line holds the functions for creating the lines.
Line[] original = new Line[ele];
Line[] bubble = new Line[ele];
Line[] merge = new Line[ele];
Line[] insertion = new Line[ele];
Line[] temp_array = new Line[ele];
Line temp = new Line(top, bottom);
//Sorts holds the functions for sorting
Sorts sorts = new Sorts();
//seconds_x is the x position for "seconds"
int seconds_x = 40;
//i is a counter as is j and n. i counts for sorts and j counts the number of frames passed.
int i = 0, n = 1;
int fps = 60;
int check = 0;
int rand;

/* setup is used to set up various parts of the screen aswell as once off initialisation of the lines. */
void setup() {
  size(1200, 600);
  stroke(255, 255, 0);
  frameRate(fps);
  top.x = bottom.x = 10;
  top.y = bottom.y = 150;

  for (i=0; i<ele; i++) {
    original[i] = new Line(top, bottom);
    bubble[i] = new Line(top, bottom);
    merge[i] = new Line(top, bottom);
    insertion[i] = new Line(top,bottom);
    temp_array[i] = new Line(top, bottom);
    //randomly generate the top y point
    rand = 150 - (int) random(100);
    top.y = rand;
    //moves the line to the right 2 pixels
    top.x += 2;
    bottom.x += 2;
  }
}


void draw() {
  background(128, 0, 128);
  //vertical lines
  line(400, 0, 400, 600);
  line(800, 0, 800, 600);

  //horizontal lines
  line(0, 400, 1200, 400);
  line(0, 200, 1200, 200);
  /*
  points on edge:
   horizontal bubble:  Left -> (0,400) , (0,200) Righ -> (1200,400) , (1200,200)
   vertical bubble: Top -> (400,0) , (800, 0) Bottom -> (400,600) , (800,600)
   
   points of crossover:  Top-Left -> (400,200) Top-Right -> (800,200) Bottom-Left -> (400,400) Bottom-Right -> (800,400)
   */

  //TEMP LINES
  /*stroke(255);
   line(200,0,200,600);
   line(600,0,600,600);
   line(1000,0,1000,600);
   line(0,100,1200,100);
   line(0,300,1200,300);
   line(0,500,1200,500);
   stroke(255,255,0);
   */
  text("Bubble Sort", 166, 180);
  text("Merge Sort", 567, 180);
  text("Quick Sort", 970, 180);
  text("Insertion Sort", 166, 380);
  text("Heap Sort", 567, 380);
  text("Daniel Fitzpatrick", 10, 580);
  //If i is equal to the max number of elements it will reset i

  //SORTS 
  sorts.bubble_sort(ele, bubble, temp, frameCount%ele);
  sorts.merge_sort(merge,frameCount%ele, ele, temp_array);
  sorts.insertion_sort(ele,insertion,frameCount%ele);
  
  //bubble print
  sorts.print_sort(ele, bubble, 0, 0);
  //merge print
  sorts.print_sort(ele, merge, 400, 0);
  //quick print
  //sorts.print_sort(ele,quick,800,0);
  //insertion print
  sorts.print_sort(ele,insertion,0,200);

  /*Prints 120 text to the outp120screen. The if statements are used to change position
   of the word seconds as digits are added*/
  text(frameCount/fps, 32, 32);
  if ((frameCount/fps) == pow(10, n)) {
    seconds_x += 8;
    n++;
  }
  text("seconds", seconds_x, 32);
}