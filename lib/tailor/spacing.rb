module Tailor

  # This module provides methods for detecting spacing problems on a single
  # line in a file.  The real intent here is to mix in to the FileLine class.
  module Spacing

    ##
    # Checks to see if there's whitespace at the end of the line.  Prints the
    #   number of whitespaces at the end of the line.
    #
    # @return [Boolean] Returns true if theres whitespace at the end of the
    #   line.
    def trailing_whitespace?
      count = self.trailing_whitespace_count

      if count > 0
        print_problem "Line contains #{count} trailing whitespace(s):"
        return true
      else
        return false
      end
    end

    ##
    # Checks to see if the line has trailing whitespace at the end of it. Note
    #   that this excludes empty lines that have spaces on them!
    #
    # @return [Number] Returns the number of trailing spaces at the end of the
    #   line.
    def trailing_whitespace_count
      spaces = self.scan(/(\x20+|\x09+)$/)
      if spaces.first.eql? nil
        return 0
      else
        return spaces.first.first.length
      end
    end

    ##
    # Checks to see if there's more than one one space after a comma.
    #
    # @return [Boolean] Returns true if there is more than one space after
    #   a comma.
    def more_than_one_space_after_comma?
      if self.scan(/\,\x20{2,}/).first.nil?
        return false
      elsif self.scan(/\,\x20{2,}/)
        print_problem "Line has a comma with > 1 space after it:"
        return true
      end
    end

    # Checks to see if there's no spaces after a comma and the next word.
    #
    # @return [Boolean] Returns true if there's no spaces between a comma and
    #   the next word.
    def no_space_after_comma?
      if self.scan(/\w\x20?\,\w/).first.nil?
        return false
      elsif self.scan(/\w\x20?\,\w/)
        print_problem "Line has a comma with 0 spaces after it:"
        return true
      end
    end

    ##
    # Checks to see if there's spaces before a comma.
    #
    # @return [Boolean] Returns true if there's any spaces before a comma.
    #   Returns nil if the line doesn't contain a comma.
    def space_before_comma?
      if self.scan(/\w\x20+\,/).first.nil?
        return false
      elsif self.scan(/\w\x20+\,/)
        print_problem "Line has at least one space before a comma:"
        return true
      else
        return nil
      end
    end

    ##
    # Checks to see if there's spaces after an open parenthesis.
    # 
    # @return [Boolean] Returns true if there's spaces after an open
    #   parenthesis.
    def space_after_open_parenthesis?
      if self.scan(/\(\x20+/).first.nil?
        return false
      elsif self.scan(/\(\x20+/)
        print_problem "Line has an open parenthesis with spaces after it:"
        return true
      end
    end

    ##
    # Checks to see if there's spaces after an open bracket.
    # 
    # @return [Boolean] Returns true if there's spaces after an open
    #   bracket.
    def space_after_open_bracket?
      if self.scan(/\[\x20+/).first.nil?
        return false
      elsif self.scan(/\[\x20+/)
        print_problem "Line has an open bracket with spaces after it:"
        return true
      end
    end

    ##
    # Checks to see if there's spaces before a closed parenthesis.
    # 
    # @return [Boolean] Returns true if there's spaces before a closed
    #   parenthesis.
    def space_before_closed_parenthesis?
      if self.scan(/\x20+\)/).first.nil?
        return false
      elsif self.scan(/\x20+\)/)
        print_problem "Line has a closed parenthesis with spaces before it:"
        return true
      end
    end

    ##
    # Checks to see if there's spaces before a closed brackets.
    # 
    # @return [Boolean] Returns true if there's spaces before a closed
    #   bracket.
    def space_before_closed_bracket?
      if self.scan(/\x20+\]/).first.nil?
        return false
      elsif self.scan(/\x20+\]/)
        print_problem "Line has a closed bracket with spaces before it:"
        return true
      end
    end
  end
end