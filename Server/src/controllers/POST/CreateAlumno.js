import mysql from 'mysql2';
import { host, port, username, password } from '../Config/config.js';

export const CreateAlumnos = (req, res) => {
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

  let query =
    'INSERT INTO `bd_madre_rafols`.`alumnos` (`Nombre`, `Apellido`, `Cedula`, `Fecha_de_Nacimiento`, `Genero`, `Año`, `Telefono_Representante`, `Seccion`, `Mencion`) VALUES ';
  query += `('${nombre}', '${apellido}', '${cedula}', '${fecha_nacimiento}', '${genero}', '${año}', '${telefono_r}', '${seccion}', '${mencion}')`;

  conexion.query(query, (err, results) => {
    if (err) {
      console.log(err);
      res.send(false);
    } else {
      console.log(results);
      res.send(true);
    }
  });
};
