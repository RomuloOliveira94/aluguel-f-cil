import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="update-order-select"
export default class extends Controller {
  static values = { id: String, url: String };

  updateStatus(event) {
    let status = event.target.value;
    let id = this.idValue;

    fetch(this.urlValue, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]')
          .content,
      },
      body: JSON.stringify({ order: { status: status, id: id } }),
    });
  }
}
