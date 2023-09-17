       IDENTIFICATION DIVISION.
       PROGRAM-ID. ENTRADA-REGISTRO-CIVIL.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT OPTIONAL REGISTRO-CIVIL-ARCHIVO
           ASSIGN TO "prueba8.dat"
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
           FD REGISTRO-CIVIL-ARCHIVO.
           01 REGISTRO-CIVIL-REGISTRO.
               05 REGISTRO-NRO-FOLIO PIC X(12).
               05 REGISTRO-NRO-LIBRO PIC X(12).
               05 REGISTRO-FECHA PIC X(10).
               05 REGISTRO-CEDULA PIC X(10).
               05 REGISTRO-DIRECCION PIC X(50).
       WORKING-STORAGE SECTION.
       77  FOLIO PIC X(33)
           VALUE "Introduce el nro. de folio: ".
       77  LIBRO PIC X(33)
           VALUE "Introduce el nro. de libro: ".
       77  FECHA PIC X(34)
           VALUE "Introduce la fecha de nacimiento: ".
       77  CEDULA PIC X(21)
           VALUE "Introduce la cedula: ".
       77  DIRECCION PIC X(37)
           VALUE "Introduce la direccion del registro: ".
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
           OPEN EXTEND REGISTRO-CIVIL-ARCHIVO.

       PROCEDIMIENTO-CIERRE.
           CLOSE REGISTRO-CIVIL-ARCHIVO.

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
           MOVE SPACE TO REGISTRO-CIVIL-REGISTRO.
           DISPLAY FOLIO
           ACCEPT REGISTRO-NRO-FOLIO
           DISPLAY LIBRO
           ACCEPT REGISTRO-NRO-LIBRO
           DISPLAY FECHA
           ACCEPT REGISTRO-FECHA
           DISPLAY CEDULA
           ACCEPT REGISTRO-CEDULA
           DISPLAY DIRECCION
           ACCEPT REGISTRO-DIRECCION
           PERFORM CONTINUAR.

       CONTINUAR.
          MOVE "S" TO ENTRADA.
          IF  REGISTRO-NRO-FOLIO = SPACE
          MOVE "N" TO ENTRADA.

       ESCRIBIR-REGISTRO.
           WRITE REGISTRO-CIVIL-REGISTRO.
       END PROGRAM ENTRADA-REGISTRO-CIVIL.
