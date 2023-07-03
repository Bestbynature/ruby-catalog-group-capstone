class Printer
  def self.print_options(options)
    puts '----------------------------------------------'
    puts 'Welcome to the Catalog App'
    puts 'Please choose an option below:'
    options.each do |key, value|
      puts "#{key}. #{value}"
    end
    puts '----------------------------------------------'
  end

  def self.print_list(list)
    list.each do |item|
      puts item
    end
  end

  def self.print_error(error)
    puts error
  end

  def self.print_success(success)
    puts success
  end
end
