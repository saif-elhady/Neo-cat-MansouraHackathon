import jwt from "jsonwebtoken";
import dotenv from 'dotenv';
dotenv.config();

const secretKey = process.env.SECRET_KEY as string;
const refreshSecretKey = process.env.REFRESH_SECRET_KEY as string;


export const generateToken = (userId: string) => {
    return jwt.sign({ id: userId }, secretKey, { expiresIn: '7d' });
}

export const generateRefreshToken = (userId: string)=> {
    return jwt.sign({ id: userId }, refreshSecretKey, { expiresIn: '7d' });
};

export const verifyToken = (token: string) => {
    try {
        return jwt.verify(token, secretKey)
    }
    catch (err) {
        return err;
    }
};

export const verifyRefreshToken = (token: string)=> {
    try {
        return jwt.verify(token, refreshSecretKey);
    } catch (err) {
        return null;
    }
};