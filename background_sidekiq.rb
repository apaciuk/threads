require "./lib/mailer.rb"
require "sidekiq"

class MailerWorker 
  include Sidekiq::Worker 

  def perform(id)
    Mailer.deliver do
           from "xhostcom@gmail.com"
            to "john@example.com"
            subject "Hello"
            body "Some content" 
    end 
  end
end 

run = true

puts "It ran!"