#= require action_cable
#= require_self

@App ||= {}
App.cable = ActionCable.createConsumer()
