
#TODAS LAS CLASES IMPORTAN MYSQLCONNECTION
from flask_app.config.mysqlconnection import connectToMySQL

class Viaje:

    #metodo constructor
    def __init__(self, data):
        self.id = data.get('id')
        self.destino = data.get('destino')
        self.fecha_inicio = data.get('fecha_inicio')
        self.fecha_termino = data.get('fecha_termino')
        self.itinerario = data.get('itinerario')
        self.created_at = data.get('created_at')
        self.updated_at = data.get('updated_at')
        self.usuarios_id = data.get('usuarios_id')
        self.nombre = data.get('nombre')
        self.apellido = data.get('apellido')

    #para guardar un registro
    @classmethod
    def save(cls, data):
        query = """INSERT INTO viajes(destino, fecha_inicio, fecha_termino, itinerario, created_at, updated_at, usuarios_id)VALUES(%(destino)s, %(fecha_inicio)s, %(fecha_termino)s, %(itinerario)s, NOW(), NOW(), %(usuarios_id)s);"""
        return connectToMySQL('ViajeroFrecuente2').query_db(query, data)
    #Metodo para ver todos los registros
    @classmethod
    def get_all(cls):
        query = """SELECT viajes.*, usuarios.nombre, usuarios.apellido FROM viajes LEFT JOIN usuarios ON viajes.usuarios_id = usuarios.id;"""
        viajes_en_bd = connectToMySQL('ViajeroFrecuente2').query_db(query)
        viajes = []
        if viajes_en_bd:
            for viaje in viajes_en_bd:
                viajes.append(cls(viaje))
        return viajes

    #Metodo para ver 1 registro
    @classmethod
    def get_one(cls, datos):
        query = """SELECT viajes.*, usuarios.nombre, usuarios.apellido FROM viajes LEFT JOIN usuarios ON viajes.usuarios_id = usuarios.id WHERE viajes.id = %(id)s;"""
        viajes_en_db = connectToMySQL('ViajeroFrecuente2').query_db(query, datos)
        if not viajes_en_db:
            return None
        return cls(viajes_en_db[0])

    #Metodo para editar registro
    
    # Método para editar registro
    @classmethod
    def update(cls, datos):
        query = """UPDATE viajes SET destino = %(destino)s, fecha_inicio = %(fecha_inicio)s, fecha_termino = %(fecha_termino)s, itinerario = %(itinerario)s, updated_at = NOW() WHERE id = %(id)s;"""
        return connectToMySQL('ViajeroFrecuente2').query_db(query, datos)



    #Metodo para eliminar 1 registro
    @classmethod
    def delete(cls, datos):
        query = "DELETE FROM viajes WHERE id = %(id)s;"
        return connectToMySQL('ViajeroFrecuente2').query_db(query, datos)
