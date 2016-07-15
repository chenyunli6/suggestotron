class Topic < ApplicationRecord
  has_many :votes, dependent: :destroy
  scope :orderTopics,-> {select("topics.*, count(votes.id) AS votes_count").
  joins(:votes).
  group("topics.id").
  order("votes_count DESC")}
end
