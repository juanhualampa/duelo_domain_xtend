package domain

/**
 * El jugador abusa del sistema de denuncias
 */
class AbusoDelSistemaDeDenuncias extends Motivo{
	
	override peso() {
		25
	}
	
	def sancionar(Denuncia denuncia) {
		
		println( "El jugador intenta denunciar a: <<denuncia.denunciado>> 
					por: <<denuncia.unMotivo>> sin tener una justificaci�n suficiente: 
					<<denuncia.unaDescripcion>>")
	}
	
	override aplicarPenalidadContraSiCorresponde(Retador retador, Retador retado) {
	}
	
	
	
}