import Express from 'express';

//Import de Middleware
import { CreateAlumnos } from '../controllers/POST/CreateAlumno.js';

export const routes = Express.Router();

//Documentacion de Schema de Alumnos
/**
 * @swagger
 * components:
 *  schemas:
 *    Alumno:
 *       type: object
 *       properties:
 *         nombre:
 *           type: string
 *           description: Nombre del Alumno
 *         apellido:
 *           type: string
 *           description: Apellido del Alumno
 *         cedula:
 *           type: number
 *           description: Cedula del Alumno
 *         fecha_nacimiento:
 *           type: date
 *           description: Fecha de Nacimiento del Alumno
 *         genero:
 *           type: string
 *           description: Genero del Alumno
 *         año:
 *           type: string
 *           description: Nombre del Alumno
 *         telefono_r:
 *           type: string
 *           description: Telefono del Representante
 *         seccion:
 *           type: string
 *           description: Seccion del Alumno
 *         mencion:
 *           type: string
 *           description: Mencion del Alumno
 *       required:
 *         -nombre
 *         -apellido
 *         -nombre
 *         -cedula
 *         -fecha_nacimiento
 *         -genero
 *         -año
 *         -telefono_r
 *         -seccion
 *         -mencion
 *       example:
 *         nombre: Kevin
 *         apellido: Araujo
 *         cedula: 30259086
 *         fecha_nacimiento: 2004/02/07
 *         genero: Masculino
 *         año: 1
 *         telefono_r: 04263400229
 *         seccion: 7
 *         mencion: 1
 */

//Documentacion Ruta de Creacion de Alumnos
/**
 * @swagger
 * /CreateAlumno:
 *   post:
 *     summary: Crea un nuevo alumno
 *     tags: [Alumno]
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             $ref: '#/components/schemas/Alumno'
 *     responses:
 *       200:
 *         description: Success New Alumno!
 */
routes.post('/CreateAlumno', CreateAlumnos, (req, res) => {
  //Ruta de la Creacion de los Alumnos
});
