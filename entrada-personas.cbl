      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENTRADA-PERSONAS.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL PERSONAS-ARCHIVO
           ASSIGN TO "prueba8.dat"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
           FD PERSONAS-ARCHIVO.
           01 PERSONAS-REGISTRO.
               05 PERSONA-NOMBRE PIC X(25).
               05 PERSONA-APELLIDO PIC X(25).
               05 PERSONA-FECHA PIC X(10).
               05 PERSONA-CEDULA PIC X(10).
               05 PERSONA-CELULAR PIC X(10).
       WORKING-STORAGE SECTION.
       77  NOMBRE PIC X(33)
           VALUE "Introduce el nombre a registrar: ".
       77  APELLIDOS PIC X(25)
           VALUE "Introduce los apellidos: ".
       77  FECHA PIC X(34)
           VALUE "Introduce la fecha de nacimiento: ".
       77  CEDULA PIC X(21)
           VALUE "Introduce tu cédula: ".
       77  CELULAR PIC X(33)
           VALUE "Introduce un número de teléfono: ".
       77  SI-NO PIC X VALUE "S".
       77  ENTRADA PIC X.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM PROCEDIMIENTO-APERTURA.
            PERFORM AGREGAR-REGISTRO UNTIL SI-NO = "N".
            PERFORM PROCEDIMIENTO-CIERRE.

       PROGRAM-DONE.
           STOP RUN.

       PROCEDIMIENTO-APERTURA.
           OPEN EXTEND PERSONAS-ARCHIVO.

       PROCEDIMIENTO-CIERRE.
           CLOSE PERSONAS-ARCHIVO.

       AGREGAR-REGISTRO.
           MOVE "N" TO ENTRADA
           PERFORM OBTENER-CAMPOS UNTIL ENTRADA = "S".
           PERFORM ESCRIBIR-REGISTRO.
           PERFORM REINICIAR.

       REINICIAR.
          DISPLAY "¿Desea ingresar otro registro ?".
          ACCEPT SI-NO.
          IF SI-NO = "s"
          MOVE "S" TO SI-NO.
          IF SI-NO NOT = "S"
          MOVE "N" TO SI-NO.

       OBTENER-CAMPOS.
           MOVE SPACE TO PERSONAS-REGISTRO.
           DISPLAY NOMBRE
           ACCEPT PERSONA-NOMBRE
           DISPLAY APELLIDOS
           ACCEPT PERSONA-APELLIDO
           DISPLAY FECHA
           ACCEPT PERSONA-FECHA
           DISPLAY CEDULA
           ACCEPT PERSONA-CEDULA
           DISPLAY CELULAR
           ACCEPT PERSONA-CELULAR
           PERFORM CONTINUAR.

       CONTINUAR.
          MOVE "S" TO ENTRADA.
          IF  PERSONA-NOMBRE = SPACE
          MOVE "N" TO ENTRADA.

       ESCRIBIR-REGISTRO.
           WRITE PERSONAS-REGISTRO.


       END PROGRAM ENTRADA-PERSONAS.
