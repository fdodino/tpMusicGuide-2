import canciones.Album
import canciones.AlbumBuilder
import canciones.Cancion
import musicos.fender
import musicos.gibson
import musicos.luisAlberto
import musicos.Musico
import musicos.MusicoDeGrupo
import musicos.VocalistaPopular
import shows.laTrastienda
import shows.lunaPark
import shows.Presentacion

object fixtureEntrega {
 
// Canciones
	const laFamilia = new Cancion(264, "Quiero brindar por mi gente sencilla, por el amor brindo por la familia")
	const eres = new Cancion(145, "Eres lo mejor que me pasó en la vida, no tengo duda, no habrá más nada después de ti. Eres lo que le dio brillo al día a día, y así será por siempre, no cambiará, hasta el final de mis días.")
	const corazonAmericano = new Cancion(154, "Canta corazón, canta más alto, que tu pena al fin se va marchando, el nuevo milenio ha de encontrarnos, junto corazón, como soñamos.")
	const cisne = new Cancion(312, "Hoy el viento se abrió quedó vacío el aire una vez más y el manantial brotó y nadie está aquí y puedo ver que solo estallan las hojas al brillar")
	const almaDeDiamante = new Cancion(216, "Ven a mí con tu dulce luz alma de diamante. Y aunque el sol se nuble después sos alma de diamante. Cielo o piel silencio o verdad sos alma de diamante. Por eso ven así con la humanidad alma de diamante")
	const crisantemo = new Cancion(175, "Tócame junto a esta pared, yo quede por aquí... cuando no hubo más luz... quiero mirar a través de mi piel... Crisantemo, que se abrió... encuentra el camino hacia el cielo... ")
	
	// Albumes
	const albumLaFamilia = new AlbumBuilder("La Familia").fechaLanzamiento(17, 6, 1992).agregarCancion(laFamilia).unidadesLanzadas(100000).unidadesVendidas(89000).build()
	const albumLaSole = new AlbumBuilder("La Sole").fechaLanzamiento(4, 2, 2005).agregarCancion(eres).agregarCancion(corazonAmericano).unidadesLanzadas(200000).unidadesVendidas(130000).build()
	const paraLosArboles = new AlbumBuilder("Para los árboles").fechaLanzamiento(31, 3, 2003).agregarCancion(cisne).agregarCancion(almaDeDiamante).unidadesLanzadas(50000).unidadesVendidas(49000).build()
	const justCrisantemo = new AlbumBuilder("Just Crisantemo").fechaLanzamiento(5, 12, 2007).agregarCancion(crisantemo).unidadesLanzadas(28000).unidadesVendidas(27500).build()
 
	// Musicos
	const joaquin = new MusicoDeGrupo(20, 5) 
	const lucia = new VocalistaPopular(70, "familia") 
	const soledad =	new VocalistaPopular(55, "amor") 
	const kike = new MusicoDeGrupo(60, 20)

	// Presentaciones
 	const presentacionLunaPark = new Presentacion()
	const presentacionLaTrastienda = new Presentacion()

	method laFamilia() = laFamilia
	method eres() = eres
	method corazonAmericano() = corazonAmericano
	method cisne() = cisne
	method almaDeDiamante() = almaDeDiamante
	method crisantemo() = crisantemo
	method albumLaFamilia() = albumLaFamilia
	method albumLaSole() = albumLaSole
	method paraLosArboles() = paraLosArboles
	method justCrisantemo() = justCrisantemo
	method joaquin() {
		joaquin.grupo("Pimpinela")
		return joaquin
	}
	method lucia() {
		lucia.grupo("Pimpinela")
		return lucia
	}
	method soledad() = soledad
	method kike() = kike
	method presentacionLunaPark() {
		presentacionLunaPark.fecha(new Date(20, 4, 2017))
		presentacionLunaPark.lugar(lunaPark)
		presentacionLunaPark.agregarMusico(luisAlberto)
		presentacionLunaPark.agregarMusico(joaquin)
		presentacionLunaPark.agregarMusico(lucia)
		return presentacionLunaPark
	}
	method presentacionLaTrastienda() {
		presentacionLaTrastienda.fecha(new Date(15, 11, 2017))
		presentacionLaTrastienda.lugar(laTrastienda)
		presentacionLaTrastienda.agregarMusico(luisAlberto)
		presentacionLaTrastienda.agregarMusico(joaquin)
		presentacionLaTrastienda.agregarMusico(lucia)
		return presentacionLaTrastienda
	}
}