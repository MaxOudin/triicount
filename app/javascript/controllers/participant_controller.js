// app/javascript/controllers/participant_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["field"];

  addParticipant() {
    console.log("Adding participant!"); // Add this line for debugging
    const template = this.fieldTarget.outerHTML;
    const newField = document.createElement("div");
    newField.innerHTML = template;
    this.fieldTarget.parentElement.appendChild(newField);
  }

  removeParticipant(event) {
    const field = event.target.closest(".participant-field");
    field.remove();
  }
}
