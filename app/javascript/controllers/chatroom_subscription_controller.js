import { Controller } from "stimulus"
import consumer from '../channels/consumer'
export default class extends Controller {
  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: data => this.#insertMessageAndScrollDown(data) }
    )
}
#insertMessageAndScrollDown(data) {
  this.messagesTarget.insertAdjacentHTML("beforeend", data)
  this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
}
}
