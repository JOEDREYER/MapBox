connect() {
  [...]
  this.geocoder.on("result", event => this.#setInputValue(event))
  this.geocoder.on("clear", () => this.#clearInputValue())
}

#setInputValue(event) {
  this.addressTarget.value = event.result["place_name"]
}

#clearInputValue() {
  this.addressTarget.value = ""
}
