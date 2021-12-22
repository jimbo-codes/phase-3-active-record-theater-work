class Role < ActiveRecord::Base
    has_many :auditions
    def actors
        self.auditions.collect do |audition|
            audition.actor
        end
    end
    def locations
        self.auditions.collect do |audition|
            audition.location
        end
    end

    def lead
        finding = self.auditions.find_by hired: true 
        if finding
            finding
        else
            "no actor has been hired for this role"
        end
    end

    def understudy
        finder = self.auditions.where(hired: true).second
        finder
    end
end