package domain;

import domain.Ganador;
import domain.Jugador;
import domain.Perdedor;
import domain.Resultado;
import domain.Retador;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Derrota extends Resultado {
  private Ganador ganador;
  
  private Perdedor perdedor;
  
  public Derrota(final Ganador ganador, final Perdedor perdedor) {
    this.ganador = ganador;
    this.perdedor = perdedor;
  }
  
  public String nombreGanador() {
    Retador _participante = this.ganador.getParticipante();
    Jugador _jugador = _participante.getJugador();
    return _jugador.getNombre();
  }
  
  public String nombrePerdedor() {
    Retador _participante = this.perdedor.getParticipante();
    Jugador _jugador = _participante.getJugador();
    return _jugador.getNombre();
  }
  
  @Pure
  public Ganador getGanador() {
    return this.ganador;
  }
  
  public void setGanador(final Ganador ganador) {
    this.ganador = ganador;
  }
  
  @Pure
  public Perdedor getPerdedor() {
    return this.perdedor;
  }
  
  public void setPerdedor(final Perdedor perdedor) {
    this.perdedor = perdedor;
  }
}
