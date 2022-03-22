// src/controllers/slideshow_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "slide"]

  initialize() {
    this.index = 0
  }

  connect() {
    this.refreshTimer = setInterval(() => {
      this.next()
    }, 3000)
  }

  disconnect() {
    if (this.refreshTimer) {
      clearInterval(this.refreshTimer)
    }
  }

  next() {
    this.index++
    this.index = this.index % this.slideTargets.length
    this.showCurrentSlide()
  }

  previous() {
    this.index--
    if (this.index < 0 ) {
      this.index = this.slideTargets.length-1
    }
    this.index = this.index % this.slideTargets.length
    this.showCurrentSlide()
  }

  showCurrentSlide() {
    this.slideTargets.forEach((element, index) => {
      element.hidden = index != this.index
    })
  }
}