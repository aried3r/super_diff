module SuperDiff
  module OperationSequences
    class Base < SimpleDelegator
      # rubocop:disable Lint/UnusedMethodArgument
      def to_diff(indent_level:, add_comma: false, collection_prefix: nil)
        raise NotImplementedError
      end
      # rubocop:enable Lint/UnusedMethodArgument

      def pretty_print(pp)
        pp.text "#{self.class.name}.new(["
        pp.group_sub do
          pp.nest(2) do
            pp.breakable
            pp.seplist(self) do |value|
              pp.pp value
            end
          end
        end
        pp.breakable
        pp.text("])")
      end
    end
  end
end
