import { Controller } from "@hotwired/stimulus";
import { useIntersection } from "stimulus-use";

// Connects to data-controller="theme-toggle"
export default class extends Controller {
  static targets = ["theme"];

  connect() {
    useIntersection(this);
  }

  appear() {
    if (this.atLeastOneVisible()) {
      this.themeTarget.dataset.bsTheme = localStorage.getItem("theme");
    }
  }

  toggle() {
    const theme = this.themeTarget.dataset.bsTheme;
    const newTheme = theme === "dark" ? "light" : "dark";
    this.themeTarget.dataset.bsTheme = newTheme;

    localStorage.setItem("theme", newTheme);
  }
}
