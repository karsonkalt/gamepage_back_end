class Space
    include ActiveModel::Serializers::JSON

    attr_accessor :value

    # TODO there should be some method to determine different piece state and flips.

    def playable?
        if self.value == nil
            true
        else
            false
        end
    end

    def value_to_s
        if self.value == nil
            " "
        else
            self.value
        end
    end

end
