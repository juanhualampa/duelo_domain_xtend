package duelos
import domain.Denuncia
/**
 * El jugador abusa del sistema de denuncias
 */
 
 //TODO:definir si es observable
class AbusoDelSistemaDeDenuncias extends Motivo{
	
	new() {
		super("Abuso del sistema de denuncias")
	}
	
	override void evaluarse(Denuncia denuncia){
      	denuncia.aplicarPenalidad(denuncia.contexto.retador)
    }
	
	override peso() {
		25
	}
	
//	def sancionar(Denuncia denuncia) {
//		
//		
//		
//		println( "El jugador intenta denunciar a: <<denuncia.denunciado>> 
//					por: <<denuncia.unMotivo>> sin tener una justificaci�n suficiente: 
//					<<denuncia.unaDescripcion>>")
//	}
	
	
	
}