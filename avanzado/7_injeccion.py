# pip install mysql-connector-python
import mysql.connector

# Datos de ejemplo (en una aplicación real, estos vendrían de un formulario)
usuario = input("Usuario: ")
contraseña = input("Contraseña: ")

try:
    # Conexión a la base de datos
    mydb = mysql.connector.connect(
      host="localhost",
      user="tu_usuario",
      password="tu_contraseña",
      database="nombre_bd"
    )

    # Crear un cursor
    cursor = mydb.cursor(prepared=True)

    # Consulta SQL con marcadores de posición
    sql = "SELECT * FROM Usuarios WHERE usuario = %s AND contraseña = %s"

    usuario = "' OR '1'='1 "
    sql_injection = "SELECT * FROM Usuarios WHERE usuario = '" + usuario + "' AND contraseña = '" + contraseña + "'" 

    # Ejecutar la consulta con los parámetros
    cursor.execute(sql, (usuario, contraseña))

    # Obtener los resultados
    result = cursor.fetchall()

    # Procesar los resultados (por ejemplo, verificar si el usuario existe)
    if result:
        print("Inicio de sesión exitoso")
    else:
        print("Usuario o contraseña incorrectos")

except mysql.connector.Error as err:
    print("Error: {}".format(err))

finally:
    # Cerrar la conexión
    if mydb.is_connected():
        cursor.close()
        mydb.close()
        print("Conexión cerrada")