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
    attr_accessor :colorType

    def initialize image
      @width, @height = image.width, image.height
      @image = image
    end

    def calculate a, b, c_arr
      ca, cb = c_arr
      left = a * a - b * b
      right = 2 * a * b
      a = left  + ca
      b = right + cb

      return [a, b]
    end

    def draw definition=255, scale=2
      scaleWidth  = scale.to_f
      scaleHeight = scale.to_f * (@height.to_f / @width.to_f)
      definition = definition.to_f
      (0..@width - 1).each do |x|
        (0..@height - 1).each do |y|
          a = ca = drag(x, 0, @width,  -scaleWidth, scaleWidth)
          b = cb = drag(y, 0, @height, -scaleHeight, scaleHeight)

          snap = 0
          while snap < definition
            a, b = calculate(a, b, [ca, cb])
            if a * a + b * b > 16
              break
            end
            snap += 1
          end
          # TODO: Use colorType as option non-monochromatic images
          #       (allow colourful fractals), currently only greyscale
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
