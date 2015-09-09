package domain;

import domain.Motivo;

/**
 * El jugador abusa del sistema de denuncias
 */
@SuppressWarnings("all")
public class AbusoDelSistemaDeDenuncias extends Motivo {
  @Override
  public Integer peso() {
    return Integer.valueOf(25);
  }
}
