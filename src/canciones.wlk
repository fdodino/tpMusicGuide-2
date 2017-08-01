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
