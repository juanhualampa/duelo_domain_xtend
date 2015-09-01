package domain

/**
 * El jugador abusa del sistema de denuncias
 */
class AbusoDelSistemaDeDenuncias implements Motivo{
	
	override peso() {
		25
	}
	
	def sancionar(Denuncia denuncia) {
		
		println( "El jugador intenta denunciar a: <<denuncia.denunciado>> 
					por: <<denuncia.unMotivo>> sin tener una justificación suficiente: 
					<<denuncia.unaDescripcion>>")
	}
	
}