package domain;

import domain.Duelo;
import domain.EstadisticasPersonajes;
import domain.Personaje;
import domain.Retador;

@SuppressWarnings("all")
public class Empate {
  public Empate(final Duelo duelo) {
    Retador _retador = duelo.getRetador();
    Personaje _personaje = _retador.getPersonaje();
    EstadisticasPersonajes _estadistica = _personaje.getEstadistica();
    this.actualizar(_estadistica);
    Retador _retado = duelo.getRetado();
    Personaje _personaje_1 = _retado.getPersonaje();
    EstadisticasPersonajes _estadistica_1 = _personaje_1.getEstadistica();
    this.actualizar(_estadistica_1);
  }
  
  public void actualizar(final EstadisticasPersonajes estadistica) {
    estadistica.agregarUnaParticipacion();
    estadistica.agregarAssist();
  }
}
