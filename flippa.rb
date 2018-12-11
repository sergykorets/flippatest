class Robot
  attr_accessor :x, :y, :orientation

  def place(x, y, orientation)
    if (x < 0 || x > 5) || (y < 0 || y > 5)
      puts 'Robot can not be placed out of a table'
    else
      self.x = x
      self.y = y
      if orientation == 'n' || orientation == 'e' || orientation == 's' || orientation == 'w'
        self.orientation = orientation
      else
        puts 'type correct direction: n, e, s or w'
      end
    end
  end

  def change_orientation(direction)
    case direction
      when 'l'
        case self.orientation
          when 'w'
            self.orientation = 's'
          when 'n'
            self.orientation = 'w'
          when 'e'
            self.orientation = 'n'
          when 's'
            self.orientation = 'e'
        end
      when 'r'
        case self.orientation
          when 'w'
            self.orientation = 'n'
          when 'n'
            self.orientation = 'e'
          when 'e'
            self.orientation = 's'
          when 's'
            self.orientation = 'w'
        end
      end
  end

  def move
    case self.orientation
      when 'w'
        if out_of_table?(self.x - 1, self.y)
          puts 'reached edge nothing to be done'
        else
          self.x = x - 1
        end
      when 'n'
        if out_of_table?(self.x, self.y + 1)
          puts 'reached edge nothing to be done'
        else
          self.y = y + 1
        end
      when 'e'
        if out_of_table?(self.x + 1, self.y)
          puts 'reached edge nothing to be done'
        else
          self.x = x + 1
        end
      when 's'
        if out_of_table?(self.x, self.y - 1)
          puts 'reached edge nothing to be done'
        else
          self.y = y - 1
        end
    end
  end

  def out_of_table?(x,y)
    (x < 0 || x > 5) || (y < 0 || y > 5)
  end

  def report
    puts "x: #{self.x}, y: #{self.y}, orientation: #{self.orientation}"
  end
end

robot = Robot.new
# a
robot.place(0,0,'n')
robot.move
robot.report
# b
robot.place(0,0,'n')
robot.change_orientation('l')
robot.report
# c
robot.place(1,2,'e')
robot.move
robot.move
robot.change_orientation('l')
robot.move
robot.report