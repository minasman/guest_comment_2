class Comment < ApplicationRecord
    belongs_to :store
    belongs_to :guest
    has_many :comment_updates
    accepts_nested_attributes_for :comment_updates
    validates :case_number, uniqueness: true

    scope :complaint, -> { where(comment_type: 'Complaint') }
    scope :compliment, -> { where(comment_type: 'Compliment') }
    scope :inquiry, -> { where(comment_type: 'Inquiry') }
    scope :open, -> { where(status: 'Open') }
    scope :closed, -> { where(status: 'Closed') }
    scope :eight_hundred, -> { where(source: '1-800#') }
    scope :local, -> { where(source: 'Local') }
    scope :voice, -> { where(source: 'VOICE') }



    COMMENT_TYPES = ["Complaint", "Compliment", "Inquiry"]
    SOURCE = ["1-800#", "VOICE", "Local"]
    URGENT = ["General", "Urgent"]
    CONTACT_TYPE = ["Phone", "Email", "Mail", "Voice", "Other"]
    ORDER_POINT = ["DT", "FC", "Mobile", "Kiosk", "Delivery", "Other"]
    STATUS = ["Open", "Closed"]

    def guest_attributes=(guest)
        self.guest = Guest.find_or_create_by(first_name: guest[:first_name])
        self.guest.update(guest)
    end

end
