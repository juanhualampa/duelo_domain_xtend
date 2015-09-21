package appModels

import domain.Jugador
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import domain.Duelo
import domain.Motivo
import domain.AbusoDeHabilidad
import domain.ComunicacionAbusiva
import domain.FeedIntencional
import domain.Descripcion
import domain.Denuncia
import org.uqbar.commons.model.ObservableUtils

/**
 * Representa una denuncia en el contexto de la vista, agurpando:
 * el jugador denunciante, el denunciado, el motivo de la denuncia,
 *  el duelo al que corresponde la misma y la descripcion de la denuncia
 */
@Observable
@Accessors
class DenunciaAppModel {
	
	Jugador denunciante
	Jugador denunciado
	Motivo unMotivo
	Duelo duelo
	String palabrasDescripcion
	
	new(Duelo duelo) {
		this.duelo = duelo
		this.denunciante = duelo.retador.jugador
		this.denunciado = duelo.retado.jugador
		this.palabrasDescripcion = ""
	}
	
	def unaDescripcion(){
		new Descripcion(palabrasDescripcion)
	}
	
	def boolean isPuedeDenunciar(){
		tengoMotivo //&& !(palabrasDescripcion.isEmpty)
	}
	
	def tengoMotivo() {
		unMotivo != null
	}
	
	//selector de motivo:
	def setUnMotivo(Motivo motivo){
		unMotivo = motivo
		ObservableUtils.firePropertyChanged(this,"puedeDenunciar")
	}
	
	
	def setPalabrasDescripcion(String palabra){
		palabrasDescripcion = palabra
		cambioPuedeDenunciar
	}
	
	def cambioPuedeDenunciar() {
		ObservableUtils.firePropertyChanged(this,"puedeDenunciar")
	}
		
	def denuncia(){
		new Denuncia(duelo,unMotivo,unaDescripcion)
	}
	
	/**
	 * lista de motivos posibles de denuncia
	 */
	def motivosPosibles(){
		#[  new AbusoDeHabilidad, new ComunicacionAbusiva, new FeedIntencional ]
	}
	
	/**
	 * devuelve true o false dependiendo de si la denuncia es valida o no.
	 */
	def calcularValidez() {
		denuncia.calcularValidez
	}
	
	/**
	 * tras evaluar, efectiviza la denuncia
	 */
	def efectivizarDenuncia() {
		this.denuncia.castigar
	}
	
}