class Mailer 

   def self.deliver(&block) 
    mail = MailBuilder.new(&block).mail
    mail.send_mail
   end 

   Mail = Struct.new(:from, :to, :subject, :body) do 
    def send_mail
      puts "Sending mail from #{from} to #{to} with subject #{subject}"
      puts "Body: #{body}"
    end 
   end 

   def fib(n)
    n < 2 ? n : fib(n-1) + fib(n-2)
   end

end 

class MailBuilder 
   def initialize(&block) 
    @mail = Mailer::Mail.new
    instance_eval(&block)
   end 
   
   attr_reader :mail 

   %w(from to subject body).each do |m| 
    define_method(m) do |arg| 
    mail.send("#{m}=", arg)
    end 
   end
end