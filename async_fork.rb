require "./lib/mailer"
require "benchmark" 

puts Benchmark.measure{
    100.times do |i|
        fork do
        Mailer.deliver do
            from "xhostcom_#{i}@gmail.com"
            to "john_#{i}@example.com"
            subject "Threading #{i}"
            body "Some content" 
        end
    end 
end
Process.waitall
}