package appModels

import retador.Retador
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import domain.Juego

@Accessors
@Observable
class MrxAppModel {
	
	Retador retador	
	Juego sistema
	
	new(Retador retador, Juego sis) {
		this.retador = retador
		this.sistema = sis
	}
		
	def realizarDuelo() {
		sistema.realizarDuelo(retador,mrX)
	}
	
	def mrX() {
		sistema.dameAMRX(this.retador)
	}
	
}