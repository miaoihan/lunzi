package action;

/**
 * time: 16-4-27.
 * author: han
 */
public class te {

    static void ta(){
        String sql = "";
        for (int i = 0; i < 3; i++) {
            String name = "n";
            sql = sql+name+"q";
        }
        System.out.println(sql);
    }

    public static void main(String[] args) {
        ta();
        int a = 3;
        if ( a == 3)
            System.out.println(a);
        else
            System.out.println(a+5);
    }
}
