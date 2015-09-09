package domain;

import domain.Denuncia;
import domain.Duelo;
import domain.Jugador;
import domain.Retador;

@SuppressWarnings("all")
public abstract class Motivo {
  public abstract Integer peso();
  
  public void evaluarse(final Denuncia denuncia, final Duelo duelo) {
    Retador _retado = duelo.getRetado();
    this.aplicarPenalidad(_retado, denuncia);
  }
  
  public void aplicarPenalidad(final Retador contrincante, final Denuncia denuncia) {
    Jugador _jugador = contrincante.getJugador();
    _jugador.recibioDenuncia(denuncia);
  }
}
