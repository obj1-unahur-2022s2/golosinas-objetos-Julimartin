object mariano {

	var golosinas = []
	var golosinasDesechadas = []
	
	method comprar(unaGolosina) {golosinas.add(unaGolosina)}
	method comprarVarias(lista) {golosinas.addAll(lista)}
	method vaciarBolsa() { golosinas.clear() }
	method desechar(unaGolosina) {golosinas.remove(unaGolosina); golosinasDesechadas.add(unaGolosina)} 
	method cantidadDeGolosinas() = golosinas.size()
	method tieneLaGolosina(unaGolosina) = golosinas.contains(unaGolosina)
	method probarGolosinas() { 
		golosinas.forEach({g => g.mordisco()})
	}
	
	method hayGolosinaSinTACC() = golosinas.any({g => g.libreDeGluten()})
	//hayGolosinaSinTACCconall() = not golosinas.all({g => g.libreDeGluten()})
	
	method preciosCuidados() = golosinas.all({g => g.precio() <= 10})
	
	method golosinaDeSabor(unSabor) = golosinas.find({ g => g.gusto() == unSabor})
	method golosinasDeSabor(unSabor) = golosinas.filter({g => g.gusto() == unSabor})
	method sabores() = golosinas.map({g => g.gusto()}).asSet() //.asSet transforma la lista a conjunto
	method golosinaMasCara() = golosinas.max({g => g.precio()})
	method precioGolosinaMasCara() = self.golosinaMasCara().precio()
	// precioGolosinaMasCara() = golosinas.map({g => g.precio()}).max
	method pesoGolosinas() = golosinas.sum({g => g.peso()})
	
	method golosinasFaltantes(golosinasDeseadas) = golosinasDeseadas.asSet().difference(golosinas.asSet())
	method gustosFaltantes(gustosDeseados) = gustosDeseados.asSet().difference(self.sabores())
	
	//metodos desafio
	
	method gastoEn(sabor) = self.golosinaDeSabor(sabor).sum({g => g.precio()})
	
	method cantidadDeGolosinasDeUnSabor(unSabor) = self.golosinasDeSabor(unSabor).size()	
	method saborMasPopular() = self.sabores().max({sabor => self.cantidadDeGolosinasDeUnSabor(sabor)})
	
	method comproYDesecho(golosina) = golosinasDesechadas.contains(golosina)
}

