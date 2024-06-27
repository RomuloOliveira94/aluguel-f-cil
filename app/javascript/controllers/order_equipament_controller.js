import { Autocomplete } from "stimulus-autocomplete";

class OrderEquipamentController extends Autocomplete {
  static targets = ["periodStart", "periodEnd"];

  buildURL(query) {
    return `${new URL(
      this.urlValue,
      window.location.href
    ).toString()}?q=${query}&period_start=${this.periodStartTarget.value}&period_end=${this.periodEndTarget.value}`;
  }
}

export default OrderEquipamentController;
