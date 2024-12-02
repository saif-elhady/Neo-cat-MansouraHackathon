const swaggerJSDoc = require('swagger-jsdoc');

const options = {
    definition: {
        openapi: '3.0.0',
        info: {
            title: 'Your API Title',
            version: '1.0.0',
            description: 'Your API Description',
        },
        servers: [
            {
                url: 'http://localhost:4000/api', // Replace with your API base URL
            },
        ],
    },
    apis: ['./src/routes/*.ts', './src/models/*.ts'], // Paths to files containing OpenAPI definitions
};

const swaggerSpec = swaggerJSDoc(options);

module.exports = swaggerSpec;