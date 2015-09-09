package domain;

import domain.Jugador;
import domain.Personaje;
import domain.Ubicacion;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Retador {
  private Jugador jugador;
  
  private Personaje personaje;
  
  private Ubicacion ubicacion;
  
  public Retador(final Jugador jugador, final Personaje personaje, final Ubicacion ubicacion) {
    this.jugador = jugador;
    this.personaje = personaje;
    this.ubicacion = ubicacion;
  }
  
  @Pure
  public Jugador getJugador() {
    return this.jugador;
  }
  
  public void setJugador(final Jugador jugador) {
    this.jugador = jugador;
  }
  
  @Pure
  public Personaje getPersonaje() {
    return this.personaje;
  }
  
  public void setPersonaje(final Personaje personaje) {
    this.personaje = personaje;
  }
  
  @Pure
  public Ubicacion getUbicacion() {
    return this.ubicacion;
  }
  
  public void setUbicacion(final Ubicacion ubicacion) {
    this.ubicacion = ubicacion;
  }
}
