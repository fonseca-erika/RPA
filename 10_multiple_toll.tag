// This flow makes a search on qualp, 
// select the number of axis and clicks Avancar
// type the Origem and Destination fields and clicks Calcular

origem = []
destino = []
price = []
axles = []
csv_file = 'config.csv'
load '+csv_file+' to lines
 
array_lines = lines.split('\n')
 
for (n=1; n<array_lines.length; n++) 
{
	items = array_lines[n].split(',')
	origem[n] = items[0].trim()
	destino[n] = items[1].trim()
  
	http://qualp.com.br/
	click btn-avancar
	wait 3
	type origem as `origem[n]`
	type destino as `destino[n]`
	click btn-calcular
	wait 3
	read //*[@id="info-eixos"] to toll_axle
	read //*[@id="info-pedagio"] to toll_price
	
	price[n] = toll_price
	axles[n] = toll_axle
	
	write `origem[n]`; `destino[n]`; `price[n]`; `axles[n]` to price_list.csv
    
}