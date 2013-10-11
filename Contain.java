import java.util.Random;
public class Contain {
  /* シンプルなリニア探索 */
  public static boolean contains_s(int v, int[] vs) {
	for (int i = 0; i < vs.length; i++) {
	  if ( vs[i] == v ) {
		return true;
	  }
	}
	return false;
  }

  public static boolean contains(int v, int[] vs) {
	int s = 0;
	int e = vs.length;
	int h;

	if (e == 0) { return false; }

	while (true) {
	  h = ( s + e ) / 2;
	  if (v == vs[h]) { return true; } 
	  else if (v < vs[h] ) { 
		e = h - 1;
	  } else {
		s = h + 1;
	  }
	  if ( s >= e ) { break; }
	}

	return false;
  }

  public static void main(String args[]) {
	int[] vs;
	int vs_len = 1024*1024*24;

	System.out.print("Creating array....");
	vs = new int[vs_len];
	Random rnd = new Random();
	for ( int i = 0; i < vs_len; i++ ) {
	  vs[i] = rnd.nextInt(vs_len);
	}
	java.util.Arrays.sort(vs);
	System.out.println("done");

	System.out.println("Contains("+(vs_len-1)+") = " + contains(vs_len-1, vs));
	System.out.println("Contains("+(vs_len-1)+") = " + contains_s(vs_len-1, vs));
	/*
	int[] vs1a = { };
	System.out.println("Contains("+10+") = " + contains(10, vs1a));
	int[] vs2 = { 1 };
	System.out.println("Contains("+10+") = " + contains(10, vs2));
	int[] vs2a = { 10 };
	System.out.println("Contains("+10+") = " + contains(10, vs2a));
	int[] vs3 = { 5,10 };
	System.out.println("Contains("+10+") = " + contains(10, vs3));
	int[] vs4 = { 5,8,10 };
	System.out.println("Contains("+10+") = " + contains(10, vs4));
	int[] vs5 = { 5,8,9 };
	System.out.println("Contains("+10+") = " + contains(6, vs5));
	*/
  }
}
