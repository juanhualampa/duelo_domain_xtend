package domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.InputOutput;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Descripcion {
  private String palabras;
  
  public Descripcion(final String palabras) {
    this.palabras = palabras;
  }
  
  public boolean poseeMenosDe20Caracteres() {
    int _length = this.palabras.length();
    return (_length < 20);
  }
  
  public boolean sonMenosDe3Palabras() {
    boolean _xblockexpression = false;
    {
      String[] _split = this.palabras.split(" ");
      List<String> _asList = Arrays.<String>asList(_split);
      final ArrayList<String> myList = new ArrayList<String>(_asList);
      int _size = myList.size();
      _xblockexpression = (_size < 3);
    }
    return _xblockexpression;
  }
  
  public static void main(final String[] args) {
    final Descripcion desc = new Descripcion("Java es malo , Xtend es bueno");
    String[] _split = desc.palabras.split("\\s*,\\s*");
    List<String> _asList = Arrays.<String>asList(_split);
    final ArrayList<String> myList = new ArrayList<String>(_asList);
    InputOutput.<ArrayList<String>>println(myList);
  }
  
  @Pure
  public String getPalabras() {
    return this.palabras;
  }
  
  public void setPalabras(final String palabras) {
    this.palabras = palabras;
  }
}
