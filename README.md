

# Documentación Respectiva
## Isaac Mena López - 2016130651 }
### March 2019


### 1. **Introducción**

### 1.1 **Requerimientos funcionales:**
   - Programar en ensamblador el booteo desde una unidad de USB
   - Una vez que bootee desde el USB, cargará única y exclusivamente un programa
    llamado: Frogger

### 1.2 Especificaciones del **Frogger**:
  - El juego Frogger consiste en una rana que trata de pasar por al menos 3 calles, ya sean estas que circulen         automóviles, busetas o camiones.
  - Los automóviles corresponden a largo 1.
  - Las busetas corresponden a largo 2.
  - Los camiones corresponden a largo 3.
  - Si un vehı́culo colisiona con la rana que circula de abajo hacia arriba, el jugador pierde.
  - Si logra pasar por todos los carriles sin que sea colisionado, el jugador gana el juego.

### 1.3 **Requerimientos técnicos:**
  - El desarrollo se debe de realizar utilizando el lenguaje de programación Ensamblador para x86.
  - Se utilizará EFI como mecanismo de booteo.

### 2. **Ambiente de desarrollo**
Las herramientas utilizadas para la implementación del proyecto fueron las siguientes:
  - Laptop Acer-Aspire-RT.
  - Sistema Operativo Ubuntu 18.04 LTS.
  - Atom 1.29 como editor de texto.
  - Fasm como compilador de *assemblyx86*.
  - Oracle VirtualBox Manager 5.2.26 para pruebas.
  - Biblioteca *uefi.inc* para importación de headers.

### 4. **Estructuras de datos usadas y funciones**
Se utilizó una única estructura de datos con la cual se representaron los carrilles y las dos aceras de inicio y fin. Se puede ver como una matriz de 5x35.
Las funciones(subrutinas en este caso) principales del programa son las siguientes:

  - Las funciones de I/O del archivo \textit{uefi.inc} que permiten usar el SystemTable de este sistema de arranque para imprimir datos en pantalla y obtener datos por teclado.
      - ReadKeyStroke: Esta función lee el golpe de una tecla y lo almacena para identificarla posteriormente.
      - OuputString: Esta función se utiliza para escribir en pantalla.
      - ClearScreen: Esta función se utiliza para limpiar la pantalla.
      - Reset: Esta función limia el buffer de entrada (Input).
- ShowBoard: Esta función imprimie el tablero en pantalla.
- Move(left, right, up, down): Estas funciones permiten mover la rana ("R") sobre el tablero.
- Move(car, truck, bus): Esta función permite que los vehículos se muevan sobre los carriles en una dirección dada.
- CheckWin: Revisa si posición de la rana se encuentra en la primer fila del tablero.
- CheckGameOver: Revisa si la rana chocó con un vehículo cualquiera.

### 5. **Instrucciones para ejectuar el programa**
Entre los archivos se incluye un archivo *makefile* el cual implementa las instrucciones necesarias para ejectuar-compilar el programa.
  - Utilizar un sistema operativo linux.
  - Colocarse en el directorio donde se encuentren los archivos.
  - Abrir una terminal en dicho directorio.
  - Con el comando \textit{make all} se ejecutan todos los comandos de makefile, los cuales son:
      - efi: compila el archivo .asm con \textit{fasm} y genera el archivo binario .efi.
      - hex: ejecuta el comando hexdump para verificar que el archivo correrá correctamente en EFI siguiendo el estándar.
      - iso: crea un directorio de carpetas \textit{EFI/BOOT/BOOTX64.efi} el cual sigue el estándar de carpetas de EFI para ejecutar directamente el programa. También genera el archivo ISO correspondiente a partir del directorio anterior.
  - Para probar el programa se debe colocar el archivo ISO en un dispositivo USB booteable formateado con FAT32.
  - El dispositivo se debe colocar en la máquina y asegurarse de que esta esté corriendo en modo UEFI y que en la lista de prioridad de booteo esté el dispositivo USB en primer lugar.
  - Una vez asegurado esto, si se enciende la computadora con el dispositivo conectado debería de cargar de inmediato el juego *Frogger*.

**Estos comandos se pueden ejecutar por separado escribiendo \textit{makefile comando} si ha de ser necesario.**
