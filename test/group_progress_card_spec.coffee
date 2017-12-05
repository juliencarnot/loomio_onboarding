describe 'Group progress card', ->

  page = require '../../../../angular/test/protractor/helpers/page_helper.coffee'

  it 'is only visible to group coordinators', ->
    page.loadPath 'setup_progress_card_coordinator'
    page.expectText '.group-progress-card', 'Activate your group'

  it 'is only visible to group coordinators', ->
    page.loadPath 'setup_progress_card_member'
    page.expectNoElement '.group-progress-card'

  it 'adds a tick to completed tasks', ->
    page.loadPath 'setup_progress_card_coordinator'
    page.expectElement '.group-progress-card__complete'

  it 'displays a celebratory message when setup is complete', ->
    page.loadPath 'setup_progress_card_coordinator'
    page.clickLast '.group-progress-card__list-item'
    page.click '.poll-common-choose-type__poll-type--proposal'
    page.fillIn '.poll-common-form-fields__title', 'New proposal'
    page.click '.poll-common-form__submit'
    page.click '.group-theme__name--compact a'
    page.expectText '.group-progress-card', "Nice! Your group is good to go!"

  it 'can be dismissed', ->
    page.loadPath 'setup_progress_card_coordinator'
    page.click '.group-progress-card__dismiss'
    page.expectNoElement '.group-progress-card'

  it 'reappears when user starts a new group', ->
    page.loadPath 'setup_progress_card_coordinator'
    page.click '.group-progress-card__dismiss'
    page.click '.sidebar__list-item-button--start-group'
    page.fillIn '#group-name', 'Freshest group'
    page.click '.group-form__submit-button'
    page.expectText '.group-page', 'Activate your group'
