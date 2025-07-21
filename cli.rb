require 'io/console'
require 'timeout'

# Clear terminal
def clear_terminal
  system('clear') || system('cls')
end

# Read a single character without echoing to stdout
def read_char
  $stdin.raw do |io|
    char = io.getc
    return char
  end
end

# Read escape sequence for special keys with a timeout
def read_escape_sequence(initial_char)
  sequence = initial_char
  begin
    Timeout.timeout(0.01) do
      while true
        sequence += read_char
      end
    end
  rescue Timeout::Error
    # Timeout means no more characters in the sequence
  end
  sequence
end

# Map character or sequence to a readable name
def map_char_name(char_or_sequence)
  if char_or_sequence == "\e"
    sequence = read_escape_sequence(char_or_sequence)
    case sequence
    when "\e[A" then "UP"
    when "\e[B" then "DOWN"
    when "\e[C" then "RIGHT"
    when "\e[D" then "LEFT"
    else "ESCAPE SEQUENCE: #{sequence.inspect}"
    end
  else
    case char_or_sequence
    when " " then "SPACE"
    when "\r" then "ENTER"
    when "\t" then "TAB"
    else char_or_sequence.upcase
    end
  end
end

# Display the header message
def display_header
  clear_terminal
  puts "Press any key (Q, W, LEFT, SPACE, etc.) to see its output."
  puts "Press 'c' to clear terminal, 'q' to quit."
  puts "---------------------------------------"
end

# Display the result of a key press
def display_result(char_name)
  clear_terminal
  puts "You pressed: #{char_name}"
  puts "Press 'c' to clear terminal, 'q' to quit, or any other key to continue..."
  puts "---------------------------------------"
end

# Handle clear terminal command
def handle_clear_command
  clear_terminal
  puts "Terminal cleared!"
  puts "Press any key (Q, W, LEFT, SPACE, etc.) to see its output."
  puts "Press 'c' to clear terminal, 'q' to quit."
  puts "---------------------------------------"
end

# Main program
display_header

loop do
  char = read_char

  if char.downcase == 'c'
    handle_clear_command
    next
  end

  char_name = map_char_name(char)
  display_result(char_name)

  break if char.downcase == 'q'
end

puts "\nProgram ended."
