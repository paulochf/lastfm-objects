module FluidModel
    def hash_initialized(*fields)
        define_method(:initialize) do |params|
            missing = fields - params.keys.map! {|x| x.to_sym}

            fields.each do |x|
                if !Artists.method_defined?("#{x}")
                    class_eval("def #{x}() @#{x}; end")
                end

                if !Artists.method_defined?("#{x}=(val)")
                    class_eval("def #{x}=(val) @#{x} = val; end")
                end
            end

            params.each do |key, value|
                send("#{key}=", value) if self.methods.include?(:"#{key}=")
            end

            missing.each do |key|
                send("#{key}=", nil) if self.methods.include?(:"#{key}=")
            end
        end
    end
end
