class AssignMailer < ActionMailer::Base
  default from: "antoine.mouliere@gmail.com"

  def notif_user_assignation(assignation)
    @assignation = assignation
    # mail(to: User.find(@assignation.user_offering_id).email, cci: 'antoine.mouliere@gmail.com', subject: 'Moulinette de Noel')
    mail(to: 'antoine.mouliere@gmail.com', subject: 'Moulinette de Noel')
  end
end
