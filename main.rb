require_relative 'app'
require_relative 'printer'

OPTIONS = {
  1 => 'List all Books',
  2 => 'List all Music albums',
  3 => 'List all Movies',
  4 => 'List all Games',
  5 => 'List all Genres',
  6 => 'List all Labels',
  7 => 'List all Authors',
  8 => 'List all Sources',
  9 => 'Add a Book',
  10 => 'Add a Music album',
  11 => 'Add a Movie',
  12 => 'Add a Game',
  13 => 'Exit'
}.freeze

def main
  app = App.new
  loop do
    Printer.print_options(OPTIONS)

    option = gets.chomp.to_i

    case option
    when 1..12
      app.send(OPTIONS[option].downcase.gsub(/\s+/, '_'))
    when 13
      app.save_all_data
      puts 'Thank you for using our application! Goodbye!'
      break
    else
      puts 'You entered an invalid option, please try again.'
    end
  end
end

main
