package domain

/**
 * El jugador abusa del sistema de denuncias
 */
 
 //TODO:definir si es observable
class AbusoDelSistemaDeDenuncias extends Motivo{
	
	new() {
		super("Abuso del sistema de denuncias")
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