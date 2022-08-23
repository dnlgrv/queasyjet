import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "list"]

  connect() {
  }

  change(event) {
    this.listTarget.src = `${event.params.url}?dom_id=${this.listTarget.id}&q=${event.target.value}`
    this.listTarget.reload()
  }

  choose(event) {
    this.inputTarget.value = event.params.value
    this.listTarget.src = ""
    this.listTarget.innerHTML = ""
  }
}
