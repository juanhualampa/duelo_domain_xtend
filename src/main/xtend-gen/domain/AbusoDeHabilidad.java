package domain;

import domain.Motivo;

/**
 * el contrincante es ampliamente superior en todos los aspectos y no hay chances de ganarle
 */
@SuppressWarnings("all")
public class AbusoDeHabilidad extends Motivo {
  @Override
  public Integer peso() {
    return Integer.valueOf(5);
  }
}
