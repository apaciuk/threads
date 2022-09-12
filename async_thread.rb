require "./lib/mailer"
require "benchmark" 

threads = []

puts Benchmark.measure{
100.times do |i|
    threads << Thread.new do
        Mailer.deliver do
            from "xhostcom_#{i}@gmail.com"
            to "john_#{i}@example.com"
            subject "Threading #{i}"
            body "Some content" 
        end
    end
end
threads.each {|t| t.join}
}