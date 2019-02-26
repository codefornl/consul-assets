section "Dingen verbergen" do
  Comment.with_hidden.flagged.reorder("RANDOM()").limit(30).each(&:hide)
  Debate.with_hidden.flagged.reorder("RANDOM()").limit(5).each(&:hide)
  Proposal.with_hidden.flagged.reorder("RANDOM()").limit(10).each(&:hide)
end

section "Verbergen bevestigen" do
  Comment.only_hidden.flagged.reorder("RANDOM()").limit(10).each(&:confirm_hide)
  Debate.only_hidden.flagged.reorder("RANDOM()").limit(5).each(&:confirm_hide)
  Proposal.only_hidden.flagged.reorder("RANDOM()").limit(5).each(&:confirm_hide)
end
