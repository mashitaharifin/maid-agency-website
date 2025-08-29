import bcrypt from "bcrypt";

const password = "supersecret"; // raw password
const saltRounds = 10; // higher number = more secure but slower

const hash = bcrypt.hashSync(password, saltRounds);
console.log("Hashed password:", hash);
