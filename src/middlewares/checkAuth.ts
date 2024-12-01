import jwt from 'jsonwebtoken';
import User from '../models/userSchema';
import { Request, Response, NextFunction } from 'express';
declare module 'express-serve-static-core' {
    interface Request {
        user?: any;
    }
}
require('dotenv').config();

interface JwtPayload {
    id: number;
}



export function checkAuth(req: Request, res: Response, next: NextFunction) {
    const jwtSecret = process.env.SECRET_KEY ?? "";
    const authHeader = req.headers['authorization'];

    if (!authHeader) {
        res.status(401).json({ message: 'Authorization header missing' });
        return;
    }

    const token = authHeader && authHeader.split(' ')[1];

    if (token === undefined) {
        res.status(401).json({ message: 'No token provided' });
        return;
    }

    jwt.verify(token, jwtSecret, async(err, decoded) => {
        if (err) {
            res.status(403).json({ message: 'Failed to authenticate token' });
            return;
        }

        const { id } = decoded as JwtPayload;
        const user = await User.findById(id);

    if (!user) {
        res.status(404).json({ message: 'User not found' });
        return;
        }

        (req as any).user = user;
        next();
    })
}