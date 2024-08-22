// Artur Bieniek
// 347165
// javac zad2.java && java zad2 && rm *.class
import java.util.Map;
import java.util.HashMap;

class Expression
{
    Expression leftNode;
    Expression rightNode;
    String operation;
    public Expression(Expression left, Expression right, String op)
    {
        this.leftNode=left;
        this.rightNode=right;
        this.operation=op;
    }
    public int evaluate(Map<String, Integer> vars) throws Exception
    {
        throw new Exception("Evaluation not implemented.");
    }
    public String toString()
    {
        return "NaN";
    }
}

class Const extends Expression
{
    public Const(int val)
    {
        super(null, null, String.valueOf(val));
    }
    public int evaluate(Map<String, Integer> vars)
    {
        return Integer.parseInt(this.operation);
    }
    public String toString()
    {
        return this.operation;
    }
}

class Variable extends Expression
{
    public Variable(String val)
    {
        super(null, null, val);
    }
    public int evaluate(Map<String, Integer> vars) throws Exception
    {
        Integer val=vars.get(this.operation);
        if(val==null) throw new Exception("Variable "+this.operation+" value not provided");
        return val.intValue();
    }
    public String toString()
    {
        return this.operation;
    }
}

class Add extends Expression
{
    public Add(Expression left, Expression right)
    {
        super(left, right, "+");
    }
    public int evaluate(Map<String, Integer> vars) throws Exception
    {
        return leftNode.evaluate(vars)+rightNode.evaluate(vars);
    }
    public String toString()
    {
        return leftNode.toString()+"+"+rightNode.toString();
    }
}

class Subtract extends Expression
{
    public Subtract(Expression left, Expression right)
    {
        super(left, right, "-");
    }
    public int evaluate(Map<String, Integer> vars) throws Exception
    {
        return leftNode.evaluate(vars)-rightNode.evaluate(vars);
    }
    public String toString()
    {
        return leftNode.toString()+"-"+rightNode.toString();
    }
}

class Multiply extends Expression
{
    public Multiply(Expression left, Expression right)
    {
        super(left, right, "*");
    }
    public int evaluate(Map<String, Integer> vars) throws Exception
    {
        return leftNode.evaluate(vars)*rightNode.evaluate(vars);
    }
    public String toString()
    {
        return leftNode.toString()+"*"+rightNode.toString();
    }
}

public class zad2
{
  public static void main(String[] args) throws Exception
  {
    Const c1=new Const(42);
    System.out.println(c1.toString());
    System.out.println(c1.evaluate(new HashMap<String, Integer>()));
    Variable v1=new Variable("x");
    System.out.println(v1.toString());
    // Map<String,Integer> vars = ;
    System.out.println(v1.evaluate(new HashMap<String, Integer>(){{put("x", 7);}}));
    Add add1=new Add(c1, v1);
    System.out.println(add1.toString());
    System.out.println(add1.evaluate(new HashMap<String, Integer>(){{put("x", 7);}}));
    Subtract sub1=new Subtract(c1, v1);
    System.out.println(sub1.toString());
    System.out.println(sub1.evaluate(new HashMap<String, Integer>(){{put("x", 7);}}));
    Multiply mul1=new Multiply(c1, v1);
    System.out.println(mul1.toString());
    System.out.println(mul1.evaluate(new HashMap<String, Integer>(){{put("x", 7);}}));
  }
}