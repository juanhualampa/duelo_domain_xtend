package domain;

import com.google.common.base.Objects;
import domain.Denuncia;
import domain.Duelo;
import domain.Jugador;
import domain.Personaje;
import domain.Retador;
import domain.Ubicacion;
import java.util.List;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function1;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Sistema {
  private List<Jugador> jugadores = CollectionLiterals.<Jugador>newArrayList();
  
  /**
   * Toma un retador y una ubicacion y le busca un contrincante de su nivel
   */
  public Object iniciarReto(final Retador retador) {
    Object _xifexpression = null;
    boolean _noHayOponente = this.noHayOponente(retador);
    if (_noHayOponente) {
      _xifexpression = null;
    } else {
      Retador _obtenerOponente = this.obtenerOponente(retador);
      this.realizarDuelo(retador, _obtenerOponente);
    }
    return _xifexpression;
  }
  
  public Retador obtenerOponente(final Retador retador) {
    Retador _xblockexpression = null;
    {
      List<Jugador> _buscarOponente = this.buscarOponente(retador);
      final Jugador contrincante = IterableExtensions.<Jugador>head(_buscarOponente);
      Personaje _personajeSeleccionado = contrincante.personajeSeleccionado();
      _xblockexpression = new Retador(contrincante, _personajeSeleccionado, Ubicacion.BOTTOM);
    }
    return _xblockexpression;
  }
  
  public boolean noHayOponente(final Retador retador) {
    List<Jugador> _buscarOponente = this.buscarOponente(retador);
    return _buscarOponente.isEmpty();
  }
  
  public List<Jugador> buscarOponente(final Retador retador) {
    final Function1<Jugador, Boolean> _function = (Jugador it) -> {
      boolean _and = false;
      Integer _ranking = it.getRanking();
      Jugador _jugador = retador.getJugador();
      Integer _ranking_1 = _jugador.getRanking();
      boolean _equals = _ranking.equals(_ranking_1);
      if (!_equals) {
        _and = false;
      } else {
        String _nombre = it.getNombre();
        Jugador _jugador_1 = retador.getJugador();
        String _nombre_1 = _jugador_1.getNombre();
        boolean _notEquals = (!Objects.equal(_nombre, _nombre_1));
        _and = _notEquals;
      }
      return Boolean.valueOf(_and);
    };
    Iterable<Jugador> _filter = IterableExtensions.<Jugador>filter(this.jugadores, _function);
    return IterableExtensions.<Jugador>toList(_filter);
  }
  
  public void realizarDuelo(final Retador ret1, final Retador ret2) {
    new Duelo(ret1, ret2);
  }
  
  public void denunciarJugador(final Denuncia denuncia) {
    denuncia.castigar();
  }
  
  @Pure
  public List<Jugador> getJugadores() {
    return this.jugadores;
  }
  
  public void setJugadores(final List<Jugador> jugadores) {
    this.jugadores = jugadores;
  }
}
