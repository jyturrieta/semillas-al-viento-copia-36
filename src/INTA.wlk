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
	
	method parcelaMasAutosustentable()
	{
		return self.parcelasConMasDe4().max({parcela => parcela.porcentajeDeBienAsociadas()})
	}
}
