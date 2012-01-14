# Guard::Shell

This little addition to guard allows you to run shell commands when files are
altered.


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
guard-shell. It can take an option, `:all_on_start` which will, if set to true,
run all tasks on start.

There is also a shortcut method, `#n(msg, title='')`, which can be used to
display a notification within your watch blocks. See the examples for usage.

### Examples

#### Printing the Name of the File You Changed

    guard :shell do
      # if the block returns something, it will be printed with `puts`
      watch(/(.*)/) {|m| m[0] + " was just changed" }
    end

#### Saying the Name of the File You Changed and Displaying a Notification

    guard :shell do
      watch /(.*)/ do |m|
        n m[0], 'Changed'
        `say -v cello #{m[0]}`
      end
    end

#### Rebuilding LaTeX

    guard :shell do
      watch /^([^\/]*)\.tex/ do |m|
        `pdflatex -shell-escape #{m[0]}`
        `rm #{m[1]}.log`

        count = `texcount -inc -nc -1 #{m[0]}`.split('+').first
        msg = "Built #{m[1]}.pdf (#{count} words)"
        n msg, 'LaTeX'
        "-> #{msg}"
      end
    end
