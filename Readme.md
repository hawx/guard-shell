# Guard-Shell

This little addition (1 proper line of code!) to guard allows you to run shell
commands when certain files are altered.


## Install
  
Make sure you have [guard](http://github.com/guard/guard) installed.

Install the gem with:

    gem install guard-shell

Or add it to your Gemfile:

    gem 'guard-shell'

And then add a basic setup to your Guardfile:

    guard init shell


## Usage

If you can do something in your shell, it is probably very easy to setup with 
guard-shell, here are a few examples.

#### Printing the Name of the File You Changed

    guard :shell do
      # if the block returns something, it will be passed to `#puts`
      watch(/(.*)/) {|m| m[0] + " was just changed" }
    end

#### Saying the Name of the File You Changed

    guard :shell do
      watch(/(.*)/) {|m| `say -v cello #{m[0]}` }
    end

#### Rebuilding LaTeX 

    guard :shell do
      watch /^([^\/]*)\.tex/ do |m|
        `pdflatex -shell-escape #{m[0]}`
        `rm #{m[1]}.log`
        
        count = `texcount -inc -nc -1 somehting.tex`.split('+').first
        "-> built #{m[1]}.pdf (#{count} words)"
      end
    end
    
    