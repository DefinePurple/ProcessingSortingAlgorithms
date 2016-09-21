/*
  Author: Daniel Fitzpatrick
 
  points on edge:
  horizontal bubble:  
    Left -> (0,400) , (0,200) 
    Right -> (1200,400) , (1200,200)
  vertical bubble: 
    Top -> (400,0) , (800, 0) 
    Bottom -> (400,600) , (800,600)
 
  points of crossover:  
    Top-Left -> (400,200) 
    Top-Right -> (800,200) 
    Bottom-Left -> (400,400) 
    Bottom-Right -> (800,400)
 */

void setup() {
  size(1200, 600);
  stroke(255, 255, 0);
  frameRate(fps);
  textAlign(CENTER, CENTER);
  init();
}


PVector top = new PVector(0, 0);
PVector bottom = new PVector(0, 0);
int ele = 190, seconds_x = 61, i = 0, n = 1, fps = 60;
int rand;

//Objects
Line[] original = new Line[ele];
Line[] bubble = new Line[ele];
Line[] merge = new Line[ele];
Line[] insertion = new Line[ele];
Line[] selection = new Line[ele];
Line[] quick = new Line[ele];
Line[] heap = new Line[ele];
Line[] tempArray = new Line[ele];
Line temp = new Line(top, bottom);
Sorts sorts = new Sorts();



void draw() {
  screenSetup();

  sorts.bubbleSort(ele, bubble, temp, frameCount%ele);
  sorts.mergeSort(merge, frameCount%ele, ele, tempArray);
  sorts.insertionSort(ele, insertion, frameCount%ele);  
  sorts.selectionSort(ele, selection, temp, frameCount%ele);
  
  sorts.printSort(ele, bubble, 0, 0);
  sorts.printSort(ele, selection, width/3,0);
  sorts.printSort(ele, insertion, (width/3)*2, 0);
  sorts.printSort(ele, merge, 0,height/3);
  
  timer();
}//End Draw



//Gets the users key presses and stores them in "key"
void keyPressed() {
  if (key == 'r') {
    init();
  }
}//end keyPressed



//Tells the lines what they are
void init() {
  top.x = bottom.x = width/100;
  top.y = bottom.y = (height/6)*1.5;

  for (i=0; i<ele; i++) {
    original[i] = new Line(top, bottom);
    bubble[i] = new Line(top, bottom);
    merge[i] = new Line(top, bottom);
    selection[i] = new Line(top,bottom);
    insertion[i] = new Line(top, bottom);
    quick[i] = new Line(top,bottom);
    heap[i] = new Line(top,bottom);
    tempArray[i] = new Line(top,bottom);
    //randomly generate the top y point
    rand = 150 - (int) random(100);
    top.y = rand;
    //moves the line to the right 2 pixels
    top.x += 2;
    bottom.x += 2;
  }
}//end init



//Decides the colour of the screen and places the grid
void screenSetup() {
  background(128, 0, 128);
  //vertical lines
  line(width/3, 0, width/3, height);
  line((width/3)*2, 0, (width/3)*2, height);
  
  //horizontal lines
  line(0, (height/3)*2, width, (height/3)*2);
  line(0, (height/3), width, (height/3));

  //TEMP GRID
  /*stroke(255);
   line(width/6, 0, width/6,height);
   line((width/6)*3, 0, (width/6)*3, height);
   line((width/6)*5, 0, (width/6)*5, height);
   line(0, height/6, width, (height/6));
   line(0, (height/6)*3, width, (height/6)*3);
   line(0, (height/6)*5, width, (height/6)*5);
   stroke(255, 255, 0);*/

  textAlign(CENTER, BOTTOM);
  text("Bubble Sort", width/6, (height/3));
  text("Selection Sort", (width/6)*3, (height/3));
  text("Insertion Sort", (width/6)*5, (height/3));
  text("Merge Sort", width/6, ((height/3)*2));
  text("Quick Sort", (width/6)*3, ((height/3)*2));
  text("Heap Sort",(width/6)*5,(height/3)*2);
  textAlign(CENTER, CENTER);
  text("Daniel Fitzpatrick", (width/6), (height/6)*5);
}



//Counts seconds since program started
void timer() {
  text(frameCount/fps, 32, 32);
  if ((frameCount/fps) == pow(10, n)) {
    seconds_x += 6;
    n++;
  }
  text("seconds", seconds_x, 32);
}