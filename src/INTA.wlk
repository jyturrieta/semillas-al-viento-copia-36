import plantas.*
import parcelas.*

object inta 
{
	var property parcelas = #{}
	
	method promedio()
	{
		return parcelas.sum({parcela => parcela.cantidadDePlantas()}) / parcelas.size()
	}	
		
	method parcelasConMasDe4()
	{
		return parcelas.filter({parcela => parcela.cantidadDePlantas() > 4})
	}
	
	method porcentajesDeLasDeMasDe4()
	{
		return self.parcelasConMasDe4().map({parcela => parcela.porcentajeDeBienAsociadas()})
	}
	
	method masAutosustentable()
	{
		return self.porcentajesDeLasDeMasDe4().max()
	}
}

