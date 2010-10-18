# Guard-Shell

This little addition (1 proper line of code!) to guard allows you to run shell
commands when certain files are altered. It is very simple to setup so here is
a very quick guide.


#### Creating Backups of Files On Change

    guard 'shell' do
      # create a copy of the file with '.backup' at the end
      watch('(.*)') {|m| `cp #{m[0]} #{m[0]}.backup` }
    end


#### Rebuilding a LaTeX File

    guard 'shell' do
      # builds latex file to pdf and hides output
      watch('(.*).tex') {|m| `pdflatex -shell-escape #{m[0]} 1>/dev/null` }
    end


#### Saying the Name of the File You Changed

    guard 'shell' do
      watch('(.*)') {|m| `say #{m[0]}` }
    end
    

And pretty much anything else you can think of!
