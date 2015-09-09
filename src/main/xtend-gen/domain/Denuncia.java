package domain;

import domain.AbusoDeHabilidad;
import domain.AbusoDelSistemaDeDenuncias;
import domain.ComunicacionAbusiva;
import domain.Descripcion;
import domain.Duelo;
import domain.FeedIntencional;
import domain.Motivo;
import java.util.Collections;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Denuncia {
  private Duelo contexto;
  
  private Motivo unMotivo;
  
  private Descripcion unaDescripcion;
  
  public Denuncia(final Duelo contexto, final Motivo unMotivo, final Descripcion unaDescripcion) {
    this.contexto = contexto;
    this.unMotivo = unMotivo;
    this.unaDescripcion = unaDescripcion;
  }
  
  public void castigar() {
    boolean _calcularValidez = this.calcularValidez();
    if (_calcularValidez) {
      this.unMotivo.evaluarse(this, this.contexto);
    } else {
      AbusoDelSistemaDeDenuncias _abusoDelSistemaDeDenuncias = new AbusoDelSistemaDeDenuncias();
      _abusoDelSistemaDeDenuncias.evaluarse(this, this.contexto);
    }
  }
  
  public boolean calcularValidez() {
    boolean _or = false;
    boolean _poseeMenosDe20Caracteres = this.unaDescripcion.poseeMenosDe20Caracteres();
    if (_poseeMenosDe20Caracteres) {
      _or = true;
    } else {
      boolean _sonMenosDe3Palabras = this.unaDescripcion.sonMenosDe3Palabras();
      _or = _sonMenosDe3Palabras;
    }
    return _or;
  }
  
  public List<? extends Motivo> getMotivosPosibles() {
    ComunicacionAbusiva _comunicacionAbusiva = new ComunicacionAbusiva();
    AbusoDeHabilidad _abusoDeHabilidad = new AbusoDeHabilidad();
    FeedIntencional _feedIntencional = new FeedIntencional();
    return Collections.<Motivo>unmodifiableList(CollectionLiterals.<Motivo>newArrayList(_comunicacionAbusiva, _abusoDeHabilidad, _feedIntencional));
  }
  
  @Pure
  public Duelo getContexto() {
    return this.contexto;
  }
  
  public void setContexto(final Duelo contexto) {
    this.contexto = contexto;
  }
  
  @Pure
  public Motivo getUnMotivo() {
    return this.unMotivo;
  }
  
  public void setUnMotivo(final Motivo unMotivo) {
    this.unMotivo = unMotivo;
  }
  
  @Pure
  public Descripcion getUnaDescripcion() {
    return this.unaDescripcion;
  }
  
  public void setUnaDescripcion(final Descripcion unaDescripcion) {
    this.unaDescripcion = unaDescripcion;
  }
}
