import emociones.*
import individuos.*

class Evento{
	const property nombre
	const property colorEmocional
	const property impacto
	const property individuos = #{}
	
	method transferirA(unIndividuo){
		if (individuos.contains(unIndividuo)){
			self.error("El evento ya fue transferido")
		}else{
			individuos.add(unIndividuo)
			unIndividuo.registrarEvento(self)
		}
	}
	
}