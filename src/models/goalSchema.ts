import mongoose, { Schema, Document } from "mongoose";

interface IGoal extends Document {
    userId: mongoose.Schema.Types.ObjectId;
    goalName: string;
    targetAmount: number;
    savedAmount: number;
    progress: number;
    monthlySavings: number;
    deadline: Date;
    createdAt: Date;
}

const goalSchema: Schema = new Schema({
    userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true },
    goalName: { type: String, required: true },
    targetAmount: { type: Number, required: true },
    savedAmount: { type: Number, default: 0 },
    progress: { type: Number, default: 0 },
    monthlySavingsNeeded: { type: Number, default: 0 },
    deadline: { type: Date, required: true },
    createdAt: { type: Date, default: Date.now },
});

const Goal = mongoose.model<IGoal>("Goal", goalSchema);

export default Goal;