# Fractal
Draws fractals in form of PNG images, using Ruby.


![mandelbrot-fractal](https://user-images.githubusercontent.com/26842759/27105899-2586bd88-5089-11e7-9a01-3e3fdb419a38.png)
Generated with `fractal -w=2000 -h=1100 --scale=2.92 --def=100 mandelbrot`


## Installation
RubyGems:
```shell
gem install fractal
```
Source:
```shell
git clone https://github.com/Demonstrandum/Fractal.git && cd ./Fractal/
gem build fractal.gemspec
gem install fractal-*.gem
```

## Usage
The current command-line arguments possible are:
  - `-w=`, the pixel width of the output image. (*Defaults to 300*), e.g. `-w=500`
  - `-h=`, the pixel height of the output image. (*Defaults to 300*), e.g. `-h=240`
  - `--def=`, (*optional*), the 'definition' of the image, the amount of calculations performed. e.g. `--def=255`
  - `--scale=`, (*optional*), the *zoom* level of the image, a higher value corresponds to a taller *imaginary* number line thus a smaller fractal is seen. e.g. `--scale=2.25`
  - **Last but not least**, (*required*), the type of fractal drawn. This argument is composed of just the fractal's name, put at any position in your list of arguments. e.g. `mandelbrot` (only one currently available)


An example command is:
```shell
fractal -w=400 -h=320 mandelbrot --scale=2 --def=100
```
