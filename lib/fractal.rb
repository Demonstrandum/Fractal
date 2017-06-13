require 'chunky_png'

def drag pos, pos_min, pos_max, out_min, out_max
  return (
    (pos - pos_min) * (out_max - out_min) /
    (pos_max - pos_min) + out_min
  )
end # drag(x, x_min_val, x_max_val, mapped_to_min_val, mapped_to_max_val), the same as the popular map(...) function.

module Fractals
  I = Complex 'i'

  class Mandelbrot
    attr_accessor :colorMode

    def initialize image
      @width, @height = image.width, image.height
      @image = image
    end

    def draw definition=100, scale=2
      scale = scale.to_f
      definition = definition.to_f
      (0..@width - 1).each do |x|
        (0..@height - 1).each do |y|
          a = ca = drag(x, 0, @width,  -scale, scale)
          b = cb = drag(y, 0, @height, -scale, scale)

          snap = 0
          while snap < definition
            left  = a * a - b * b
            right = 2 * a * b
            a = left  + ca
            b = right + cb

            if a * a + b * b > 16
              break
            end
            snap += 1
          end
          shade = drag(snap, 0, definition, 0, 1)
          shade = drag(Math.sqrt(shade), 0, 1, 0, 255)

          colours = [shade.round.to_i] * 3
          hex = String.new
          colours.each { |component| hex << component.to_s(16) }
          @image[x, y] = ChunkyPNG::Color.from_hex hex
        end
      end
      return @image
    end
  end
end
