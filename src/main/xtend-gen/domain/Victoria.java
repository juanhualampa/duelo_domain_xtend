package domain;

import domain.Ganador;
import domain.Jugador;
import domain.Perdedor;
import domain.Resultado;
import domain.Retador;

@SuppressWarnings("all")
public class Victoria extends Resultado {
  private Ganador ganador;
  
  private Perdedor perdedor;
  
  public Victoria(final Ganador ganador, final Perdedor perdedor) {
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
}
