class Bsort {

  /* 3.1 bubble sort */
  /* bubble sort  O(N^2) */
  private void bubblesort(int[] x) {
	int cnt = 0, ccnt = 0;
	for ( int i = x.length; i > 0 ; i-- ) {
	  for ( int j = 1; j < i; j++ ) {
		if ( x[j] < x[j-1] ) {
		  int t = x[j];
		  x[j] = x[j-1];
		  x[j-1] = t;
		  ccnt++;
		}
		cnt++;
	  }
	}
	System.out.println("Count: "+cnt+",ChangeCount:"+ccnt);
  }

  /* 3.2 selection sort */
  /* selection sort  O(N^2) */
  private void selectionsort(int[] x) {
	int cnt = 0, ccnt = 0;
	for ( int i = 0; i < x.length; i++ ) {
	  int minimum_id = i;
	  for ( int j = i + 1; j < x.length; j++ ) {
		if (x[minimum_id] > x[j]) {
		  minimum_id = j;
		}
		cnt++;
	  }
	  int t = x[i];
	  x[i] = x[minimum_id];
	  x[minimum_id] = t;
	  ccnt++;
	}
	System.out.println("Count: "+cnt+",ChangeCount:"+ccnt);
  }

  /* 3.3 insert sort */
  private void insertsort(int[] x) {
	int cnt = 0, ccnt = 0;
	for ( int i = 1; i < x.length ; i++ ) {
	  int x_cnt = 0;
	  for (int j = i; j > 0 && x[j-1] > x[j]; j--, x_cnt++ ) {
		int t = x[j];
		x[j] = x[j-1];
		x[j-1] = t;
		ccnt++;
	  }
	  cnt += (x_cnt > 0 ? x_cnt : 1);
	}
	System.out.println("Count: "+cnt+",ChangeCount:"+ccnt);
  }

  /* 3.4 merge sort */
  private void mergesort(int[] x) {
	mergesort(x, 0, x.length);
  }

  private void mergesort(int[] vs, int left, int right) {
	if (right - left <= 1) {
	  return;
	}
	int half = left + (right-left) / 2;
	System.out.println("left="+left+",right="+right+",half="+half);

	mergesort(vs, left, half);
	mergesort(vs, half, right);

	merge(vs, left, half,right);
  }

  /* merge two array */
  /* left[1,2,7]  right[4,6,8] */
  /*   => [1,2,4,6,7] + [8] */
  private void merge(int[] vs, int left, int half, int right) {
	int[] work = new int[vs.length];
	int iw = 0, il = left, ir = half;

	while (il < half && ir < right) {
	  if (vs[il] <= vs[ir]) {
		work[iw++] = vs[il++];
	  } else {
		work[iw++] = vs[ir++];
	  }
	}
	while (il < half) {
	  work[iw++] = vs[il++];
	}
	while (ir < right) {
	  work[iw++] = vs[ir++];
	}
	System.arraycopy(work, 0, vs, left, right-left);
  }

  /* 3.5 quicksort */
  private int partition(int[] x, int left, int right, int pivot) {
	int il = left, ir = right - 1;
	while (il < ir) {
	  while ( il < right && x[il] <= pivot) {
		++il;
	  }
	  while ( left <= ir && pivot < x[ir]) {
		--ir;
	  }
	  if ( il >= ir )
		break;
	  int t = x[il];
	  x[il] = x[ir];
	  x[ir] = t;
	}
	return ir + 1;
  }

  private void quicksort(int[] x) {
	quicksort(x, 0, x.length);
  }
  private void quicksort(int[] vs, int left, int right) {
	if (right - left <= 1) {
	  return;
	}
	int pivotIdx = findPivotIdx(vs, left, right);
	if (pivotIdx < 0) { return; }

	System.out.println("left="+left+",right="+right+",pivot="+vs[pivotIdx]);
	print(vs, left, right);
	int mid = partition(vs, left, right, vs[pivotIdx]);

	quicksort(vs, left, mid);
	quicksort(vs, mid, right);
  }

  private int findPivotIdx(int[] x, int left, int right) {
	if (right - left <= 1) {
	  return -1;
	}

	int t = x[left];
	for (int i = left + 1; i < right; i++ ) {
	  if ( t == x[i] ) 
		continue;
	  if ( x[i] < t ) 
		return i;
	  else
		return left;
	}
	return -1;
  }

  /* dump */
  private void print(int[] x, int left, int right) {
	if (right < 0) { right = x.length; }
	StringBuffer str = new StringBuffer();
	for ( int i = left; i < right; i++ ) {
	  if ( i > left ) { str.append(","); }
	  str.append(x[i]);
	}
	System.out.println(str.toString());
  }

  private void print(int[] x) {
	print(x, 0, -1);
  }

  Bsort() {
	int[] data= { 7,2,1,6,8,4 };
	System.out.println("bubblesort");
	bubblesort(data);
	print(data);
	int[] data2= { 7,2,1,6,8,4 };
	System.out.println("selectionsort");
	selectionsort(data2);
	print(data2);
	int[] data3= { 7,2,1,6,8,4 };
	System.out.println("insertsort");
	insertsort(data3);
	print(data3);
	int[] data4= { 7,2,1,6,8,4 };
	System.out.println("mergesort");
	mergesort(data4);
	print(data4);
	int[] data5= { 7,2,1,6,8,4 };
	System.out.println("quicksort");
	quicksort(data5);
	print(data5);
  }
  
  public static void main(String args[]) {
	new Bsort();
  }
}
