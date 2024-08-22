// Artur Bieniek
// 347165
// javac zad1.java ksiazka.bin Ksiazka && java zad1 && rm *.class
// javac zad1.java czasopismo.bin Czasopismo && java zad1 && rm *.class
// javac zad1.java wydawnictwo.bin WydawnictwoCiagle && java zad1 && rm *.class
import java.util.Arrays;
import java.io.*;
import javax.swing.*;
import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.*;
import java.awt.event.*;

class Ksiazka implements Serializable
{
  private String tytuł;
  private String autor;
  private int wydanie;
  public String toString()
  {
    return "Książka " + this.tytuł + " " + this.autor + " " + this.wydanie;
  }
  public Ksiazka(String t, String a, int w)
  {
    this.tytuł = t; this.autor = a; this.wydanie = w;
  }
  public Ksiazka()
  {
    this.tytuł = "Pan Tadeusz"; this.autor="Adam Mickiewicz"; this.wydanie=7;
  }
  public String getTytuł()
  {
    return this.tytuł;
  }
  public String getAutor()
  {
    return this.autor;
  }
  public int getWydanie()
  {
    return this.wydanie;
  }
}

class WydawnictwoCiagle extends Ksiazka
{
  private String ostatniaCzescData;
  public WydawnictwoCiagle(String t, String a, int w, String d)
  {
    super(t,a,w);
    this.ostatniaCzescData=d;
  }
  public WydawnictwoCiagle()
  {
    super();
    this.ostatniaCzescData="01.01.2000";
  }
  public String getData()
  {
    return ostatniaCzescData;
  }
}

class Czasopismo extends Ksiazka
{
  private int coIle;
  public Czasopismo(String t, String a, int w, int d)
  {
    super(t,a,w);
    this.coIle=d;
  }
  public Czasopismo()
  {
    super();
    this.coIle=31;
  }
  public int getcoIle()
  {
    return coIle;
  }
}

class KsiazkaEditor extends JPanel implements ActionListener, Serializable
{
  private Ksiazka ksiazka;
  private String filename;
  private JTextField autorField;
  private JTextField tytułField;
  private JTextField wydanieField;
  private JTextField dataField;
  private JTextField coIleField;
  private String classType;
  public KsiazkaEditor(String fn, String classType) throws IOException, ClassNotFoundException
  {
    this.classType = classType;
    this.filename=fn;
    try
    {
      FileInputStream fin = new FileInputStream(fn);
      ObjectInputStream objin = new ObjectInputStream(fin);
      Object obj = objin.readObject();
      if(classType.equals("WydawnictwoCiagle"))
        ksiazka = (WydawnictwoCiagle) obj;
      else if(classType.equals("Czasopismo"))
        ksiazka = (Czasopismo) obj;
      else
        ksiazka = (Ksiazka) obj;
    }
    catch(FileNotFoundException e)
    {
      if(classType.equals("WydawnictwoCiagle"))
        ksiazka = new WydawnictwoCiagle();
      else if(classType.equals("Czasopismo"))
        ksiazka = new Czasopismo();
      else
        ksiazka = new Ksiazka();
    }
    System.out.println(ksiazka.toString());
    GridLayout layout;
    if(classType.equals("WydawnictwoCiagle"))
      layout = new GridLayout(5, 2);
    else if(classType.equals("Czasopismo"))
      layout = new GridLayout(5, 2);
    else
      layout = new GridLayout(4, 2);
    this.setLayout(layout);
    JLabel autor_etykieta = new JLabel("Autor");
    this.add(autor_etykieta);
    autorField = new JTextField(ksiazka.getAutor(), 40);
    this.add(autorField);
    JLabel tytuł_etykieta = new JLabel("Tytuł");
    this.add(tytuł_etykieta);
    tytułField = new JTextField(ksiazka.getTytuł(), 40);
    this.add(tytułField);

    JLabel wydanie_etykieta = new JLabel("Wydanie");
    this.add(wydanie_etykieta);
    wydanieField = new JTextField(Integer.toString(ksiazka.getWydanie()), 40);
    this.add(wydanieField);

    if(classType.equals("WydawnictwoCiagle"))
    {
      JLabel data_etykieta = new JLabel("Data ostatniej publikacji");
      this.add(data_etykieta);
      dataField = new JTextField(((WydawnictwoCiagle)ksiazka).getData(), 40);
      this.add(dataField);
    }

    if(classType.equals("Czasopismo"))
    {
      System.out.println("cza");
      JLabel coIle_etykieta = new JLabel("Co ile wychodzi (dni)");
      this.add(coIle_etykieta);
      coIleField = new JTextField(Integer.toString(((Czasopismo)ksiazka).getcoIle()), 40);
      this.add(coIleField);
    }
    
    JButton b = new JButton("Zapisz");
    b.addActionListener(new ActionListener() {
      public void actionPerformed(ActionEvent e)
      {
        try
        {
          saveObject();
        }
        catch(Exception ex)
        {
          System.out.println("Nie udało się zapisać obiektu.");
        }
      }
    });
    this.add(b);
  }

  public void actionPerformed(ActionEvent e)
  {
    System.out.println("Inna akcja");
  }

  public void saveObject() throws IOException
  {
    if(classType.equals("WydawnictwoCiagle"))
      ksiazka = new WydawnictwoCiagle(this.tytułField.getText(), this.autorField.getText(), Integer.parseInt(this.wydanieField.getText()), this.dataField.getText());
    else if(classType.equals("Czasopismo"))
      ksiazka = new Czasopismo(this.tytułField.getText(), this.autorField.getText(), Integer.parseInt(this.wydanieField.getText()), Integer.parseInt(this.coIleField.getText()));
    else
      ksiazka = new Ksiazka(this.tytułField.getText(), this.autorField.getText(), Integer.parseInt(this.wydanieField.getText()));
    FileOutputStream fstream;
    fstream=new FileOutputStream(this.filename);
    ObjectOutputStream objstream = new ObjectOutputStream(fstream);
    objstream.writeObject(ksiazka);
    objstream.flush();
    objstream.close();
  }

}

public class zad1
{
    public static void main(String[] args) throws IOException, ClassNotFoundException
    {
        if(args.length!=2) throw new IOException("Liczba argumentów musi być równa 2");
        KsiazkaEditor k = new KsiazkaEditor(args[0], args[1]);
        JFrame frame = new JFrame("Edycja książki");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.add(k);
        frame.pack();
        frame.setVisible(true);
    }
}