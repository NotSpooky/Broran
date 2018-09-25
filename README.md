Creado con Godot 1.2.15. El cual trae su propio IDE con el que interpreta correctamente los archivos .gd

# Diccionario virtual con audios y juego sobre los animales del Br̈orá̈n.

Permite exportarse para todas las plataformas de destino de Godot.

Para escribir letras con tanto diéresis como tilde, se modificó la fuente y se sustituyeron las letras con acento grave, pues Godot no renderiza correctamente esos caracteres de combinación. Agregué también a la fuente letras con subrayado para poderlas mostrar en los botones ya que estos no aceptan Rich Text.

El script principal es inicio.gd, en el cual se pueden agregar nuevas imágenes y títulos modificando el arreglo 'botones', cada subarreglo corresponde a una página.

Para subrayados se utiliza [u] y [/u], cuando hay varios puede que sea necesario [s] y [/s] en uno de los dos subrayados para evitar bugs al mostrarlos en pantalla.
