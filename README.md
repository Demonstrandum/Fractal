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
  - `-o=`, (*optional*) is the location in which to save your image, the `-o=` part is not required if you just write the file location with a `.png` at the end.
  - `--def=`, (*optional*), the 'definition' of the image, the amount of calculations performed or iterations to the formula. e.g. `--def=100`
  - `--scale=`, (*optional*), the *zoom* level of the image, a higher value corresponds to a taller *imaginary* number line thus a smaller fractal is seen. e.g. `--scale=2.25`
  - `--offset=x,y` (*optional*), the offset will make you able
to position yourself where you like on the plan.
(offsetting where the centre is, before (0,0) was
the centre of the image, but now your offset is the centre).
Make sure you give an x and y value as numerics,
ints and floats work both and don't leave any space between the comma).
  - `--complex=` (*only needed for the Julia set*) this sets a complex coordinate for the Julia set, in the form of `a±bi` (a and b real numbers and i is the square root of -1 which can take on all values in the complex plane), e.g. `-0.8+0.4i`
  - **Last but not least**, (*required*), the type of fractal drawn. This argument is composed of just the fractal's name, put at any position in your list of arguments. e.g. `mandelbrot` or `julia` (only ones currently available)


Example commands are:

### Mandelbrot
For the Mandelbrot set:
```shell
fractal -w=400 -h=320 --color=multi mandelbrot --scale=2 --def=200
```

#### Offser & Zoom
Using some of our offset argument, we can get to some very pretty places...

```
fractal mandelbrot --offset=-0.7463,0.1102 --scale=0.005 --def=1000 -o=close_1.png
```
will generate:

![closeup-1](https://user-images.githubusercontent.com/26842759/42823116-a7edc926-89d4-11e8-9000-52b463148a62.png)

<br />

```
fractal mandelbrot --offset=-0.7453,0.1127 --scale=6.5e-4 --def=1000 -o=close_2.png
```
will generate:

![closeup-2](https://user-images.githubusercontent.com/26842759/42823162-c69f8ecc-89d4-11e8-8c96-41e07ea9c067.png)

Check out: [cuug.ab.ca/dewara/mandelbrot/](http://www.cuug.ab.ca/dewara/mandelbrot/Mandelbrowser.html)
for more prime locations (This is where the coordinates for the two above come from).

### Julia
For the Julia set, which requires the complex coordinate argument:
```shell
fractal julia -w=1000 -h=1000 --color=multi --complex=-0.8+0.156i --def=100 --scale=1.5
```
which generated:
![julia-fractal](https://user-images.githubusercontent.com/26842759/27133600-a105798c-510a-11e7-95fc-00f6a4977ea6.png)
