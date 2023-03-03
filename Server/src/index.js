import Express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';
import { routes } from './routes/routes.js';
import './controllers/CreateDB/CreateHandler.js';

const app = Express();

//Config

app.use(cors());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

//Configuracion de Puerto
let port = 3000;

app.use('/', routes);

app.set('port', process.env.PORT || port);
app.listen(app.get('port'), () => {
  console.log(`Server Online: Port ${port}`);
});
