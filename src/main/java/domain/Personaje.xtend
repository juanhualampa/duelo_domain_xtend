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
	String source
	
	new(String nombre,List<String> especialidades, List<String> debilidades ,Ubicacion ubicacionIdeal){
		this.nombre = nombre
		this.debilidades = debilidades
		this.ubicacionIdeal = ubicacionIdeal
		this.especialidades = especialidades
	}
	
	new(Integer id,String nombre,List<String> especialidades, List<String> debilidades ,Ubicacion ubicacionIdeal){
		this.id = id
		this.nombre = nombre
		this.debilidades = debilidades
		this.ubicacionIdeal = ubicacionIdeal
		this.especialidades = especialidades
	}
	
	new(Integer id,String nombre,List<String> especialidades, List<String> debilidades ,Ubicacion ubicacionIdeal, String source){
		this.id = id
		this.nombre = nombre
		this.debilidades = debilidades
		this.ubicacionIdeal = ubicacionIdeal
		this.especialidades = especialidades
		this.source = source
	}
	
	def caracteristicas(){
		new Caracteristicas(especialidades,debilidades,String.valueOf(ubicacionIdeal).toLowerCase)
	}
	
	new() {	}
	
	override toString(){
		this.nombre
	}
	
	
	
}
