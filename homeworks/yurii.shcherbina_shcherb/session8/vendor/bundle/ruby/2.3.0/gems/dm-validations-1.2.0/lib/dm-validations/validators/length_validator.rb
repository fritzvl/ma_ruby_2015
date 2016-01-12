module DataMapper
  module Validations
    class LengthValidator < GenericValidator

      # Initialize a length validator
      #
      # @param [Symbol] field_name
      #   the name of the field to validate
      #
      # @param [Hash] options
      #   the validator options
      #
      # @api semipublic
      def initialize(field_name, options)
        super

        @equal = options[:is]      || options[:equals]
        @range = options[:within]  || options[:in]
        @min   = options[:minimum] || options[:min]
        @max   = options[:maximum] || options[:max]

        if @min && @max
          @range ||= @min..@max
        end
      end

      # Test the resource field for validity
      #
      # @example when the resource field is valid
      #   validator.call(valid_resource)  # => true
      #
      # @example when the resource field is not valid
      #   validator.call(invalid_resource)  # => false
      #
      #
      # @param [Resource] target
      #   the Resource to test
      #
      # @return [Boolean]
      #   true if the field is valid, false if not
      #
      # @api semipublic
      def call(target)
        value = target.validation_property_value(field_name)
        return true if optional?(value)

        return true unless error_message = error_message_for(value)

        add_error(target, error_message, field_name)
        false
      end

      private

      # Return the error messages for the value if it is invalid
      #
      # @param [#to_s] value
      #   the value to test
      #
      # @return [String, nil]
      #   the error message if invalid, nil if not
      #
      # @api private
      def error_message_for(value)
        if error_message = send(validation_method, value_length(value.to_s))
          @options.fetch(:message, error_message)
        end
      end

      # Return the method to validate the value with
      #
      # @return [Symbol]
      #   the validation method
      #
      # @api private
      def validation_method
        @validation_method ||=
          if    @equal then :validate_equals
          elsif @range then :validate_range
          elsif @min   then :validate_min
          elsif @max   then :validate_max
          end
      end

      # Return the length in characters
      #
      # @param [#to_str] value
      #   the string to get the number of characters for
      #
      # @return [Integer]
      #   the number of characters in the string
      #
      # @api private
      def value_length(value)
        value.to_str.length
      end

      if RUBY_VERSION < '1.9'
        def value_length(value)
          value.to_str.scan(/./u).size
        end
      end

      # Validate the value length is equal to the expected length
      #
      # @param [Integer] length
      #   the value length
      #
      # @return [String, nil]
      #   the error message if invalid, nil if not
      #
      # @api private
      def validate_equals(length)
        return if length == @equal

        ValidationErrors.default_error_message(
          :wrong_length,
          humanized_field_name,
          @equal
        )
      end

      # Validate the value length is within expected range
      #
      # @param [Integer] length
      #   the value length
      #
      # @return [String, nil]
      #   the error message if invalid, nil if not
      #
      # @api private
      def validate_range(length)
        return if @range.include?(length)

        ValidationErrors.default_error_message(
          :length_between,
          humanized_field_name,
          @range.min,
          @range.max
        )
      end

      # Validate the minimum expected value length
      #
      # @param [Integer] length
      #   the value length
      #
      # @return [String, nil]
      #   the error message if invalid, nil if not
      #
      # @api private
      def validate_min(length)
        return if length >= @min

        ValidationErrors.default_error_message(
          :too_short,
          humanized_field_name,
          @min
        )
      end

      # Validate the maximum expected value length
      #
      # @param [Integer] length
      #   the value length
      #
      # @return [String, nil]
      #   the error message if invalid, nil if not
      #
      # @api private
      def validate_max(length)
        return if length <= @max

        ValidationErrors.default_error_message(
          :too_long,
          humanized_field_name,
          @max
        )
      end

    end # class LengthValidator

    module ValidatesLength
      extend Deprecate

      # Validates that the length of the attribute is equal to, less than,
      # greater than or within a certain range (depending upon the options
      # you specify).
      #
      # @option [Boolean] :allow_nil (true)
      #   true or false.
      #
      # @option [Boolean] :allow_blank (true)
      #   true or false.
      #
      # @option [Boolean] :minimum
      #   Ensures that the attribute's length is greater than or equal to
      #   the supplied value.
      #
      # @option [Boolean] :min
      #   Alias for :minimum.
      #
      # @option [Boolean] :maximum
      #   Ensures the attribute's length is less than or equal to the
      #   supplied value.
      #
      # @option [Boolean] :max
      #   Alias for :maximum.
      #
      # @option [Boolean] :equals
      #   Ensures the attribute's length is equal to the supplied value.
      #
      # @option [Boolean] :is
      #   Alias for :equals.
      #
      # @option [Range] :in
      #   Given a Range, ensures that the attributes length is include?'ed
      #   in the Range.
      #
      # @option [Range] :within
      #   Alias for :in.
      #
      # @example Usage
      #   require 'dm-validations'
      #
      #   class Page
      #     include DataMapper::Resource
      #
      #     property high, Integer
      #     property low, Integer
      #     property just_right, Integer
      #
      #     validates_length_of :high, :min => 100000000000
      #     validates_length_of :low, :equals => 0
      #     validates_length_of :just_right, :within => 1..10
      #
      #     # a call to valid? will return false unless:
      #     # high is greater than or equal to 100000000000
      #     # low is equal to 0
      #     # just_right is between 1 and 10 (inclusive of both 1 and 10)
      #
      def validates_length_of(*fields)
        validators.add(LengthValidator, *fields)
      end

      deprecate :validates_length, :validates_length_of
    end # module ValidatesLength
  end # module Validations
end # module DataMapper
