class Object

  class << self
    def add_variable(variable_name)
      define_method(variable_name.to_s.to_sym) do
        instance_variable_get("@#{variable_name}".to_sym)
      end
      define_method("#{variable_name}=".to_sym) do |value|
        instance_variable_set("@#{variable_name}".to_sym, value)
      end
    end
  end

end
