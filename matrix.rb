require 'curses'

Curses.init_screen
Curses.curs_set(0)
Curses.noecho
Curses.start_color
Curses.timeout = 0

Curses.init_pair(1, Curses::COLOR_GREEN, Curses::COLOR_BLACK)
Curses.init_pair(2, Curses::COLOR_WHITE, Curses::COLOR_BLACK)

height, width = Curses.lines, Curses.cols

rain_chars = ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a

num_cols = width

delay_time = 20

row_delay_time = 50

rain_array = Array.new(num_cols) { [0] * height }

animation_running = true

loop do
  if animation_running
	Curses.clear
    sleep(row_delay_time / 1500.0)

    rain_array = rain_array.map do |column|
      column.pop
      column.unshift(rand(2) == 0 ? 0 : 1)
      column
    end

    rain_array.each_with_index do |column, x|
      column.each_with_index do |row, y|
        next if row == 0

        Curses.setpos(y, x)
        Curses.attron(Curses.color_pair(1)) { Curses.addstr(rain_chars.sample) }
      end
    end

    Curses.refresh
    sleep(delay_time / 1000.0)
  end

  input = Curses.getch
  if input == "p"
    animation_running = !animation_running
  elsif (input == "1")
    row_delay_time = 50
  elsif (input == "2")
    row_delay_time = 200
  elsif (input == "3")
    row_delay_time = 300
  elsif (input == "4")
    row_delay_time = 400
  elsif (input == "5")
    row_delay_time = 500
  elsif (input == "6")
    row_delay_time = 600
  elsif (input == "7")
    row_delay_time = 700
  elsif (input == "8")
    row_delay_time = 800
  elsif (input == "9")
    row_delay_time = 900
  elsif (input == "0")
  	row_delay_time = 10
  end
end
