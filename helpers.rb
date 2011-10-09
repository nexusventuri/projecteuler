RED="\e[00;31m"
YELLOW="\e[00;33m"
GREEN="\e[00;32m"
WHITE="\e[01;37m"
LIGHT_BLUE="\e[01;34m"

class BuildResult
  attr_reader :output, :shell_result
  def initialize(basedir, output, shell_result)
    @output, @shell_result = output, shell_result
    @basedir = basedir
  end

  def success?
    @shell_result == 0
  end

  def problem?
    !problem_number.nil?
  end

  def problem_number
    @basedir[/\d+$/]
  end

  def has_solution?
    !@output[/\* And the solution is\.\.\.\./].nil?
  end

  def pretty_print_result
    puts RED
    puts GREEN if $? == 0

    puts @output

    puts WHITE
    $? == 0
  end
end
