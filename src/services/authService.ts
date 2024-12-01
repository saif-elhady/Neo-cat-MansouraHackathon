import User from "../models/userSchema";
import crypto from "crypto";
import { NextFunction, Request, Response } from "express";
import { JwtPayload } from "jsonwebtoken";
import { comparePassword, hashPassword } from "../utils/passwordUtils";
import { createOne, updateOne } from "../utils/crudUtils";
import { generateToken, generateRefreshToken, verifyRefreshToken } from "../utils/jwtUtils";
import sendMail from "../utils/sendMail";


const signUp = async (req: Request, res: Response):Promise <void> => {
    const { fullName, emailAddress, phoneNumber, nationalId, password, jobTitle, monthlyIncome } = req.body;
    try {
        const existingUser = await User.findOne({ emailAddress });
        if (existingUser) {
            res.status(400).json({ message: 'user already exists' });
            return;
        }

        const hashedPassword = await hashPassword(password);

        const newUser = await createOne({
            fullName,
            emailAddress,
            phoneNumber,
            nationalId,
            password: hashedPassword,
            jobTitle,
            monthlyIncome
            // educationLevel,
            // maritalStatus,
            // numberOfDependents,
            // residentialAddress,
            // professionalQualifications,
            // savingGoal
        });
        const token = generateToken(newUser._id as string);
        const refreshToken = generateRefreshToken(newUser._id as string);
        const id = newUser._id;

        res.status(201).json({ message: 'User created successfully', token, refreshToken, newUser});
    }
    catch (err) {
        res.status(500).json({ message: 'Server error', error: err });
    }
};

const login = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    const { emailAddress, password } = req.body;
    try {
        const user = await User.findOne({ emailAddress });
        if (!user || !await comparePassword(password, user.password)) {
            res.status(401).json({ message: 'Invalid email or password' });
            return;
        }

        const accessToken = generateToken(user?.id);
        const refreshToken = generateRefreshToken(user?.id);

        res.status(201).json({ accessToken, refreshToken });

    }
    catch (err) {
        console.error(err);
        res.status(500).json({ message: err });
    }
}

const refreshToken = async (req: Request, res: Response): Promise<void> => {
    const { refreshToken } = req.body;

    if (!refreshToken) {
        res.status(400).json({ message: 'Refresh token is required' });
        return;
    }

    try {
        const decoded = verifyRefreshToken(refreshToken) as JwtPayload;
        const { id } = decoded;
        const user = await User.findById(id);

        if (!user) {
            res.status(404).json({ message: 'User not found' });
            return;
        }

        const newAccessToken = generateToken(id);

        res.status(200).json({ accessToken: newAccessToken });
    } catch (error) {
        res.status(403).json({ message: 'Invalid refresh token' });
    }
};

const forgotPassword = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    const { emailAddress } = req.body;
    try {
        const user = await User.findOne({ emailAddress });
        if (!user) {
            res.status(404).json({ message: 'User not found' });
            return;
        }
        const resetCode = Math.floor(1000 + Math.random() * 9000).toString();
        const hashedResetCode = crypto.createHash('sha256').update(resetCode).digest('hex');
        const message = `Your reset code is ${resetCode}`;

        user.resetCode = hashedResetCode;
        await user.save();


    await sendMail({
            to: user.emailAddress,
            subject: 'Reset Password',
            text: message,
            html: `<p>Your password reset code is <strong>${resetCode}</strong></p>`
        }); 
        res.status(200).json({ message: 'Reset code sent successfully' }); 
    }
    catch (err) { 
        console.error('Error in forgotPassword:', err); 
        res.status(500).json({ message: 'Error sending email' }); 
    } 
}

const verifyResetCode = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    const { emailAddress, resetCode } = req.body;

    try {
        const user = await User.findOne({ emailAddress });
        if (!user) {
            res.status(404).json({ message: 'User not found' });
            return;
        }

        const hashedResetCode = crypto.createHash('sha256').update(resetCode).digest('hex');

        if (user.resetCode !== hashedResetCode) {
            res.status(400).json({ message: 'Invalid reset code' });
            return;
        }

        const accessToken = generateToken(user.id);

        res.status(200).json({ message: 'Reset code verified successfully', accessToken: accessToken });
    } catch (err) {
        res.status(500).json({ message: 'Server error', error: err });
    }
};

export { signUp, login, refreshToken, forgotPassword, verifyResetCode };
