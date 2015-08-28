package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random

@Accessors
class Duelo {
	
	Sistema sistema			
	Retador retador	
	Retador retado	
	Ubicacion ubicacionRetador	
	Ubicacion ubicacionRetado
	
	
	new(Sistema sistema, Retador ret1 , Ubicacion u1, Retador ret2 ,  Ubicacion u2 )
	{
		this.sistema = sistema
		this.retador = ret1
		this.retado = ret2
		this.ubicacionRetador = u1
		this.ubicacionRetado = u2
	}
	
	def Integer poderDeAtaque(EstadisticaJugadorPersonaje est) 
	{
		(est.calificacion + (est.vecesKills + est.vecesAssist / 2 - est.vecesDeads) *
		est.vecesUsadoAntesDelDuelo) * new Random().nextInt(1)
	}	
	
	def Integer poder(Retador ret){
		poderDeAtaque(sistema.obtenerEstadistica(ret))
	}
	
	def esMasPoderoso(Retador ret1, Retador ret2){
		poder(ret1) > poder(ret2)
	}
	
	def void realizarse(){
		/*
		 * mejor poder de ataque * un factor de suerte (un random entre 0 y 1)
		 * 
		 * 
		 */
//		 if (esMasPoderoso(this.retador,this.retado)){
//			ganador = this.retador
//		 	perdedor = this.retado
//		 }
//		 else{
//		 	ganador = this.retado
//		 	perdedor = this.retador
//		 	
//		 }
	
		 
		 this.sistema.actualizarEstadisticas(this.retador,this.ubicacionRetador)
		 this.sistema.actualizarEstadisticas(this.retado,this.ubicacionRetado)
		 
	}
	
	
	
}