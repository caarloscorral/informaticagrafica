** La escena del museo se compone de los siguientes objetos:
    - La habitación
    - Banco
    - Separadores
    - Stands 
    - Esponja de Menger
    - Árbol fractal
    - Fractal de Julia

** De los objetos no fractales, quitando el banco, que esta sacado de internet, el resto está implementado integramente
por nosotros.

** Esponja de Menger
    - Se ha obtenido de internet. Lo que se ha hecho ha sido modificar sus parámetros y texturas hasta
    encontrar unos que diesen al objeto la forma deseada.

** Fractal de Julia
    - Se ha desarrollado con la función que hay en Pov-Ray. De nuevo, se han ido probando parámetros y texturas
    para obtener el objeto deseado.

** Árbol fractal
    - Ha sido desarrollado integramente por nosotros desde cero. 
    - La implementacion consiste en tres partes:
        - Expandir la gramática de manera automática según las iteraciones deseadas.
        - Crear un array que actua como "stack" para guardar información en las ramificaciones.
        - Dibujar la gramática
    - La gramática utilizada ha sido:
        Axioma: F
        F->F[+F]F[-F][F]
    - Para su desarrollo se han consultado las siguientes fuentes:
        - http://paulbourke.net/fractals/lsys/
        - http://algorithmicbotany.org/papers/abop/abop-ch1.pdf (Capitulos 1.3 y 1.6 principalmente)
