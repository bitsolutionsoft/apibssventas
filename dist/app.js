import express from "express";
import route from "./route/route";
const app = express();
app.use(express.json());
app.use(route);
export default app;
//# sourceMappingURL=app.js.map