package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Personaje {

	Ubicacion ubicacionIdeal
	List<String> especialidades
	List<String> debilidades
	String nombre
	
	new(String nombre,List<String> especialidades, List<String> debilidades ,Ubicacion ubicacionIdeal){
		this.nombre = nombre
		this.debilidades = debilidades
		this.ubicacionIdeal = ubicacionIdeal
		this.especialidades = especialidades
	}
	
	override toString(){
		this.nombre
	}
	
	
	
}
