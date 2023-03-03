import Express from 'express';

export const routes = Express.Router();

routes.get('/', (req, res) => {
  res.json('Ruta base');
});
