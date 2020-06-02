#ARREGLOS Y HASHES

#COMBINANDO 2 ARREGLOS EN UN HASH
nombres = ["Alumno1", "Alumno2", "Alumno3"]
notas = [10,3,8]

#FORMA 1= ITERANDO ARREGO CON ÍNDICE
# hash = {}
# nombres.count.times do |i|
#     element = nombres[i]
#     nota = notas[i]
#     hash[element] = nota
# end

# print hash

#FORMA 2= ITERANDO EL ARREGLO ELEMENTO A ELEMENTO
# hash = {}
# nombres.each do |nombre|
#     i = nombres.index(nombre) #obtenemos el índice
#     nota = notas[i]
#     hash[nombre] = nota
# end

# print hash

#FORMA 3= CON .ZIP

#nombres.zip(notas).to_h #return =>   {"Alumno1"=>10, "Alumno2"=>3, "Alumno3"=>8}

#FORMA 4= .GROUP_BY  => es un método de los arreglos que nos permite agrupar un conjunto de elementos bajo cualquier criterio. Entrega un hash con el resultado. Cada key del hash devuelto corresponde a un grupo y los valores son arrays con los elementos pertenecientes a cada grupo.

[1,2,3,4,5,6,7,8].group_by{|x| x.even?} #{false=>[1, 3, 5, 7], true=>[2, 4, 6, 8]}

[1,2,3,4,5,6,7,8].group_by{|x| x > 4} #{false=>[1, 2, 3, 4], true=>[5, 6, 7, 8]}

["hola", "a", "todos"].group_by{|x| x.length}  #{4=>["hola"], 1=>["a"], 5=>["todos"]}

[1,2,3,4,5,6,7,8].group_by{|x| x}  #{1=>[1], 2=>[2], 3=>[3], 4=>[4], 5=>[5], 6=>[6], 7=>[7], 8=>[8]}

["a", "ab", "abc", "b", "bc", "bcd"].group_by{|x| x[0]} #{"a"=>["a", "ab", "abc"], "b"=>["b", "bc", "bcd"]}

["a", 1, "b", 2, "c"].group_by{|x| x.class} #{String=>["a", "b", "c"], Integer=>[1, 2]}




