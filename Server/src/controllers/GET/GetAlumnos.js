import mysql from 'mysql2';
import { host, port, username, password } from '../Config/config.js';

export const GetAlumnos = (req, res) => {
  var conexion = mysql.createConnection({
    host: host,
    port: port,
    user: username,
    password: password,
    multipleStatements: true,
  });

  conexion.connect(function (err) {
    if (err) {
      console.error('Error de conexion: ' + err.stack);
      return;
    }
    console.log('Verificando y Conectando con el identificador ' + conexion.threadId);
    console.log('Evaluando Existencia de la Base de Datos');
    console.log('Contectado con Exito');
  });

  const { nombre, apellido, cedula, fecha_nacimiento, genero, año, telefono_r, seccion, mencion } = req.body;

  let query = 'SELECT * FROM bd_madre_rafols.alumnos';

  conexion.query(query, (err, results) => {
    if (err) {
      console.log(err);
      res.send(false);
    } else {
      console.log(results);
      res.send(results);
    }
  });
};
