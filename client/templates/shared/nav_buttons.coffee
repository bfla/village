Template.navButtons.helpers
  tribes: ()-> _.first(Tribes.find().fetch(), 3)