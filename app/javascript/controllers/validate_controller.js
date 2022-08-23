import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["departure", "arrival", "button"]

  connect() {
    this.updateButton()
  }

  check() {
    this.updateButton()
  }

  submit() {
    alert(`Let's go from ${this.departureTarget.value} to ${this.arrivalTarget.value}!`)
  }

  updateButton() {
    this.buttonTarget.disabled = this.departureTarget.value == "" || this.arrivalTarget.value == ""
  }
}
