import { check,validationResult } from "express-validator";
import { RequestHandler } from "express";
import { Request, Response, NextFunction } from 'express';

const validateGoal:RequestHandler[] = [
    check('goalName').isString().withMessage('Goal name must be a string'),
    check('targetAmount').isNumeric().withMessage('Target amount must be a number'),
    check('savedAmount').isNumeric().withMessage('Saved amount must be a number'),
    check('deadline').isISO8601().toDate().withMessage('Deadline must be a valid date'),
    (req: Request, res: Response, next: NextFunction) => {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            res.status(400).json({ errors: errors.array() });
            return;
        }
        next();
    }
];

export { validateGoal };