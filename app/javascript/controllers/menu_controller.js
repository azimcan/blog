import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "dropdown", "menuIcon", "xIcon" ]

  initialize() {
    this.dropdownStatus = false
  }

  open() {
    if (this.dropdownStatus) {
      this.dropdownTarget.classList.add("hidden")
      this.menuIconTarget.classList.remove("hidden")
      this.xIconTarget.classList.add("hidden")
      this.dropdownStatus = false
    }
    else {
      this.dropdownTarget.classList.remove("hidden")
      this.menuIconTarget.classList.add("hidden")
      this.xIconTarget.classList.remove("hidden")
      this.dropdownStatus = true
    }
  }
}