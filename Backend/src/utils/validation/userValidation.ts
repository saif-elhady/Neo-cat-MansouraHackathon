import { check,validationResult } from "express-validator";
import { RequestHandler } from "express";
import { Request, Response, NextFunction } from 'express';

export const signUpvalidator: RequestHandler[] = [check('fullName').notEmpty().withMessage('Full name is required'),
check('emailAddress').notEmpty().withMessage('Email address is required')
    .isEmail().withMessage('Invalid email address'),
check('phoneNumber').notEmpty().withMessage('Phone number is required'),
check('nationalId').notEmpty().withMessage('National ID is required'),
check('password').notEmpty().withMessage('Password is required')
    .isLength({ min: 6 }).withMessage('Password must be at least 6 characters long'),
check('jobTitle').notEmpty().withMessage('Job title is required'),
// check('educationLevel').notEmpty().withMessage('Education level is required'),
// check('maritalStatus').notEmpty().withMessage('Marital status is required'),
// check('numberOfDependents').isInt({ min: 0 }).withMessage('Number of dependents must be a non-negative integer'),
// check('residentialAddress').notEmpty().withMessage('Residential address is required'),
// check('professionalQualifications').isArray().withMessage('Professional qualifications must be an array'),
// check('savingGoal').notEmpty().withMessage('Saving goal is required'),
(req: Request, res: Response, next: NextFunction) => {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
        res.status(400).json({ errors: errors.array() });
        return;
    }
    next();
}];

export const loginValidator: RequestHandler[] = [
    check('emailAddress').notEmpty().withMessage('email is missing')
        .isEmail().withMessage('invalid email'),
    check('password').notEmpty().withMessage('password is missing')
        .isLength({ min: 6 }).withMessage('Password must be at least 6 characters long'),
    (req: Request, res: Response, next: NextFunction)=> {
        const errors = validationResult(req);
        if (!errors.isEmpty()) {
            res.status(400).json({ errors: errors.array() });
            return;
        }
        next();
    }
]