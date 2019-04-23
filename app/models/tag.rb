class Tag < ApplicationRecord
    has_many :taggings, dependent: :destroy
    has_many :questions, through: :taggings

    validates :name, presence: true, uniqueness: { case_sensitive: false }

    before_validation :downcase_name

    private

    def downcase_name
        self.name&.downcase!
            # equivalent to:
            # self.name && self.name.downcase!
            # check name is exist and make it downcase
    end

end