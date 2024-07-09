import emociones.*

class Individuo{
	const property emociones = []
	var edad
	const property eventos = []
	
	method edad() = edad
	
	method esAdolescente() = self.edad().between(12,18)
	
	method estaPorExplotar() = emociones.all({ e => e.puedeLiberarse() })
	
	method deltaEmocional() = self.emocionMaxima() - self.emocionMinima()
	
	method emocionMaxima() = emociones.max({ e => e.intensidad() }).intensidad()
	
	method emocionMinima() = emociones.min({ e => e.intensidad() }).intensidad()
	
	method mapaCromatico(){
		const coloresDeEmociones = #{}
		coloresDeEmociones.addAll(emociones.map({e => e.color()}))
		return (coloresDeEmociones)
	}

	method energiaEmocional() = self.emocionesPromedio().sum({ e => e.intensidad() })
	
	method emocionesPromedio() = emociones.filter({ e => e.esEmocionPromedio() })
	
	method expresarEmociones(){
		emociones.forEach({ e => e.expresarEmocion() })
	}
	
	//PARTE 3
	method registrarEvento(unEvento){
		eventos.add(unEvento)
	}
	
	method procesar(unEvento){
		var emocionesCoincidentes = emociones.filter({ e => e.color() == unEvento.colorEmocional()})
		emocionesCoincidentes.forEach({ e => e.efecto(unEvento)})
	}
	
	method procesarEventos(){
		eventos.forEach({ e => self.procesar(e)})
		eventos.clear()
	}
	
}