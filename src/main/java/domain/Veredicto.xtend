package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Veredicto {
	
	Retador participante
	Duelo duelo
	
	new(Retador participante, Duelo duelo) {
		this.participante = participante
		this.duelo = duelo
	}
	
	def estadisticas(){
		this.participante.personaje.estadistica
	}
	
	def actualizarEstadisticas() {
		estadisticas.actualizar()
	}
	def void actualizar(EstadisticasPersonajes estadistica)
		
	def actualizacionesDependientesDeLaPosicion(Retador retador) {
		print(retador.inicio.toString())
		retador.inicio.actualizarA(this)
	}
}