package domain

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Caracteristicas {	
	List<String> especialidades	
	List<String> debilidades	
	Ubicacion ubicacionIdeal
	
	new(List<String> especialidades, List<String> debilidades, Ubicacion ubicacionIdeal) {
		this.especialidades = especialidades
		this.debilidades = debilidades
		this.ubicacionIdeal = ubicacionIdeal
	}	
}