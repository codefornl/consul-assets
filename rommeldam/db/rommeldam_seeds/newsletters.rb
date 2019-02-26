section "Nieuwsbrieven maken" do
  newsletter_body = [
    "We kiezen ervoor om in dit decennium naar de maan te gaan en de andere dingen te doen, niet omdat ze gemakkelijk zijn"\
    ", maar omdat ze moeilijk zijn, omdat dat doel zal dienen om het beste van"\
    "onze energie en vaardigheden, want die uitdaging is er een die we willen accepteren, eentje die we"\
    "zijn niet bereid om uit te stellen, en een die we willen winnen."\
     "Ruimtevluchten kunnen niet worden gestopt, dit is niet het werk van een enkele man of zelfs maar van een groep mannen."\
     "Het is een historisch proces dat de mensheid uitvoert in overeenstemming met de natuurwetten"\
     "van menselijke ontwikkeling."\
     "Velen zeggen dat exploratie een deel van onze bestemming is, maar het is eigenlijk onze plicht aan toekomstige generaties"\
     "en hun zoektocht om het voortbestaan van de menselijke soort te verzekeren."
  ]

  5.times do |n|
    Newsletter.create!(
      subject: "Niewsbrief nummer #{n}",
      segment_recipient: UserSegments::SEGMENTS.sample,
      from: 'no-reply@codefor.nl',
      body: newsletter_body.sample,
      sent_at: [Time.now, nil].sample
    )
  end
end
