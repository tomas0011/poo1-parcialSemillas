class Planta {
	var anoDeObtencion
	var property altura
	
	method horasDeSolTolera()
	
	method esFuerte() = self.horasDeSolTolera() > 10
	
	method daNuevasSemillas() = self.esFuerte()
	
	method espacio()
	
	method esParcelaIdeal(parcela)
}

class Menta inherits Planta {
	override method horasDeSolTolera() = 6
	
	override method daNuevasSemillas() = super() or altura > 0.4
	
	override method espacio() = altura * 3
	
	override method esParcelaIdeal(parcela) = parcela.superficie() > 6
}

class Soja inherits Planta {
	override method horasDeSolTolera() {
		var toleranciaSolar = 9
		if (altura < 0.5) {
			toleranciaSolar = 6
		} else if (altura.between(0.5, 1)) {
			toleranciaSolar = 7
		}
		return toleranciaSolar
	}
	
	override method daNuevasSemillas() = super() or (anoDeObtencion > 2007 and altura > 1)
	
	override method espacio() = altura / 2
	
	override method esParcelaIdeal(parcela) = parcela.horasDeSolQueRecibe() == self.horasDeSolTolera()
}

class Quinoa inherits Planta {
	var toleranciaSolar
	
	override method horasDeSolTolera() = toleranciaSolar
	
	override method daNuevasSemillas() = super() or anoDeObtencion < 2005
	
	override method espacio() = 0.5
	
	override method esParcelaIdeal(parcela) = parcela.plantas().all({ planta => planta.altura() <= 1.5 })
}


