require 'guard/compat/plugin'
require 'guard/shell/version'

module Guard
  class Shell < Plugin

    # Calls #run_all if the :all_on_start option is present.
    def start
      run_all if options[:all_on_start]
    end

    # Defined only to make callback(:stop_begin) and callback(:stop_end) working
    def stop
    end

    # Call #run_on_change for all files which match this guard.
    def run_all
      run_on_modifications(Compat.matching_files(self, Dir.glob('{,**/}*{,.*}')))
    end

    # Print the result of the command(s), if there are results to be printed.
    def run_on_modifications(res)
      $stdout.puts res if res
    end

  end

  class Dsl
    # Easy method to display a notification
    def n(msg, title='', image=nil)
      Compat::UI.notify(msg, :title => title, :image => image)
    end

    # Eager prints the result for stdout and stderr as it would be written when
    # running the command from the terminal. This is useful for long running
    # tasks.
    def eager(command)
      require 'pty'

      begin
        PTY.spawn command do |r, w, pid|
          begin
            $stdout.puts
            r.each {|line| print line }
          rescue Errno::EIO
            # the process has finished
          end
        end
      rescue PTY::ChildExited
        $stdout.puts "The child process exited!"
      end
    end
  end
end
