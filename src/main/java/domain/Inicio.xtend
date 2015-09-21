package domain

/**
 * clase abstracta que define la actualizacio de estadisticas dependiendo si es iniciador o no iniciador del duelo
 */
abstract class Inicio {
	
	def void actualizarEstadisticas(Retador ret)
	
	def String aString()
	
}