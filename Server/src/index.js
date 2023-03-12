import Express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';
import { routes } from './routes/routes.js';
import './controllers/CreateDB/CreateHandler.js';
import path from 'path';
import { fileURLToPath } from 'url';
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

//Swagger
import SwaggerUI from 'swagger-ui-express';
import SwaggerJsDoc from 'swagger-jsdoc';

const swagerSpect = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Api-Madre-Rafols',
      version: '1.0.0',
    },
    servers: [
      {
        url: 'http://localhost:3000',
      },
    ],
  },
  apis: [`${path.join(__dirname, './routes/routes.js')}`],
};

const app = Express();

//Config

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

//Configuracion de Puerto
let port = 3000;

app.use('/', routes);
app.use('/api-doc', SwaggerUI.serve, SwaggerUI.setup(SwaggerJsDoc(swagerSpect)));

app.set('port', process.env.PORT || port);
app.listen(app.get('port'), () => {
  console.log(`Server Online: Port ${port}`);
});
