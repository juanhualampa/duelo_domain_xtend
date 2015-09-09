package domain;

import domain.Duelo;
import domain.EstadisticasPersonajes;
import domain.Jugador;
import domain.Personaje;
import domain.Retador;
import domain.Ubicacion;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Perdedor {
  private Retador participante;
  
  public Perdedor(final Retador participante, final Duelo duelo) {
    this.participante = participante;
    this.actualizarEstadisticas(duelo);
  }
  
  public EstadisticasPersonajes estadisticas() {
    Personaje _personaje = this.participante.getPersonaje();
    return _personaje.getEstadistica();
  }
  
  public void actualizarEstadisticas(final Duelo duelo) {
    EstadisticasPersonajes _estadisticas = this.estadisticas();
    this.actualizar(_estadisticas, duelo);
  }
  
  public void actualizar(final EstadisticasPersonajes estadistica, final Duelo duelo) {
    estadistica.agregarUnaParticipacion();
    Ubicacion _ubicacion = this.participante.getUbicacion();
    this.actualizacionesDependientesDeLaPosicion(this.participante, duelo, _ubicacion);
  }
  
  public boolean inicioElDuelo(final Duelo duelo) {
    Jugador _jugador = this.participante.getJugador();
    Retador _retador = duelo.getRetador();
    Jugador _jugador_1 = _retador.getJugador();
    return _jugador.equals(_jugador_1);
  }
  
  /**
   * Cantidad de veces que lo usó para iniciar un duelo
   * 
   * Cantidad de veces que ganó un duelo
   * 
   * Cantidad de kills: cantidad de duelos que ganó que no fueron iniciados por él
   * 
   * Cantidad de deads: cantidad de duelos que perdió que no fueron iniciados por él
   * 
   * Assists: cantidad de duelos que empató (independientemente si los inició o no el jugador)
   * 
   * Ubicaciones usadas: de los duelos iniciados por el jugador
   * 
   * Mejor ubicación: ubicación con la que obtuvo la última victoria de duelos iniciados por el jugador
   * 
   * Calificación: última calificación obtenida por el personaje en un duelo iniciado por el jugador
   */
  public Integer actualizacionesDependientesDeLaPosicion(final Retador retador, final Duelo duelo, final Ubicacion ubi) {
    int _xifexpression = (int) 0;
    boolean _inicioElDuelo = this.inicioElDuelo(duelo);
    if (_inicioElDuelo) {
      EstadisticasPersonajes _estadisticas = this.estadisticas();
      List<Ubicacion> _ubicacionesUsadas = _estadisticas.getUbicacionesUsadas();
      _ubicacionesUsadas.add(null);
      EstadisticasPersonajes _estadisticas_1 = this.estadisticas();
      _estadisticas_1.setCalificacion(null);
    } else {
      EstadisticasPersonajes _estadisticas_2 = this.estadisticas();
      _xifexpression = _estadisticas_2.sumarDeads();
    }
    return Integer.valueOf(_xifexpression);
  }
  
  @Pure
  public Retador getParticipante() {
    return this.participante;
  }
  
  public void setParticipante(final Retador participante) {
    this.participante = participante;
  }
}
