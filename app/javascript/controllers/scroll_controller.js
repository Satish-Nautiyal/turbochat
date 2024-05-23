import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    var messages = document.getElementById("messages");
    messages.addEventListener("DOMNodeInserted", this.resetScroll);
    this.resetScroll();
  }
  disconnect(){
    console.log("disconnected");
  }

  resetScroll() {
    messages.scrollTop = messages.scrollHeight - messages.clientHeight;
  }
}
