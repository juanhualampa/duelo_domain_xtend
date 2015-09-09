package domain;

import domain.Motivo;

/**
 * el contrincante se esta dejando ganar y no presenta ningun desafio
 */
@SuppressWarnings("all")
public class FeedIntencional extends Motivo {
  @Override
  public Integer peso() {
    return Integer.valueOf(10);
  }
}
