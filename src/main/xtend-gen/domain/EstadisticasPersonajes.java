package domain;

import domain.Desempenio;
import domain.Ubicacion;
import java.util.ArrayList;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class EstadisticasPersonajes {
  private int vecesUsadoAntesDelDuelo;
  
  private int vecesQueGanoDuelo;
  
  private int vecesKills;
  
  private int vecesDeads;
  
  private int vecesAssist;
  
  private List<Ubicacion> ubicacionesUsadas;
  
  private Ubicacion mejorUbicacion;
  
  private Integer calificacion;
  
  private Desempenio desempenio;
  
  public EstadisticasPersonajes() {
    this.vecesUsadoAntesDelDuelo = 0;
    this.vecesQueGanoDuelo = 0;
    this.vecesKills = 0;
    this.vecesDeads = 0;
    this.vecesAssist = 0;
    ArrayList<Ubicacion> _newArrayList = CollectionLiterals.<Ubicacion>newArrayList();
    this.ubicacionesUsadas = _newArrayList;
  }
  
  public void agregarUnaParticipacion() {
    int _vecesUsadoAntesDelDuelo = this.vecesUsadoAntesDelDuelo;
    this.vecesUsadoAntesDelDuelo = (_vecesUsadoAntesDelDuelo + 1);
  }
  
  public int agregarUnaVictoria() {
    int _vecesQueGanoDuelo = this.vecesQueGanoDuelo;
    return this.vecesQueGanoDuelo = (_vecesQueGanoDuelo + 1);
  }
  
  public int sumarKill() {
    int _vecesKills = this.vecesKills;
    return this.vecesKills = (_vecesKills + 1);
  }
  
  public int sumarDeads() {
    int _vecesDeads = this.vecesDeads;
    return this.vecesDeads = (_vecesDeads + 1);
  }
  
  public int agregarAssist() {
    int _vecesAssist = this.vecesAssist;
    return this.vecesAssist = (_vecesAssist + 1);
  }
  
  @Pure
  public int getVecesUsadoAntesDelDuelo() {
    return this.vecesUsadoAntesDelDuelo;
  }
  
  public void setVecesUsadoAntesDelDuelo(final int vecesUsadoAntesDelDuelo) {
    this.vecesUsadoAntesDelDuelo = vecesUsadoAntesDelDuelo;
  }
  
  @Pure
  public int getVecesQueGanoDuelo() {
    return this.vecesQueGanoDuelo;
  }
  
  public void setVecesQueGanoDuelo(final int vecesQueGanoDuelo) {
    this.vecesQueGanoDuelo = vecesQueGanoDuelo;
  }
  
  @Pure
  public int getVecesKills() {
    return this.vecesKills;
  }
  
  public void setVecesKills(final int vecesKills) {
    this.vecesKills = vecesKills;
  }
  
  @Pure
  public int getVecesDeads() {
    return this.vecesDeads;
  }
  
  public void setVecesDeads(final int vecesDeads) {
    this.vecesDeads = vecesDeads;
  }
  
  @Pure
  public int getVecesAssist() {
    return this.vecesAssist;
  }
  
  public void setVecesAssist(final int vecesAssist) {
    this.vecesAssist = vecesAssist;
  }
  
  @Pure
  public List<Ubicacion> getUbicacionesUsadas() {
    return this.ubicacionesUsadas;
  }
  
  public void setUbicacionesUsadas(final List<Ubicacion> ubicacionesUsadas) {
    this.ubicacionesUsadas = ubicacionesUsadas;
  }
  
  @Pure
  public Ubicacion getMejorUbicacion() {
    return this.mejorUbicacion;
  }
  
  public void setMejorUbicacion(final Ubicacion mejorUbicacion) {
    this.mejorUbicacion = mejorUbicacion;
  }
  
  @Pure
  public Integer getCalificacion() {
    return this.calificacion;
  }
  
  public void setCalificacion(final Integer calificacion) {
    this.calificacion = calificacion;
  }
  
  @Pure
  public Desempenio getDesempenio() {
    return this.desempenio;
  }
  
  public void setDesempenio(final Desempenio desempenio) {
    this.desempenio = desempenio;
  }
}
