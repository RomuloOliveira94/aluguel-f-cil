import { Controller } from "@hotwired/stimulus";
import { useIntersection, useVisibility } from "stimulus-use";

// Connects to data-controller="theme-toggle"
export default class extends Controller {
  connect() {
    useVisibility(this);
  }

  visible() {
    this.element.dataset.bsTheme = localStorage.getItem("theme");
  }

  toggle() {
    const theme = this.element.dataset.bsTheme;
    const newTheme = theme === "dark" ? "light" : "dark";
    this.element.dataset.bsTheme = newTheme;

    localStorage.setItem("theme", newTheme);
  }
}
