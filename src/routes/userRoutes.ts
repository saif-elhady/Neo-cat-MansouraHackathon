import express from "express";
import { deleteOne, getAll, getOne, updateOne } from "../utils/crudUtils";
import { forgotPassword, login, refreshToken, signUp, verifyResetCode } from "../services/authService";
import { checkAuth } from "../middlewares/checkAuth";
import { loginValidator, signUpvalidator } from "../utils/validation/userValidation";
import { updateBalance } from "../controllers/userController";

const router = express.Router();

router.get('/users/', getAll);
router.get('/users/:id', checkAuth, getOne);
router.post('/users/signup', signUpvalidator, signUp);
router.post('/users/login', loginValidator, login);
router.post('/users/refresh-token', refreshToken);
router.post('/users/forgot-password', forgotPassword);
router.post('/users/verify-reset-code', verifyResetCode);
router.put('/users/:id', checkAuth, updateOne);
router.delete('/users/:id', checkAuth, deleteOne);
router.post('/users/update-balance', checkAuth, updateBalance);

export default router;