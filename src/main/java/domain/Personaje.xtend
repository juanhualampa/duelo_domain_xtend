package domain

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Personaje {

	Integer calificacion
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
	
	
	
}
