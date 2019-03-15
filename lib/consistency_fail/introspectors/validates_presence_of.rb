require 'consistency_fail/index'

module ConsistencyFail
  module Introspectors
    class ValidatesPresenceOf
      def instances(model)
        model.validators.select do |v|
          v.class == ActiveRecord::Validations::PresenceValidator
        end
      end

      def desired(model)
        instances(model).map do |v|
          table_attributes = v.attributes.select{|a| model.column_names.include?(a.to_s)}
          table_attributes.map do |attribute|
            scoped_columns = v.options[:scope] || []
            ConsistencyFail::Index.new(model,
                                       model.table_name,
                                       [attribute, *scoped_columns])
          end
        end.flatten
      end
      private :desired

      def missing_indexes(model)
        return [] unless model.connection.tables.include? model.table_name
        existing = TableData.new.null_constraints(model).map{|col| col.name }

        desired(model).reject do |index|
          existing.include?(index.columns.first)
        end
      end
    end
  end
end
