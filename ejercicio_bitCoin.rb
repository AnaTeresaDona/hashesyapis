#Se pide obtener los precios y fechas del último período y a partir de estos obtener un arreglo de todas las fechas donde el valor ha sido menor a 5000 USD
#1) Hacer request a la API de coindesk y objeter los resultados.
#2) Procesar los resultados para obtener un arreglo con las fechas.

require "uri"
require "net/http"
require 'json'

url = URI("https://api.coindesk.com/v1/bpi/historical/close.json")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)

response = https.request(request)
response.read_body

body = JSON.parse response.read_body 

#Pedir el hash cuya llave es "bpi"
valores = body["bpi"]

#OPCIÓN DE RESPUESTA 1
# def valores_seleccionados(hash, monto = 5000)
#     hash.select{|k,v| v < monto}
# end
# print valores_seleccionados(valores, 9000)

#OPCIÓN DE RESPUESTA 2
under_8500 = valores.values.select{|x| x < 8500}
dates = under_8500.map{|x| valores.invert[x]}
print dates