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

