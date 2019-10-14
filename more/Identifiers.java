import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Identifiers{



    private final Object value;
    private final int line;
    private final int column;
    public static ArrayList<Identifiers> list = new ArrayList<Identifiers>();

    public Identifiers(int var1, int var2, Object var3) {
        this.line = var1 + 1;
        this.column = var2;
        this.value = var3;
        list.add(this);
    }



    public String toString(){
            final String value	= this.value != null? this.value.toString() : "null";
            return value+"\t : "+line;
    }

    public static void parcoursList(){
        for (Identifiers temp : list) {
            System.out.print(temp.toString()+"\n");
        }
        }

    }
