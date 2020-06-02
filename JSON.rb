#Este request es basntante genérico. Siempre que sea necesario request información de un sitio web podemos hacer esto. Lo único que habría que cambiar es la dirección de URL (url = URI("https://jsonplaceholder.typicode.com/posts")). Así que después lo vamos a convertir en un método. Para eso, voy a usar un nuevo archivo, llamado primer_request.rb

#Esto es importante, así quie lo voy a anotar aquí. Antes de cualquier cosa: cuand se habre Portman hay que paretar en el costado inferior derecho la etiqueta "Build", porque en otro caso, no se cacha nada de nada.
#Poner dirección de JSON en el campo de GET: https://jsonplaceholder.typicode.com/posts y apretar send.
#Apretar Code y elegir la opción de "Generated code for Ruby - Net::HTTP".
#Copiar el código para hacer el request. Pegarlo en VS (como está ab abajo)
#OJO: NO ME OCURRIÓ NINGÚN PROBLEMA CON EL HTTPS ¿?
#Se habre IRB y se copia el código. Va a aparecer una respuesta que indica si el código estuvo bien o hubo problemas: => #<Net::HTTPOK 200 OK readbody=true> (el 200 es el código e indica que el resquest estuvo bien).Códigos de respuesta: 200: ok | 401: Unauthorized | 403: Forbidden | 404: Not Found | 500: Server error (este último es el único que es error de otros, el servidor)

require "uri"
require "net/http"
require 'json'

url = URI("https://jsonplaceholder.typicode.com/posts")

https = Net::HTTP.new(url.host, url.port);
https.use_ssl = true

request = Net::HTTP::Get.new(url)
request["Cookie"] = "__cfduid=d7f86134963a1e2a362c6740fbf0e4d171590364505"

response = https.request(request) #cabecera con información general de cómo fue el proceso.
body = JSON.parse response.read_body 

body.each do |post|
    puts post['title']

end



#cuerpo => contiene todo el contenido que se devolvió. En este caso: response.read_body.class => String. Como es un String, no podemos saber directamente cuántos post hay. Para eso hay que: 1) "require 'json' de toda la respuesta y, luego, 2) JSON.parse response.read_body
#La respuesta a lo anterior va a ser una respuesta: un arreglo[] con varios hashes{}. Esto es nuestro nuevo body: 3) body = JSON.parse response.read_body. Ahora, si preguntamos qué hay dentro de body (body.class) la respuesta va a ser => Array.
#Si preguntamos qué hay en el idex 0 (body[0]) => {"userId"=>1, "id"=>1, "title"=>"sunt aut facere repellat provident occaecati excepturi optio reprehenderit", "body"=>"quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"}
#4)Para hacer esto fuera del ambiente IRB, en VS. Se cambia en la línea 20 "puts response.read_body" por body = JSON.parse response.read_body
#5) Se requiere a JSON (debajo de 'require "net/http"'') require 'json'
#Con esto se carga la información como un arreglo. Hay que iterarlo.
#6)Iterar el body: body.each do |post|