class Comment < ApplicationRecord
  #validatino of content
  validates :content, presence: true
  validate :domain_chech

  def domain_chech
    a=content.split(' ')
    a=a.map{ |x|
      if x.include?("fuck")
        x=x.gsub("fuck","****")
      elsif x.include?("shit")
        x=x.gsub("shit","****")
      elsif x.include?("hell")
        x=x.gsub("hell","****")
      else
        x
      end
      }
      write_attribute(:content, a.join(" "))
  end

end
