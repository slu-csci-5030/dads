const jwt = require('jsonwebtoken');

const payload = {
    "sub": "dev-user",
    "name": "Developer",
    "aud": "local-dev",
    "iss": "http://localhost:3000/",
    "localhost/agent": "@example.com"
};

const token = jwt.sign(payload, 'dev-only-secret', { expiresIn: '1h', algorithm: 'HS256' });
console.log("JWT Token:", token);

const fs = require('fs');
fs.writeFileSync('token.txt', token);
console.log("Token stored!");