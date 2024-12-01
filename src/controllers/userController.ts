import { Request, Response, NextFunction } from "express";
import User from "../models/userSchema";


const updateBalance = async (req: Request, res: Response, next: NextFunction) => {
    const { newBalance } = req.body;
    try {
        const id = req.user.id;

        const user = await User.findById(id);
        if (!user) {
            res.status(404).json({ message: 'User not found' });
            return;
        }

        user.balance = newBalance;

        await user.save();

        res.status(200).json({ message: 'Balance updated successfully', balance: user.balance });

    }

    catch (err) {
        res.status(500).json({ message: 'Server error', error: err });
    }
}

export { updateBalance };