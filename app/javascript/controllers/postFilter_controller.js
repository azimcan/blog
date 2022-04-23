import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "button" ]

  initialize() {
    this.dropdownStatus = false
  }

  toggle() {
    if (this.dropdownStatus) {
      this.buttonTarget.classList.remove("rotate-180")
      this.element.classList.add("translate-x-[calc(100%-24px)]")
      this.dropdownStatus = false
    }
    else {
      this.buttonTarget.classList.add("rotate-180")
    	this.element.classList.remove("translate-x-[calc(100%-24px)]")
      this.dropdownStatus = true
    }
  }
}