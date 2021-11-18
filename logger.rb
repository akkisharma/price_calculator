# save logs into file for future use

module Logger

  def self.info(data)

    File.open('logs.txt', 'a+') do |file|
      file.write("\n\nTime: #{Time.now} | Info: #{data}")
    end

  end

  def self.error(error)

    begin

      File.open('logs.txt', 'a+') do |file|
        file.write("\n\nTime: #{Time.now} | Error of type #{error.class} : Error message: #{error.message}: Backtrace: \n #{error.backtrace.join("\n")} ")
      end

    rescue => exception
      puts "Error: #{error.class}: #{exception.message}"
    end

  end

end