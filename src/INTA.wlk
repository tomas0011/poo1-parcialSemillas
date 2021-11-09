object inta {
	const parcelas = #{}
	
	method promedioDePlantas() = parcelas.sum({ parcela => parcela.plantas().size() }) / parcelas.size()
	
	method masAutosustentable() {
		const conMasDe4Plantas = parcelas.filter({ parcela => parcela.plantas().size() > 4 })
		return conMasDe4Plantas.max({ parcela => {
			const filtradas = parcela.plantas().count({ planta => parcela.seAsociaBien(planta) })
			return filtradas.size()	
		}})
	}
}
