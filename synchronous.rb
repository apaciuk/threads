require "./lib/mailer"
require "benchmark" 

puts Benchmark.measure{
    100.times do
        Mailer.deliver do
            from "xhostcom@gmail.com"
            to "john@example.com"
            subject "Hello"
            body "Some content"
        end
    end
}
