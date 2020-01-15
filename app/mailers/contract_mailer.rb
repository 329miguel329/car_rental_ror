class ContractMailer < ApplicationMailer
  def send_contract(user, contract)
    @user = user
    @contract = contract
    @url  = 'http://localhost:3000'
    mail(to: [@user.email, @contract.user.email], subject: "CarRental contract #{Date.new}")
    # mail(to: @contract.user.email, subject: "CarRental contract #{Date.new}")
  end
end
