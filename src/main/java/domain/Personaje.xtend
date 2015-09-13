package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random

@Accessors
class Personaje {

	EstadisticasPersonajes estadistica
	Ubicacion ubicacionIdeal
	String especialidades
	String debilidades
	String nombre
	
	new(String nombre,String especialidades, String debilidades ,Ubicacion ubicacionIdeal){
		this.nombre = nombre
		this.debilidades = debilidades
		this.ubicacionIdeal = ubicacionIdeal
		this.especialidades = especialidades
		estadistica = new EstadisticasPersonajes()
	}
	
	def Integer poderDeAtaque() 
	{
		estadistica.poderDeAtaque() //* new Random().nextInt(1)
	}
	
	
	def setCalificacion(Calificacion cal){
		estadistica.calificacion = cal
	}
	def calificacion(){
		estadistica.calificacion
	}
	
	
	
}
