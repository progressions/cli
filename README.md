# Key Press Detector

This Ruby script is a simple terminal-based program that detects and displays key presses, including standard keys (e.g., letters, space, enter) and special keys (e.g., arrow keys). It runs in a loop, allowing users to press keys and see immediate feedback. Special commands include 'c' to clear the terminal and 'q' to quit.

## Requirements

- Ruby (tested on Ruby 3.x)
- A terminal that supports raw input (e.g., Unix-like terminals such as bash or Linux console; may not work in all IDE consoles)

No external gems are required beyond the built-in `io/console` and `timeout`.

## Installation

Save the script as `cli.rb`.

## Usage

Run the script in your terminal:

```bash
ruby cli.rb
```

- Press any key (e.g., 'a', 'space', 'left arrow') to see its name displayed.
- Press 'c' to clear the terminal.
- Press 'q' to quit.

The script Flow:
1. Clears the terminal and shows instructions.
2. Reads input in raw mode to capture single characters or escape sequences.
3. Maps the input to a human-readable name (e.g., "UP" for up arrow, "SPACE" for spacebar).
4. Displays the result and waits for the next input.

## Limitations

- Arrow keys and other escape sequences are only mapped for common ones (up, down, left, right). Others are shown as raw sequences.
- Does not handle multi-key combinations (e.g., Ctrl+key).
- Relies on terminal support for raw input and clearing; behavior may vary on Windows.

## License

MIT License. Feel free to modify and use as needed.
