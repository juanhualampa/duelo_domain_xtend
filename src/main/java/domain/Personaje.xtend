package domain

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import org.uqbar.commons.utils.Observable
import org.uqbar.commons.model.Entity

@Observable
@Accessors
class Personaje  extends Entity {

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
	
	new() {	}
	
	override toString(){
		this.nombre
	}
	
	
	
}
