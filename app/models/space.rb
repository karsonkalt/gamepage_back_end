class Space
    include ActiveModel::Serializers::JSON

    attr_accessor :value

    def playable?
        true
    end

    def value_to_s
        if self.value == nil
            " "
        else
            self.value
        end
    end

end
