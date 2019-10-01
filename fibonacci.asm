#Guillermo Alexis García Ramírez
#Tarea 6
.text
li $t0, 6 #variable n
li $v0, 0 #variable donde se guarda el resultado final/acumulador
main:

	jal fibonacci #se llama la funcion
	j exit #termina programa
	
fibonacci:
	addi $sp, $sp, -8 # reservamos memoria
	sw $t0, 0($sp) # se guarda la dirección del ultimo llamado 
	sw $ra, 4($sp) # se guarda el valor n
	
	blt $t0, 2, casoBase # si n es menor a 2 se devuelve n
	
	addi $t0, $t0, -1 # restamos 1 para n-1
	jal fibonacci #recursividad
	addi $t0, $t0, -1 #restamos de nuevo para n-2
	jal fibonacci # recursividad
	j endFib #termina ejecucion de funcion
endFib:
	lw $t0, 0($sp) #se carga el nuevo valor para t0
	lw $ra, 4($sp) #se carga la dirección del ultimo llamado a función
	addi $sp, $sp, 8 #restauramos la pila
	jr $ra #salta al ultimo llamado de funcion

casoBase:
	add $v0, $v0, $t0 #se acumulan los valores de n
	j endFib #termina ejecucion de funcion

exit: