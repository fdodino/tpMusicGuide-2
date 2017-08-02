/**
 * ***********************************************************
 * Músicos - hay un poco de repetición de código
 * ***********************************************************
 */
class Musico {
	var habilidad
	var grupo
	const albumesPublicados = []
	
	constructor(_habilidad){
		habilidad = _habilidad 
	}
	
	method tocaEnGrupo() = grupo !== null // o pueden crear un objeto nothing
	
	method grupo(_grupo) {
		grupo = _grupo
	}
	
	method solista() {
		grupo = null 
	}

	method publicarAlbum(album) { albumesPublicados.add(album) }
	
	// ENTREGA 2 - Punto 1
	method canciones() = albumesPublicados.flatMap({album => album.cancion() })
	method esMinimalista() = self.canciones().all { cancion => cancion.esCorta() }
	
	// ENTREGA 2 - Punto 2
	method cancionesConPalabra(palabra) = self.canciones().filter { cancion => cancion.tienePalabra(palabra) }
	
	// ENTREGA 2 - Punto 3
	method duracionObra() = self.canciones().sum { cancion => cancion.duracion() }
	
	// ENTREGA 2 - Punto 5
	method laPego() = albumesPublicados.all { album => album.tieneBuenaVenta() }
}

class MusicoDeGrupo inherits Musico {
	
	var plusPorTocarEnGrupo
	
	constructor(_habilidad, _plusPorTocarEnGrupo) = super(_habilidad) {
		plusPorTocarEnGrupo = _plusPorTocarEnGrupo
	}
	
	method habilidadAdquirida() = if (self.tocaEnGrupo()) plusPorTocarEnGrupo else 0 
	method habilidad() = habilidad + self.habilidadAdquirida()
	method interpretaBien(cancion) = cancion.duracion() > 300
	method precioPorPresentacion(presentacion) = if (!presentacion.tocaSolo(self)) 50 else 100
	
}

class VocalistaPopular inherits Musico {
	
	var palabraFavorita
	
	constructor(_habilidad, _palabraFavorita) = super(_habilidad) {
		palabraFavorita = _palabraFavorita
	}
	
	method habilidad() = habilidad - self.descuentoHabilidad()
	method descuentoHabilidad() = if (self.tocaEnGrupo()) 20 else 0
	method interpretaBien(cancion) = cancion.tienePalabra(palabraFavorita)
	method precioPorPresentacion(presentacion) = if (presentacion.lugarConcurrido()) 500 else 400
	
}

object luisAlberto {
	var instrumento = fender
	method cambiarInstrumento(_instrumento) {
		instrumento = _instrumento
	}
	method habilidad() = (8 * instrumento.valor()).min(100)
	method interpretaBien(cancion) = true
	method precioPorPresentacion(presentacion) = if (presentacion.fecha() < new Date(1,9,2017)) 1000 else 1200
}

/**
 * ***********************************************************
 * Instrumentos
 * ***********************************************************
 */

object fender {
	method valor() = 10
}

object gibson {
	var sana = true
	
	method valor() = if (sana) 15 else 5
	
	method tratarMal() {
		sana = false
	}
}

/**
 * ***********************************************************
 * Canciones y álbumes
 * ***********************************************************
 */
class Cancion {
	var duracion
	var letra
	
	constructor(_duracion, _letra) {
		duracion = _duracion
		letra = _letra	
	}
	
	method duracion() = duracion
	method palabras() = letra.split(" ")
	method tamanio() = self.palabras().size()
	method tienePalabra(palabra) = self.palabras().contains(palabra)
	method esCorta() = duracion < 180
}

class Album {
	const titulo
	const canciones
	var fechaLanzamiento
	var unidadesLanzadas
	var unidadesVendidas
	
	constructor(_titulo) {
		titulo = _titulo
		canciones = []
	}
	
	method agregarCancion(cancion) { canciones.add(cancion) }
	method fechaLanzamiento(_fechaLanzamiento) { fechaLanzamiento = _fechaLanzamiento }
	method unidadesLanzadas(_unidadesLanzadas) { unidadesLanzadas = _unidadesLanzadas }
	method unidadesVendidas(_unidadesVendidas) { unidadesVendidas = _unidadesVendidas }
	method canciones() = canciones

	// ENTREGA 2 - Punto 4
	method cancionMasLarga() = canciones.max { cancion => cancion.tamanio() }

	// ENTREGA 2 - Punto 5
	method tieneBuenaVenta() = (unidadesVendidas / unidadesLanzadas) > 0.75		
}

class AlbumBuilder {
	const album

	constructor(titulo) {
		album = new Album(titulo)
	}

	method fechaLanzamiento(dia, mes, anio) {
		album.fechaLanzamiento(new Date(dia, mes, anio))
		return self
	}

	method agregarCancion(cancion) {
		album.agregarCancion(cancion)
		return self
	}

	method unidadesLanzadas(unidades) {
		album.unidadesLanzadas(unidades)
		return self
	}

	method unidadesVendidas(unidades) {
		album.unidadesVendidas(unidades)
		return self
	}

	method build() {
		if (album.canciones().isEmpty()) {
			throw new Exception("El album no puede estar vacío")
		} return album
	}
}

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

