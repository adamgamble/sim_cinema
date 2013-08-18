class Movie < ActiveRecord::Base
  has_many :proposals
  has_many :movie_roles
  has_many :actors, through: :movie_roles
  belongs_to :accepted_proposal, class_name: "Proposal"
  has_one :movie_studio, :through => :accepted_proposal

  state_machine :state, :initial => :proposal do
    event :accept_proposal do
      transition :proposal => :proposal_accepted
    end
  end
end
