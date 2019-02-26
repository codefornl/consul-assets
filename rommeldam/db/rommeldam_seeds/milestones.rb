section "Mijlpaal statussen" do
  Milestone::Status.create(name: I18n.t('seeds.budgets.statuses.studying_project'))
  Milestone::Status.create(name: I18n.t('seeds.budgets.statuses.bidding'))
  Milestone::Status.create(name: I18n.t('seeds.budgets.statuses.executing_project'))
  Milestone::Status.create(name: I18n.t('seeds.budgets.statuses.executed'))
end

section "Mijlpalen maken" do
  [Budget::Investment, Proposal, Legislation::Process].each do |model|
    model.find_each do |record|
      rand(1..5).times do
        milestone = record.milestones.build(
          publication_date: Date.tomorrow,
          status_id: Milestone::Status.all.sample
        )

        random_locales.map do |locale|
          Globalize.with_locale(locale) do
            milestone.description = "Beschrijving in de taal #{locale}"
            milestone.title = I18n.l(Time.current, format: :datetime)
            milestone.save!
          end
        end
      end

      if rand < 0.8
        record.progress_bars.create!(kind: :primary, percentage: rand(ProgressBar::RANGE))
      end

      rand(0..3).times do
        progress_bar = record.progress_bars.build(
          kind:       :secondary,
          percentage: rand(ProgressBar::RANGE)
        )

        random_locales.map do |locale|
          Globalize.with_locale(locale) do
            progress_bar.title = "Beschrijving in de taal #{locale}"
            progress_bar.save!
          end
        end
      end
    end
  end
end
