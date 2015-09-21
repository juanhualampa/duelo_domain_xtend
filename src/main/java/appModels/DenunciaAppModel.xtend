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

@Observable
@Accessors
class DenunciaAppModel {
	
	Jugador denunciante
	Jugador denunciado
	//String motivo
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
		tengoMotivo && !(palabrasDescripcion.isEmpty)
	}
	
	def tengoMotivo() {
		unMotivo != null
	}
	
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
	
	def motivosPosibles(){
		#[  new AbusoDeHabilidad, new ComunicacionAbusiva, new FeedIntencional ]
	}
	
	def calcularValidez() {
		denuncia.calcularValidez
	}
	
}