import { Request, Response, NextFunction } from "express";
import Goal from "../models/goalSchema";

const getGoals = async (req: Request, res: Response, Next: NextFunction) => {
    try {
        const goals = await Goal.find();
        if (!goals) {
            res.status(404).json({ message: "no goals found" });
            return;
        }
        res.status(200).json({ message: "goals fetched", goals });
    }
    catch (err) {
        res.status(500).json({ message: 'Server error', error: err });
    }
}

const getGoal = async(req: Request, res: Response, Next: NextFunction) => {
    const goalId = req.params.id;
    try {
        const goal = await Goal.findById(goalId);
        if (!goal) {
            res.status(404).json({ message: "goal not found" });
            return;
        }
        res.status(200).json({ message: "goal fetched", goal });

    }
    catch (err) {
        res.status(500).json({ message: 'Server error', error: err });
    }
}

const addGoal = async (req: Request, res: Response, next: NextFunction) => {
    const { goalName, targetAmount, savedAmount, deadline } = req.body;
    try {
        const user = (req as any).user;
        if (!user) {
            res.status(404).json({ message: "user not found" });
            return;
        }

        if (savedAmount > targetAmount) {
            res.status(400).json({ message: "Saved amount exceeds target amount" });
            return;
        }
        const progress = (savedAmount / targetAmount) * 100;

        const monthsLeft = Math.round((new Date(deadline).getTime() - new Date().getTime()) / (1000 * 60 * 60 * 24 * 30));
        const monthlySavingsNeeded = Math.round((targetAmount - savedAmount) / monthsLeft);

        const newGoal = new Goal({
            userId: user.id,
            goalName,
            targetAmount,
            savedAmount,
            progress,
            monthlySavingsNeeded,
            deadline,
            createdAt: new Date()
        });

        await newGoal.save();
        res.status(201).json({ message: 'Goal created successfully', goal: newGoal });
    }

    catch (err) {
        res.status(500).json({ message: 'Server error', error: err });
    }
}

const updateGoal = async (req: Request, res: Response, next: NextFunction) => {
    const { goalId } = req.params;
    const { goalName, targetAmount, savedAmount, deadline } = req.body;

    try {
        const user = (req as any).user;
        if (!user) {
            res.status(404).json({ message: "User not found" });
            return;
        }

        const goal = await Goal.findById(goalId);
        if (!goal) {
            res.status(404).json({ message: "Goal not found" });
            return;
        }

        if (savedAmount > targetAmount) {
            res.status(400).json({ message: "Saved amount exceeds target amount" });
            return;
        }

        const progress = (savedAmount / targetAmount) * 100;
        const monthsLeft = (new Date(deadline).getTime() - new Date().getTime()) / (1000 * 60 * 60 * 24 * 30);
        const monthlySavingsNeeded = Math.round((targetAmount - savedAmount) / monthsLeft);

        goal.goalName = goalName;
        goal.targetAmount = targetAmount;
        goal.savedAmount = savedAmount;
        goal.progress = progress;
        goal.monthlySavings = monthlySavingsNeeded;
        goal.deadline = deadline;

        await goal.save();

        res.status(200).json({ message: 'Goal updated successfully', goal });
    } catch (err) {
        res.status(500).json({ message: 'Server error', error: err });
    }
};

const deleteGoal = async (req: Request, res: Response, next: NextFunction) => {
    const goalId  = req.params.id;

    try {
        const user = (req as any).user;
        if (!user) {
            res.status(404).json({ message: "User not found" });
            return;
        }

        const deletedGoal = await Goal.findByIdAndDelete(goalId);
        if (!deletedGoal) {
            res.status(404).json({ message: "Goal not found" });
            return;
        }

        res.status(200).json({ message: 'Goal deleted successfully' });
    } catch (error) {
        next(error);
    }
};

export { getGoals, getGoal, addGoal, updateGoal, deleteGoal };