import Plantas.*

class SojaTransgenica inherits Soja {
	override method daNuevasSemillas() = false
	
	override method esParcelaIdeal(parcela) = parcela.cantidadMaximaDePlantas() == 1
}

class HierbaBuena inherits Menta {
	override method espacio() = super() * 2
}
