module SuperDiff
  module Differs
    class MultilineString < Base
      def self.applies_to?(expected, actual)
        expected.is_a?(::String) && actual.is_a?(::String) &&
          (expected.include?("\n") || actual.include?("\n"))
      end

      def call
        DiffFormatters::MultilineString.call(
          operations,
          indent_level: indent_level,
        )
      end

      private

      def operations
        OperationalSequencers::MultilineString.call(
          expected: expected,
          actual: actual,
          extra_operational_sequencer_classes: extra_operational_sequencer_classes,
          extra_diff_formatter_classes: extra_diff_formatter_classes,
        )
      end
    end
  end
end
