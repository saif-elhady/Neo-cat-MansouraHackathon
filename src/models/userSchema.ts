import mongoose, { Schema, Document } from "mongoose";

interface IUser extends Document {
    fullName: string;
    emailAddress: string;
    phoneNumber: number;
    nationalId: number;
    password: string;
    jobTitle: string;
    monthlyIncome: number;
    balance: number;
    resetCode: string
    // educationLevel: string;
    // maritalStatus: string;
    // numberOfDependents: number;
    // residentialAddress: string;
    // professionalQualifications: string[];
    // savingGoal: string;
}

const userSchema: Schema = new Schema({
    fullName: { type: String, required: true },
    emailAddress: { type: String, required: true, unique: true },
    phoneNumber: { type: Number, required: true },
    nationalId: { type: Number, required: true, unique: true },
    password: { type: String, required: true },
    jobTitle: { type: String, required: true },
    monthlyIncome: { type: Number, required: true },
    balance: { type:Number, required:true , default: 0},
    resetCode: { type: String, required: false }
    // educationLevel: { type: String, required: true },
    // maritalStatus: { type: String, required: true },
    // numberOfDependents: { type: Number, required: true },
    // residentialAddress: { type: String, required: true },
    // professionalQualifications: { type: [String], required: true },
    // savingGoal: { type: String, required: true },
});

const User = mongoose.model<IUser>("User", userSchema);

export default User;