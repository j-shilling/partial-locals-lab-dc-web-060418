# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(search_term)
    if search_term == nil
      return self.search('')
    end

    if search_term.empty?
      Student.all
    else
      Student.where("name LIKE ?", "%#{search_term}%")
    end

  end
end
