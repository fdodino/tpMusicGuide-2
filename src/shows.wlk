/**
 * ***********************************************************
 * Lugares
 * ***********************************************************
 */
object lunaPark {
	method capacidad(fecha) = 9290
}

object laTrastienda {
	method capacidad(fecha) = 400 + self.capacidadAdicional(fecha)
	method capacidadAdicional(fecha) = if (fecha.dayOfWeek() == 6) 300 else 0
}

/**
 * ***********************************************************
 * Presentaciones
 * ***********************************************************
 */
class Presentacion {

	var fecha
	var musicos = []
	var lugar
	
	/**
	 * Métodos que trabajan sobre el estado de la presentación
	 */
	method fecha(_fecha) {
		fecha = _fecha
	}
	
	method lugar(_lugar) {
		lugar = _lugar
	}

	method agregarMusico(_musico) {
		musicos.add(_musico)
	} 
	
	method eliminarMusicos() {
		musicos.clear()
	}

	method fecha() = fecha
	
	/** Métodos de negocio */		
	method lugarConcurrido() = lugar.capacidad(fecha) > 5000
	method tocaSolo(musico) = [musico] == musicos
	method costo() = musicos.sum { musico =>
		musico.precioPorPresentacion(self)
	}

}

