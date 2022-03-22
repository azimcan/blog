import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "dropdown" ]

  initialize() {
    this.dropdownStatus = false
  }

  toggle() {
    if (this.dropdownStatus) {
      this.element.classList.add("-translate-x-full")
      this.dropdownStatus = false
    }
    else {
    	this.element.classList.remove("-translate-x-full")
      this.dropdownStatus = true
    }
  }
}