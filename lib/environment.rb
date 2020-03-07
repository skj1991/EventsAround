require_relative "./EventsAround/version"
require_relative "./EventsAround/cli"
require_relative "./EventsAround/api"
require_relative "./EventsAround/event"
require "pry"
require "httparty"

module EventsAround
  class Error < StandardError; end
  # Your code goes here...
end
