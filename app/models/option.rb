class Option < ActiveRecord::Base
  attr_accessible :answer, :quiz_id, :inference, :option_id, :question
  has_many :options
  belongs_to :option
  belongs_to :quiz
  

  def self.json_tree(nodes)
    nodes.map do |node, sub_nodes|
      {:name => "<strong>A: " + node.answer + "</strong><br/><i>Q: <a href='/options/" + node.id.to_s() + "'>" + node.question + "</a></i><br/><span style='color: #800'>I: " + node.inference + "</span>", :id => node.id, :children => json_tree(node.options).compact}
    end
  end

  amoeba do
    enable
  end

end
