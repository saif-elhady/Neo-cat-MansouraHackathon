import express from "express";
import { deleteOne, getAll, getOne, updateOne } from "../utils/crudUtils";
import { forgotPassword, login, refreshToken, signUp, verifyResetCode } from "../services/authService";
import { checkAuth } from "../middlewares/checkAuth";
import { loginValidator, signUpvalidator } from "../utils/validation/userValidation";
import { updateBalance } from "../controllers/userController";

const router = express.Router();

/**
 * @swagger
 * components:
 *   securitySchemes:
 *     bearerAuth:
 *       type: http
 *       scheme: bearer
 *       bearerFormat: JWT
 */

/**
 * @swagger
 * /users/:
 *   get:
 *     summary: Retrieve a list of users
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: A list of users
 */
router.get('/users/', checkAuth, getAll);

/**
 * @swagger
 * /users/{id}:
 *   get:
 *     summary: Retrieve a single user by ID
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: The user ID
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: A single user
 *       404:
 *         description: User not found
 */
router.get('/users/:id', checkAuth, getOne);

/**
 * @swagger
 * /users/signup:
 *   post:
 *     summary: Create a new user
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               fullName:
 *                 type: string
 *               emailAddress:
 *                 type: string
 *               phoneNumber:
 *                 type: number
 *               nationalId:
 *                 type: number
 *               password:
 *                 type: string
 *               jobTitle:
 *                 type: string
 *               monthlyIncome:
 *                 type: number
 *               resetCode:
 *                 type: string
 *     responses:
 *       201:
 *         description: User created successfully
 *       400:
 *         description: User already exists
 */
router.post('/users/signup', signUpvalidator, signUp);

/**
 * @swagger
 * /users/login:
 *   post:
 *     summary: Log in a user
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               emailAddress:
 *                 type: string
 *               password:
 *                 type: string
 *     responses:
 *       200:
 *         description: Login successful
 *       401:
 *         description: Invalid email or password
 */
router.post('/users/login', loginValidator, login);

/**
 * @swagger
 * /users/refresh-token:
 *   post:
 *     summary: Refresh the access token
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               refreshToken:
 *                 type: string
 *     responses:
 *       200:
 *         description: Access token refreshed
 *       400:
 *         description: Refresh token is required
 */
router.post('/users/refresh-token', refreshToken);

/**
 * @swagger
 * /users/forgot-password:
 *   post:
 *     summary: Send a reset code to the user's email
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               emailAddress:
 *                 type: string
 *     responses:
 *       200:
 *         description: Reset code sent to your email
 *       404:
 *         description: User not found
 */
router.post('/users/forgot-password', forgotPassword);

/**
 * @swagger
 * /users/verify-reset-code:
 *   post:
 *     summary: Verify the reset code
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               emailAddress:
 *                 type: string
 *               resetCode:
 *                 type: string
 *     responses:
 *       200:
 *         description: Reset code verified successfully
 *       400:
 *         description: Invalid reset code
 *       404:
 *         description: User not found
 */
router.post('/users/verify-reset-code', verifyResetCode);

/**
 * @swagger
 * /users/update-balance:
 *   post:
 *     summary: Update the user's balance
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               addedBalance:
 *                 type: number
 *     responses:
 *       200:
 *         description: Balance updated successfully
 *       404:
 *         description: User not found
 */
router.post('/users/update-balance', checkAuth, updateBalance);

/**
 * @swagger
 * /users/{id}:
 *   put:
 *     summary: Update a user by ID
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: The user ID
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               fullName:
 *                 type: string
 *               emailAddress:
 *                 type: string
 *               phoneNumber:
 *                 type: number
 *               nationalId:
 *                 type: number
 *               password:
 *                 type: string
 *               jobTitle:
 *                 type: string
 *               resetCode:
 *                 type: number
 *     responses:
 *       200:
 *         description: User updated successfully
 *       404:
 *         description: User not found
 */
router.put('/users/:id', checkAuth, updateOne);

/**
 * @swagger
 * /users/{id}:
 *   delete:
 *     summary: Delete a user by ID
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: string
 *         description: The user ID
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: User deleted successfully
 *       404:
 *         description: User not found
 */
router.delete('/users/:id', checkAuth, deleteOne);

export default router;