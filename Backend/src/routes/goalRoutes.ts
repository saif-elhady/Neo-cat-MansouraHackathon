import express from "express";
import { addGoal, deleteGoal, getGoal, getGoals, updateGoal } from "../controllers/goalController";
import { checkAuth } from "../middlewares/checkAuth";
import { validateGoal } from "../utils/validation/goalValidation";

const router = express.Router();

/**
 * @swagger
 * components:
 *   schemas:
 *     Goal:
 *       type: object
 *       required:
 *         - goalName
 *         - targetAmount
 *         - savedAmount
 *         - deadline
 *       properties:
 *         goalName:
 *           type: string
 *           description: The name of the goal
 *         targetAmount:
 *           type: number
 *           description: The target amount to be saved
 *         savedAmount:
 *           type: number
 *           description: The amount already saved
 *         deadline:
 *           type: string
 *           format: date
 *           description: The deadline for the goal
 *       example:
 *         goalName: Buy a Car
 *         targetAmount: 20000
 *         savedAmount: 2000
 *         deadline: 2025-10-02
 *   securitySchemes:
 *     bearerAuth:
 *       type: http
 *       scheme: bearer
 *       bearerFormat: JWT
 */

/**
 * @swagger
 * tags:
 *   name: Goals
 *   description: The goals managing API
 */

/**
 * @swagger
 * /goals:
 *   get:
 *     summary: Returns the list of all the goals
 *     tags: [Goals]
 *     responses:
 *       200:
 *         description: The list of the goals
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 $ref: '#/components/schemas/Goal'
 */
router.get('/goals/', getGoals);

/**
 * @swagger
 * /goals/{id}:
 *   get:
 *     summary: Get the goal by id
 *     tags: [Goals]
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: The goal id
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: The goal description by id
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Goal'
 *       404:
 *         description: The goal was not found
 */
router.get('/goals/:id', checkAuth, getGoal);

/**
 * @swagger
 * /goals:
 *   post:
 *     summary: Create a new goal
 *     tags: [Goals]
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Goal'
 *     responses:
 *       201:
 *         description: The goal was successfully created
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Goal'
 *       500:
 *         description: Some server error
 */
router.post('/goals/', checkAuth, validateGoal ,addGoal);

/**
 * @swagger
 * /goals/{id}:
 *   put:
 *     summary: Update the goal by the id
 *     tags: [Goals]
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: The goal id
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             $ref: '#/components/schemas/Goal'
 *     responses:
 *       200:
 *         description: The goal was updated
 *         content:
 *           application/json:
 *             schema:
 *               $ref: '#/components/schemas/Goal'
 *       404:
 *         description: The goal was not found
 *       500:
 *         description: Some error happened
 */
router.put('/goals/:id', checkAuth, validateGoal, updateGoal);

/**
 * @swagger
 * /goals/{id}:
 *   delete:
 *     summary: Remove the goal by id
 *     tags: [Goals]
 *     parameters:
 *       - in: path
 *         name: id
 *         schema:
 *           type: string
 *         required: true
 *         description: The goal id
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: The goal was deleted
 *       404:
 *         description: The goal was not found
 */
router.delete('/goals/:id', checkAuth, deleteGoal);

export default router;