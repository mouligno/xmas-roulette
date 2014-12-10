class GiftAssociationsController < ApplicationController
  expose(:gift_association, attributes: :ga_params)
  expose(:gift_associations) { GiftAssociation.all }

  def create
    if gift_association.save
      redirect_to new_gift_association_path()
    else
      render :new
    end
  end

  def update
    if gift_association.save
      redirect_to(gift_association)
    else
      render :edit
    end
  end

  def assign
    users = User.all
    rules = Unoffering.all
    themes = ['De Platon aux platines', 'Coquin comme cochon', 'A fond la forme', '#glou #miam', "J'apprend en m'amusant"]

    users.each do |u|
      not_possible_match = []
      not_possible_match << u.id

      GiftAssociation.all.each do |g|
        not_possible_match << g.user_receiving_id
      end

      rules.each do |r|
        if u.id == r.user_offering_id
          not_possible_match << r.user_not_offering_to
        end
      end

      match = false
      user_match = ''

      while match == false
        m = User.all.sample(1)

        if not_possible_match.include?(m.first.id) == false
          match = true
          user_match = m.first.id
        end
      end

      ga = GiftAssociation.new( user_offering_id: u.id,
                                user_receiving_id: user_match,
                                gift_theme: themes.sample(1).to_s)
      ga.save

    end

    redirect_to gift_associations_path()
  end

  def mail
    gift_associations.each do |g|
      AssignMailer.notif_user_assignation(g).deliver
    end

    redirect_to gift_associations_path()
  end


  private
    def ga_params
      params.require(:unoffering).permit(:user_offering_id, :user_receiving_id, :gift_theme)
    end
end
