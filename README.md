# Fractal
Draws fractals in form of PNG images, using Ruby.


![mandelbrot-fractal](https://user-images.githubusercontent.com/26842759/27105899-2586bd88-5089-11e7-9a01-3e3fdb419a38.png)
Generated with `fractal -w=2000 -h=1100 --scale=2.92 --def=100 mandelbrot --color=mono`


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
  - `--color=`, (*Defaults to mono*), allows you to draw the image in colour or monochromatically, e.g. `--color=mono` or `--color=multi` which is the same as `--color=rainbow`
  - `--def=`, (*optional*), the 'definition' of the image, the amount of calculations performed or iterations to the formula. e.g. `--def=100`
  - `--scale=`, (*optional*), the *zoom* level of the image, a higher value corresponds to a taller *imaginary* number line thus a smaller fractal is seen. e.g. `--scale=2.25`
  - `--complex=` (*only needed for the Julia set*) this sets a complex coordinate for the Julia set, in the form of `a±bi` (a and b real numbers and i is the square root of -1 which can take on all values in the complex plane), e.g. `-0.8+0.4i`
  - **Last but not least**, (*required*), the type of fractal drawn. This argument is composed of just the fractal's name, put at any position in your list of arguments. e.g. `mandelbrot` or `julia` (only ones currently available)


Example commands are:

For the Mandelbrot set:
```shell
fractal -w=400 -h=320 --color=multi mandelbrot --scale=2 --def=200
```

For the Julia set, which requires the complex coordinate argument:
```shell
fractal julia -w=1000 -h=1000 --color=multi --complex=-0.8+0.156i --def=100 --scale=1.5
```
which generated:
![julia-fractal](https://user-images.githubusercontent.com/26842759/27133600-a105798c-510a-11e7-95fc-00f6a4977ea6.png)
