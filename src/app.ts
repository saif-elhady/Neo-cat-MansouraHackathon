import express from 'express';
import database from './db';
import dotenv from 'dotenv';
import userRoutes from './routes/userRoutes'
import bodyParser from 'body-parser';
import swaggerUi from 'swagger-ui-express';
import swaggerSpec from './swaggerConfig';

dotenv.config();

const app = express();
const port = process.env.PORT || 3000;

app.use(bodyParser.json());
app.use('/api', userRoutes);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));


async function startServer() {
    try {
        await database();
        app.listen(port, () => {
            console.log(`Server is running on port ${port}`);
        });
    } catch (err) {
        console.error("Server failed to start", err);
        process.exit(1);
    }
}

startServer();