public class Identifiers{



    private final Object value;
    private final int line;
    private final int column;

    public Identifiers(int var1, int var2, Object var3) {
        this.line = var1 + 1;
        this.column = var2;
        this.value = var3;

    }



    public String toString(){
            final String value	= this.value != null? this.value.toString() : "null";
            return value+"\t : "+line;
    }


}