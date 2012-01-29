require 'guard'
require 'guard/guard'
require 'guard/watcher'

module Guard
  class Shell < Guard
  
    VERSION = '0.2.0'
    
    # Calls #run_all if the :all_on_start option is present.
    def start
      run_all if options[:all_on_start]
    end
    
    # Call #run_on_change for all files which match this guard.
    def run_all
      run_on_change(Watcher.match_files(self, Dir.glob('{,**/}*{,.*}').uniq))
    end

    # Print the result of the command, if there is a result to be printed.
    def run_on_change(res)
      puts res if res
    end
    
  end
  
  class Dsl
    # Easy method to display a notification
    def n(msg, title='')
      ::Guard::Notifier.notify(msg, :title => title)
    end
  end
end