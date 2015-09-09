package domain;

import domain.EstadisticasPersonajes;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Personaje {
  private Integer calificacion;
  
  private EstadisticasPersonajes estadistica;
  
  @Pure
  public Integer getCalificacion() {
    return this.calificacion;
  }
  
  public void setCalificacion(final Integer calificacion) {
    this.calificacion = calificacion;
  }
  
  @Pure
  public EstadisticasPersonajes getEstadistica() {
    return this.estadistica;
  }
  
  public void setEstadistica(final EstadisticasPersonajes estadistica) {
    this.estadistica = estadistica;
  }
}
