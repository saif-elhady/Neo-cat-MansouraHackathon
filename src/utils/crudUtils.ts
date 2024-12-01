import User from "../models/userSchema";
import { Request, Response, NextFunction } from "express";

const getAll = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const users = await User.find();
        res.status(200).json({ message: "users fetched", users:users });
    }
    catch (error) {
      next(error)
    }
}

const getOne = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
        const userId = req.params.id;
        const user = await User.findById(userId);
        if (!user) {
            res.status(404).json({ message: 'User not found' });
        }
        res.status(200).json(user);
    } catch (error) {
        next(error);
    }
};

async function createOne(data: Object) {
    const newUser = new User(data);
    return await newUser.save();
}

const updateOne = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
        const userId = req.params.id;
        const updatedUser = await User.findByIdAndUpdate(userId, req.body, { new: true });
        if (!updatedUser) {
            res.status(404).json({ message: 'User not found' });
            return;
        }
        res.status(200).json(updatedUser);
    } catch (error) {
        next(error);
    }
};

const deleteOne = async (req: Request, res: Response, next: NextFunction): Promise<void> => {
    try {
        const userId = req.params.id;
        const deletedUser = await User.findByIdAndDelete(userId);
        if (!deletedUser) {
            res.status(404).json({ message: 'User not found' });
            return;
        }
        res.status(200).json({ message: 'User deleted successfully' });
    } catch (error) {
        next(error);
    }
};

export {
    getAll,
    getOne,
    createOne,
    updateOne,
    deleteOne
};