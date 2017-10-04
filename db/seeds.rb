# frozen_string_literal: true

Alternative.delete_all
Question.delete_all

previous_question = nil
1.upto(5) do |question_number|
  question = Question.create(title: "Question #{question_number}",
                             parent: previous_question)
  1.upto(5) do |alternative_number|
    question.alternatives.create(title: "Alternative #{alternative_number}",
                                 position: alternative_number)
  end
  previous_question = question
end
