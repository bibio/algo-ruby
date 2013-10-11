/*
 * aのk乗をm で割った余りを求める関数
 *   a, k, m は1以上の整数
 */
public class PowMod {
  /* a^n mod m = ((a mod m)*(a^n-1 mod m))mod m */
  public static int powmod(int a, int k, int m) {
	long t = 1;
	for ( int i = 0; i < k ; i++ ) {
	  t = (t * a) % m;
	}
	return (int)t;
  }
  /* k = 2t   のとき  n^k = n^t * n^t 
   * k = 2t+1 のとき  n^k = n^t * n^t * n */
  public static int powmod2(int a, int k, int m) {
	if ( k == 0 ) {
	  return 1;
	}
	long t = powmod2(a, k/2, m);
	t = (t * t) % m;
	if (k % 2 == 1) {
	  t = (t * a) % m;
	}
	return (int) t;
  }

  public static void main(String args[]) {
	System.out.println("powmod = " + powmod(3,100,2));
	//System.out.println("powmod = " + powmod(3,Integer.MAX_VALUE,2));
	System.out.println("powmod2 = " + powmod2(3,100,2));
	System.out.println("powmod2 = " + powmod2(3,Integer.MAX_VALUE,2));
  }
}
