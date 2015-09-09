package domain;

import domain.Motivo;

/**
 * El contrincante abusa y tiene malos tratos con nosotros
 */
@SuppressWarnings("all")
public class ComunicacionAbusiva extends Motivo {
  @Override
  public Integer peso() {
    return Integer.valueOf(7);
  }
}
