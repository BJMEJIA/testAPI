import express from 'express';
import bodyParser from 'body-parser';

import usersRoutes from './routes/users.js';

import https from 'https'
import http from 'http'
import request from 'request'

const app = express();
const PORT = 8080;

app.use(bodyParser.json());

app.use('/users', usersRoutes);

app.get('/', (req, res) => {
    res.send('Hello from Home bitch');
});

app.post('/', function(req, res){
    //console.log(req.body)
    request.post(
        {
            headers: {'content-type' : 'application/json'},
            body: JSON.stringify(req.body),
            url: 'https://prod-160.westus.logic.azure.com:443/workflows/f9daa5b1a78643a19e4b85e26582654d/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=mSpgSHsYiS4aaHGveNuIwJIOVMNcAhCf0jTFHkHbjlI'
        }, function(error, response, body){
            console.log(body);
          });
        });

app.listen(PORT, () => console.log(`Server Running on port: ${PORT}`));
