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


    public static ArrayList<Identifiers> removeDuplicates(ArrayList<Identifiers> list)
    {
        // Create a new ArrayList
        ArrayList<Identifiers> newList = new ArrayList<Identifiers>();
        // Traverse through the first list
        for (Identifiers element : list) {
            // If this element is not present in newList
            // then add it
            if (!newList.contains(element)) {
                newList.add(element);
            }
        }
        for (Identifiers temp : newList) {
            System.out.print(temp.value+" : "+temp.line+"\n");

        }
        // return the new list
        return newList;
    }


    public static void parcoursList(){
        ArrayList<Identifiers> newlist = new ArrayList<Identifiers>();
        newlist = removeDuplicates(list);
        for (Identifiers temp : newlist) {
            //System.out.print(temp.value+" : "+temp.line+"\n");

            }
        }

}
