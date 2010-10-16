require 'guard'
require 'guard/guard'

module Guard
  class Shell < Guard
  
    VERSION = '0.1'

    # Print the result of the command, if there is a result
    # to be printed. (see README.md)
    #
    # @param res [Array] the result of the commands that have run
    #
    def run_on_change(res)
      puts res[0] if res[0]
    end

  end
end