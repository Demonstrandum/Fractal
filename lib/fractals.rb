require 'chunky_png'

module Fractals
  I = Complex 'i'
  def drag pos, pos_min, pos_max, out_min, out_max
    return (pos - pos_min) * (out_max - out_min) / (pos_max - pos_min) + out_min;
  end

  class Mandelbrot
    def initialize x, y
      @widh, @height = x, y
    end

    def draw x, y, scale=2, definition=100, type='rgb', colour='mono'
      a = ca = drag(x, 0, @width,  -scale, scale)
      b = cb = drag(y, 0, @height, -scale, scale)

      z = 0
      snap = 0
      (1..definition).each do |n|
        left  = (a**2 - b**2)
        right = 2 * a * b
        a = left  + ca
        b = right + cb

        if a + b > 16
          snap += n
          break
        end
      end

      return [drag(snap, 0, definition, 0, 255)] * 3
    end
  end
end

png = ChunkyPNG::Image.new ARGV[0].to_i, ARGV[1].to_i
fractal = Fractals::Mandelbrot.new png.width, png.height
(0..png.width - 1).each do |x|
  (0..png.height - 1).each do |y|
    r, g, b = fractal.draw x, y
    png[x][y] = ChunkyPNG::Colour.form_rgb r, g, b
  end
end
png.save('mandelbrot-fractal.png')
