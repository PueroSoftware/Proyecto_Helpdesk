import mysql.connector
from myswl.connector import

Error
try :
    conexion = mysql.connector.connect(
        host='     ',
        port='    ',
        user='   ',
        password='   ',
        db='  ',
    )
    if conexion.is_connected()
       print("Conexion exitosa")
    infoServer = conexion.get_server_info()
    print("Info del Servidor", infoServer)

    except Error as ex:
    print("Error durante la conexion ", err)
finally :
    if conexion.is_connected() :
        conexion.clise()  # Se cerro la conexion la Db.
        print("  La conexion ha finalizado")