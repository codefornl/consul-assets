section "Creating header and cards for the homepage" do

  def create_image_attachment(type)
    {
      cached_attachment: Rails.root.join("db/rommeldam_seeds/images/#{type}_background.jpg"),
      title: "#{type}_background.jpg",
      user: User.first
    }
  end

  Widget::Card.create!(
    title_nl: 'Rommeldam',
    
    description_nl: 'Open software voor participatie.',

    link_text_nl: 'Meer informatie',

    label_nl: 'Welkom bij',


    link_url: 'http://consulproject.org/',
    header: true,
    image_attributes: create_image_attachment('header')
  )

  Widget::Card.create!(
    title_nl: 'How do debates work?',

    description_nl: 'Anyone can open threads on any subject, creating separate spaces where people can discuss the proposed topic. Debates are valued by everybody, to highlight the most important issues.',
    link_text_nl: 'Over debatten',

    label_nl: 'Debatten',

    link_url: 'https://youtu.be/zU_0UN4VajY',
    header: false,
    image_attributes: create_image_attachment('debate')
  )

  Widget::Card.create!(
    title_nl: 'Hoe werken ideeën?',

    description_nl: "A space for everyone to create a citizens' proposal and seek supports. Proposals which reach to enough supports will be voted and so, together we can decide the issues that matter to us.",
    link_text_nl: 'Meer over ideeën',

    label_nl: 'Ideeën',

    link_url: 'https://youtu.be/ZHqBpT4uCoM',
    header: false,
    image_attributes: create_image_attachment('proposal')
  )

  Widget::Card.create!(
    title_nl: 'Hoe werken budgetten?',

    description_nl: " Participatory budgets allow citizens to propose and decide directly how to spend part of the budget, with monitoring and rigorous evaluation of proposals by the institution. Maximum effectiveness and control with satisfaction for everyone.",

    link_text_nl: 'More about Participatory budgets',

    label_nl: 'Participatory budgets',

    link_url: 'https://youtu.be/igQ8KGZdk9c',
    header: false,
    image_attributes: create_image_attachment('budget')
  )
end
