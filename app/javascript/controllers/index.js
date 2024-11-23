// Import and register all your controllers from the importmap via controllers/**/*_controller
import { application } from "controllers/application"
import DropdownController from "./dropdwon_controller";
application.register("dropdown", DropdownController);
