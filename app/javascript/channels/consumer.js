import * as ActionCable from "@rails/actioncable"

let consumer;

if (ActionCable) {
    consumer = ActionCable.createConsumer()
}

export default consumer;
