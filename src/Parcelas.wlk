

class Parcela {
	var ancho
	var largo
	var horasDeSolQueRecibe
	const plantas = []
	
	method plantas() = plantas
	
	method horasDeSolQueRecibe() = horasDeSolQueRecibe 
	
	method superficie() = ancho * largo
	
	method cantidadMaximaDePlantas() {
		var cantidadMaxima = (self.superficie() / 3) + largo
		if (ancho > largo) {
			cantidadMaxima = self.superficie() / 5
		}
		return cantidadMaxima
	}
	
	method tieneComplicaciones() = plantas.any({ planta => horasDeSolQueRecibe > planta.horasDeSolTolera() })
	
	method sePuedePlantar(planta) {
		return (
			(plantas.size() + 1 <= self.cantidadMaximaDePlantas()) 
			and ((horasDeSolQueRecibe - planta.horasDeSolTolera()) < 2)
		)
	} 
	
	method plantarUnaPlanta(planta) {
		if (self.sePuedePlantar(planta)) {
			plantas.add(planta)
		} else {
			self.error("No se puede plantar la planta")
		}
	}
	
	method seAsociaBien(planta) = true
}

class ParcelaEcologica inherits Parcela {
	override method seAsociaBien(planta) = not self.tieneComplicaciones() and planta.esParcelaIdeal(self)
}

class ParcelaIndustrial inherits Parcela {
	override method seAsociaBien(planta) = self.plantas().size() + 1 <= 2 and planta.esFuerte()
}
