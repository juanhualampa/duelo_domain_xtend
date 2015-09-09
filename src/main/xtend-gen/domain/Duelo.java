package domain;

import domain.Derrota;
import domain.Empatados;
import domain.Empate;
import domain.EstadisticasPersonajes;
import domain.Ganador;
import domain.Jugador;
import domain.Perdedor;
import domain.Personaje;
import domain.Resultado;
import domain.Retador;
import domain.Sistema;
import domain.Victoria;
import java.util.ArrayList;
import java.util.Random;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Duelo {
  private Retador retador;
  
  private Retador retado;
  
  private Resultado resultado;
  
  private Sistema sistema;
  
  public Duelo(final Retador ret1, final Retador ret2) {
    this.retador = ret1;
    this.retado = ret2;
    this.realizarse();
  }
  
  public Duelo(final Sistema sis, final Retador ret1, final Retador ret2) {
    this.retador = ret1;
    this.retado = ret2;
    this.sistema = sis;
  }
  
  public Integer poderDeAtaque(final EstadisticasPersonajes est) {
    Integer _calificacion = est.getCalificacion();
    int _vecesKills = est.getVecesKills();
    int _vecesAssist = est.getVecesAssist();
    int _divide = (_vecesAssist / 2);
    int _plus = (_vecesKills + _divide);
    int _vecesDeads = est.getVecesDeads();
    int _minus = (_plus - _vecesDeads);
    int _vecesUsadoAntesDelDuelo = est.getVecesUsadoAntesDelDuelo();
    int _multiply = (_minus * _vecesUsadoAntesDelDuelo);
    int _plus_1 = ((_calificacion).intValue() + _multiply);
    Random _random = new Random();
    int _nextInt = _random.nextInt(1);
    return Integer.valueOf((_plus_1 * _nextInt));
  }
  
  public Integer poder(final Retador ret) {
    Personaje _personaje = ret.getPersonaje();
    EstadisticasPersonajes _estadistica = _personaje.getEstadistica();
    return this.poderDeAtaque(_estadistica);
  }
  
  public boolean esMasPoderoso(final Retador ret1, final Retador ret2) {
    Integer _poder = this.poder(ret1);
    Integer _poder_1 = this.poder(ret2);
    return (_poder.compareTo(_poder_1) > 0);
  }
  
  public void realizarse() {
    boolean _esMasPoderoso = this.esMasPoderoso(this.retador, this.retado);
    if (_esMasPoderoso) {
      Ganador _ganador = new Ganador(this.retador, this);
      Perdedor _perdedor = new Perdedor(this.retado, this);
      Victoria _victoria = new Victoria(_ganador, _perdedor);
      this.resultado = _victoria;
    }
    boolean _esMasPoderoso_1 = this.esMasPoderoso(this.retado, this.retador);
    if (_esMasPoderoso_1) {
      Ganador _ganador_1 = new Ganador(this.retado, this);
      Perdedor _perdedor_1 = new Perdedor(this.retador, this);
      Derrota _derrota = new Derrota(_ganador_1, _perdedor_1);
      this.resultado = _derrota;
    } else {
      Empate _empate = new Empate(this);
      Empatados _empatados = new Empatados(_empate);
      this.resultado = _empatados;
    }
    Jugador _jugador = this.retador.getJugador();
    ArrayList<Duelo> _duelos = _jugador.getDuelos();
    _duelos.add(this);
    Jugador _jugador_1 = this.retado.getJugador();
    ArrayList<Duelo> _duelos_1 = _jugador_1.getDuelos();
    _duelos_1.add(this);
  }
  
  @Pure
  public Retador getRetador() {
    return this.retador;
  }
  
  public void setRetador(final Retador retador) {
    this.retador = retador;
  }
  
  @Pure
  public Retador getRetado() {
    return this.retado;
  }
  
  public void setRetado(final Retador retado) {
    this.retado = retado;
  }
  
  @Pure
  public Resultado getResultado() {
    return this.resultado;
  }
  
  public void setResultado(final Resultado resultado) {
    this.resultado = resultado;
  }
  
  @Pure
  public Sistema getSistema() {
    return this.sistema;
  }
  
  public void setSistema(final Sistema sistema) {
    this.sistema = sistema;
  }
}
