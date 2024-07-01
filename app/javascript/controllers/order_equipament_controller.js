import { Autocomplete } from "stimulus-autocomplete";

class OrderEquipamentController extends Autocomplete {
  static targets = ["periodStart", "periodEnd", "errorMessage"];

  clearError() {
    this.errorMessageTarget.style.display = "none";
  }

  buildURL(query) {
    let periodStart = this.periodStartTarget.value;
    let periodEnd = this.periodEndTarget.value;

    if (!periodStart || !periodEnd) {
      this.displayError("Por favor, selecione o período de locação.");
      return;
    }

    return `${new URL(
      this.urlValue,
      window.location.href
    ).toString()}?q=${query}&period_start=${
      this.periodStartTarget.value
    }&period_end=${this.periodEndTarget.value}`;
  }

  displayError(message) {
    this.errorMessageTarget.textContent = message;
    this.errorMessageTarget.style.display = "block";
  }
}

export default OrderEquipamentController;
