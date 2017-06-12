require 'chunky_png'

module Fractals
  I = Complex 'i'
  class Julia
    def initialize x, y
      @x, @y = x, y
      @colour = colour
    end

    def calculate
      return I
    end

    def colour format='rgb', type='mono'
    end
  end
end

puts drawing.calculate # => Fractals::I => 0+1i => i => sqrt(-1)»”

png = ChunkyPNG::Image.new ARGV[0].to_i, ARGV[1].to_i
drawing = Fractals::Julia.new png.width, png.height
(0..png.width - 1.each do |x|
  (0..png.height - 1).each do |y|
    r, g, b = drawing.colour 'rgb', 'mono'
    png[x, y] = ChunkyPNG::Colour.form_rgb r, g, b
  end
end
png.save('julia-fractal.png', :interlace => true)
