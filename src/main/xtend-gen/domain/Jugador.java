package domain;

import domain.Denuncia;
import domain.Descripcion;
import domain.Duelo;
import domain.Motivo;
import domain.Personaje;
import domain.Retador;
import domain.Sistema;
import domain.Ubicacion;
import java.util.ArrayList;
import org.eclipse.xtend.lib.annotations.Accessors;
import org.eclipse.xtext.xbase.lib.CollectionLiterals;
import org.eclipse.xtext.xbase.lib.Functions.Function2;
import org.eclipse.xtext.xbase.lib.IterableExtensions;
import org.eclipse.xtext.xbase.lib.Pure;

@Accessors
@SuppressWarnings("all")
public class Jugador {
  private ArrayList<Personaje> personajes;
  
  private int cantDePeleasGanadas;
  
  private ArrayList<Denuncia> denuncias;
  
  private Integer ranking;
  
  private String nombre;
  
  private ArrayList<Duelo> duelos;
  
  public Jugador(final String Nombre) {
    ArrayList<Personaje> _newArrayList = CollectionLiterals.<Personaje>newArrayList();
    this.personajes = _newArrayList;
    this.cantDePeleasGanadas = 0;
    ArrayList<Denuncia> _newArrayList_1 = CollectionLiterals.<Denuncia>newArrayList();
    this.denuncias = _newArrayList_1;
    this.ranking = Integer.valueOf(0);
    ArrayList<Duelo> _newArrayList_2 = CollectionLiterals.<Duelo>newArrayList();
    this.duelos = _newArrayList_2;
    ArrayList<Denuncia> _newArrayList_3 = CollectionLiterals.<Denuncia>newArrayList();
    this.denuncias = _newArrayList_3;
    this.nombre = Nombre;
  }
  
  public boolean recibioDenuncia(final Denuncia denuncia) {
    return this.denuncias.add(denuncia);
  }
  
  public Integer pesoDeDenuncias() {
    final Function2<Integer, Denuncia, Integer> _function = (Integer a, Denuncia b) -> {
      Motivo _unMotivo = b.getUnMotivo();
      Integer _peso = _unMotivo.peso();
      return Integer.valueOf(((a).intValue() + (_peso).intValue()));
    };
    return IterableExtensions.<Denuncia, Integer>fold(this.denuncias, Integer.valueOf(0), _function);
  }
  
  public Integer promedioDeCalificacionesDePersonajes() {
    final Function2<Integer, Personaje, Integer> _function = (Integer a, Personaje b) -> {
      Integer _calificacion = b.getCalificacion();
      return Integer.valueOf(((a).intValue() + (_calificacion).intValue()));
    };
    return IterableExtensions.<Personaje, Integer>fold(this.personajes, Integer.valueOf(0), _function);
  }
  
  public Integer getRanking() {
    Integer _calificacion = this.calificacion();
    int _divide = ((_calificacion).intValue() / 500);
    return this.ranking = Integer.valueOf(_divide);
  }
  
  public Personaje personajeSeleccionado() {
    return this.personajes.get(0);
  }
  
  /**
   * da la orden de iniciar un duelo
   */
  public Object iniciarDuelo(final Sistema sist, final Ubicacion ubic) {
    Personaje _personajeSeleccionado = this.personajeSeleccionado();
    Retador _retador = new Retador(this, _personajeSeleccionado, ubic);
    return sist.iniciarReto(_retador);
  }
  
  public Integer calificacion() {
    Integer _promedioDeCalificacionesDePersonajes = this.promedioDeCalificacionesDePersonajes();
    Integer _pesoDeDenuncias = this.pesoDeDenuncias();
    int _minus = ((_promedioDeCalificacionesDePersonajes).intValue() - (_pesoDeDenuncias).intValue());
    return Integer.valueOf((_minus * this.cantDePeleasGanadas));
  }
  
  public void denunciarAJugador(final Sistema sist, final Jugador jug, final Motivo mot, final Descripcion desc) {
    Duelo _obtenerUltimoDueloContra = this.obtenerUltimoDueloContra(jug);
    Denuncia _denuncia = new Denuncia(_obtenerUltimoDueloContra, mot, desc);
    sist.denunciarJugador(_denuncia);
  }
  
  public Duelo obtenerUltimoDueloContra(final Jugador jugador) {
    int _lastIndexOf = this.duelos.lastIndexOf(jugador);
    return this.duelos.get(_lastIndexOf);
  }
  
  @Pure
  public ArrayList<Personaje> getPersonajes() {
    return this.personajes;
  }
  
  public void setPersonajes(final ArrayList<Personaje> personajes) {
    this.personajes = personajes;
  }
  
  @Pure
  public int getCantDePeleasGanadas() {
    return this.cantDePeleasGanadas;
  }
  
  public void setCantDePeleasGanadas(final int cantDePeleasGanadas) {
    this.cantDePeleasGanadas = cantDePeleasGanadas;
  }
  
  @Pure
  public ArrayList<Denuncia> getDenuncias() {
    return this.denuncias;
  }
  
  public void setDenuncias(final ArrayList<Denuncia> denuncias) {
    this.denuncias = denuncias;
  }
  
  public void setRanking(final Integer ranking) {
    this.ranking = ranking;
  }
  
  @Pure
  public String getNombre() {
    return this.nombre;
  }
  
  public void setNombre(final String nombre) {
    this.nombre = nombre;
  }
  
  @Pure
  public ArrayList<Duelo> getDuelos() {
    return this.duelos;
  }
  
  public void setDuelos(final ArrayList<Duelo> duelos) {
    this.duelos = duelos;
  }
}
