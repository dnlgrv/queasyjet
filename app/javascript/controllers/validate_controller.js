import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["departure", "arrival", "button"]

  connect() {
    this.updateButton()
  }

  check() {
    this.updateButton()
  }

  updateButton() {
    this.buttonTarget.disabled = this.departureTarget.value == "" || this.arrivalTarget.value == ""
  }
}
