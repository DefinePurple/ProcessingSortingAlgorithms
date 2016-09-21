class Sorts {
  int min=0, i=0, j=0, k=0;
  int mid;
  float current;  

  //Bubble sort
  void bubbleSort(int ele, Line[] lines, Line temp, int counter) {
    if (counter != ele-1) {
      for (i=0; i<ele-1; i++) {
        if (lines[i].size() > lines[i+1].size()) {
          temp.top.y = lines[i].top.y;
          lines[i].top.y = lines[i+1].top.y;
          lines[i+1].top.y = temp.top.y;
        }
      }
    }
  }


  //Insertion Sort
  void insertionSort(int ele, Line[] lines, int counter) {

    if (counter != ele  && counter > 0) {
      current = lines[counter].top.y;
      j=counter-1;
      while ((lines[j].top.y < current) && (j>0)) {
        lines[j+1].top.y = lines[j].top.y;
        j--;
      }
      lines[j+1].top.y = current;
    }
  }

  //Merge Sort   
  void mergeSort(Line[] a, int low, int high, Line[] b) {
    if ((high-low) >= 2) {
      mid = (high+low)/2;
      mergeSort(a, low, mid, b);
      mergeSort(a, mid+1, high, b);
      merge(a, low, mid, high, b);
      copyArray(a, low, high, b);
    }
  }


  void merge(Line[] a, int low, int mid, int high, Line[] b) {
    i = low;
    j = mid;
    for (int k=low; k<high; k++) {
      if ((i<mid) && ((j >= high) || (a[i].top.y >= a[j].top.y))) {
        b[k].top.y = a[i].top.y;
        i++;
      } else {
        b[k].top.y = a[j].top.y;
        j++;
      }
    }
  }

  void copyArray(Line[] a, int low, int high, Line[] b) {
    for (i=low; i<high; i++) {
      a[i].top.y = b[i].top.y;
    }
  }


  //Quick Sort

  //Print each line for the specified sort.
  void printSort(int ele, Line[] lines, int pos_x, int pos_y) {
    for (int j=0; j<ele; j++) {
      lines[j].create(pos_x, pos_y);
    }
  }

  void printSize(int ele, Line[] lines) {
    for (i=0; i<ele; i++) {
      print(lines[i].size());
      print(" ");
    }
    println();
    delay(500);
  }
}