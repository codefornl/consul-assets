section "Oefen notificaties voor beheerders" do
  AdminNotification.create!(
    title_nl: 'Heb je een idee?',
    body_nl: 'Je kunt een idee maken en er met anderen over in dialoog gaan.',

    link: Setting['url'] + '/proposals',
    segment_recipient: 'administrators'
  ).deliver

  AdminNotification.create!(
    title_nl: 'Help ons consul te vertalen',
    body_nl: 'Zie je teksten die niet kloppen? Help dan mee om Consul beter te maken',

    link: 'https://crwd.in/consul',
    segment_recipient: 'administrators'
  ).deliver

  AdminNotification.create!(
    title_nl: 'Je kunt nu locaties toevoegen aan ideeën en budgetten.',
    body_nl: 'Als je een idee of projectvoostel hebt kun je aangeven waar op de kaart dit is.',

    segment_recipient: 'administrators'
  ).deliver

  AdminNotification.create!(
    title_nl: 'We gaan een budget sluiten!',
    body_nl: 'Breng nog snel je idee in voor het budget is afgesloten!',

    segment_recipient: 'administrators',
    sent_at: nil
  )
end
