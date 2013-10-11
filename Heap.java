public class Heap {
  private int pos;
  private int[] values;

  public Heap(int n) {
	this.pos = 0;
	this.values = new int[n];
  }

  public void push(int v) {
	if (values.length <= pos) 
	  throw new RuntimeException("Exceeds the limit.");

	/* set last array */
	int p = pos++;
	values[p] = v;

	/* swap parent */
	while (p > 0) {
	  if (values[(p-1)/2] <= values[p]) 
		break;
	  int t = values[p];
	  values[p] = values[(p-1)/2];
	  values[(p-1)/2] = t;

	  p = (p - 1) / 2;
	}
  }

  public int pop() {
	if (pos <= 0)
	  throw new RuntimeException("Exceeds the limit.");

	int result = values[0];
	values[0] = values[--pos];

	int p = 0;
	while (p < pos) {
	  int left  = 2*p+1 < pos ? values[2*p+1] : Integer.MAX_VALUE;
	  int right = 2*p+2 < pos ? values[2*p+2] : Integer.MAX_VALUE;

	  /* */
	  if (values[p] <= left && values[p] <= right)
		break;

	  if (left < right) {
		values[2*p+1] = values[p];
		values[p] = left;
		p = 2*p + 1;
	  } else {
		values[2*p+2] = values[p];
		values[p] = right;
		p = 2*p + 2;
	  }
	}
	return result;
  }

  static void heapsort(int[] values) {
	Heap heap = new Heap(values.length);
	for (int i = 0; i < values.length; i++)
	  heap.push(values[i]);
	for (int i = 0; i < values.length; i++)
	  values[i] = heap.pop();
  }

  public static void main(String args[]) {
	int[] data = {7,2,1,6,8,4};
	heapsort(data);

	StringBuffer buf = new StringBuffer();
	for (int i = 0; i < data.length; i++) {
	  if (i > 0) 
		buf.append(",");
	  buf.append(data[i]);
	}
	System.out.println(buf.toString());
  }
}
