//= require action_cable
//= require_self

this.App || (this.App = {});

App.cable = ActionCable.createConsumer();
